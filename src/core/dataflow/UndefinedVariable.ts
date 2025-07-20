/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Scene } from '../../Scene';
import { DataflowProblem, FlowFunction } from './DataflowProblem';
import { Local } from '../base/Local';
import { Value } from '../base/Value';
import { ArrayType } from '../base/Type';
import { ArkArrayRef } from '../base/Ref';
import { ClassType, NullType, UndefinedType } from '../base/Type';
import { ArkAssignStmt, ArkIfStmt, ArkInvokeStmt, ArkReturnStmt, Stmt } from '../base/Stmt';
import { ArkMethod } from '../model/ArkMethod';
import { MethodParameter } from '../model/builder/ArkMethodBuilder';
import { Constant } from '../base/Constant';
import { AbstractRef, ArkInstanceFieldRef, ArkStaticFieldRef } from '../base/Ref';
import { DataflowSolver } from './DataflowSolver';
import { ArkInstanceInvokeExpr, ArkNewArrayExpr, ArkStaticInvokeExpr } from '../base/Expr';
import { FileSignature, NamespaceSignature } from '../model/ArkSignature';
import { ArkClass } from '../model/ArkClass';
import { LocalEqual, RefEqual } from './Util';
import { INSTANCE_INIT_METHOD_NAME, STATIC_INIT_METHOD_NAME } from '../common/Const';
import { ArkField } from '../model/ArkField';
// import Logger, { LOG_MODULE_TYPE } from '../../utils/logger';
import * as fs from 'fs';
import { PathEdge } from './Edge';
import { NPDReportManager, NPDReport } from './NPDReport';

// const logger = Logger.getLogger(LOG_MODULE_TYPE.ARKANALYZER, 'Scene');

export class UndefinedVariableChecker extends DataflowProblem<Value> {
    zeroValue: Constant = new Constant('undefined', UndefinedType.getInstance());
    entryPoint: Stmt;
    entryMethod: ArkMethod;
    scene: Scene;
    classMap: Map<FileSignature | NamespaceSignature, ArkClass[]>;
    globalVariableMap: Map<FileSignature | NamespaceSignature, Local[]>;
    // outcomes: Outcome[] = [];
    constructor(stmt: Stmt, method: ArkMethod) {
        super();
        this.entryPoint = stmt;
        this.entryMethod = method;
        this.scene = method.getDeclaringArkFile().getScene();
        this.classMap = this.scene.getClassMap();
        this.globalVariableMap = this.scene.getGlobalVariableMap();
    }

    getEntryPoint(): Stmt {
        return this.entryPoint;
    }

    getEntryMethod(): ArkMethod {
        return this.entryMethod;
    }

    isUndefined(val: Value): boolean {
        if (val instanceof Constant) {
            let constant: Constant = val as Constant;
            if (constant.getType() instanceof UndefinedType) {
                return true;
            }
        }
        return false;
    }

    isNull(val: Value): boolean {
        if (val instanceof Constant) {
            let constant: Constant = val as Constant;
            if (constant.getType() instanceof NullType) {
                return true;
            }
        }
        return false;
    }

    getNormalFlowFunction(srcStmt: Stmt, tgtStmt: Stmt): FlowFunction<Value> {
        let checkerInstance: UndefinedVariableChecker = this;
        return new (class implements FlowFunction<Value> {
            getDataFacts(dataFact: Value): Set<Value> {
                let ret: Set<Value> = new Set();
                if (checkerInstance.getEntryPoint() === srcStmt && checkerInstance.getZeroValue() === dataFact) {
                    ret.add(checkerInstance.getZeroValue());
                    return ret;
                }
                if (srcStmt instanceof ArkAssignStmt) {
                    checkerInstance.insideNormalFlowFunction(ret, srcStmt, dataFact);
                }
                // newly added
                // handle library API invocation cases where datafacts should be retained directly
                if (srcStmt instanceof ArkInvokeStmt){
                    ret.add(dataFact);
                }

                // to be added:
                // handle if-statements' flow function
                if (srcStmt instanceof ArkIfStmt){
                    ret.add(dataFact);
                }
                return ret;
            }
        })();
    }

    insideNormalFlowFunction(ret: Set<Value>, srcStmt: ArkAssignStmt, dataFact: Value): void {
        if (!this.factEqual(srcStmt.getDef()!, dataFact)) {
            if (!(dataFact instanceof Local && dataFact.getName() === srcStmt.getDef()!.toString())) {
                ret.add(dataFact);
            }
        }
        let ass: ArkAssignStmt = srcStmt as ArkAssignStmt;
        let assigned: Value = ass.getLeftOp();
        let rightOp: Value = ass.getRightOp();
        // to be revised
        // resolve undefined and null together
        if (this.getZeroValue() === dataFact) {
            // 处理直接对于变量赋值 undefined 或 null 的情况
            if (this.isUndefined(rightOp) || this.isNull(rightOp)) {
                ret.add(assigned);
            }
            // 处理未初始化数组的情况
            if (rightOp instanceof ArkNewArrayExpr) {
                let arrayRef = new ArkArrayRef(assigned as Local, rightOp.getSize());
                ret.add(arrayRef);
            }
        } else if (this.factEqual(rightOp, dataFact) || rightOp.getType() instanceof UndefinedType || rightOp.getType() instanceof NullType) {
            ret.add(assigned);
        } else if (rightOp instanceof ArkInstanceFieldRef) {
            // const base = rightOp.getBase();
            // if (base === dataFact || (!base.getDeclaringStmt() && base.getName() === dataFact.toString())) {
            //     this.outcomes.push(new Outcome(rightOp, ass));
            //     logger.info('undefined base');
            //     logger.info(srcStmt.toString());
            //     logger.info(srcStmt.getOriginPositionInfo().toString());
            // }
        } else if (dataFact instanceof ArkInstanceFieldRef && rightOp === dataFact.getBase()) {
            const field = new ArkInstanceFieldRef(srcStmt.getLeftOp() as Local, dataFact.getFieldSignature());
            ret.add(field);
        } else if (rightOp instanceof Local && rightOp.getType() instanceof ArrayType && dataFact instanceof ArkArrayRef) {
            const base = dataFact.getBase();
            if (base instanceof Local && this.factEqual(base, rightOp)) {
                let arrayRef = new ArkArrayRef(assigned as Local, dataFact.getIndex());
                ret.add(arrayRef);
            }
        } else if (rightOp instanceof ArkArrayRef && dataFact instanceof ArkArrayRef) {
            const visitedIndex = rightOp.getIndex();
            const maxIndex = dataFact.getIndex();
            if (visitedIndex < maxIndex) {
                ret.add(assigned);
            }
        }
    }

    getCallFlowFunction(srcStmt: Stmt, method: ArkMethod): FlowFunction<Value> {
        let checkerInstance: UndefinedVariableChecker = this;
        return new (class implements FlowFunction<Value> {
            getDataFacts(dataFact: Value): Set<Value> {
                const ret: Set<Value> = new Set();
                if (checkerInstance.getZeroValue() === dataFact) {
                    checkerInstance.insideCallFlowFunction(ret, method);
                } else {
                    const callExpr = srcStmt.getExprs()[0];
                    if (
                        callExpr instanceof ArkInstanceInvokeExpr &&
                        dataFact instanceof ArkInstanceFieldRef
                    ) {
                        if (dataFact.getBase().getName() === 'this') {
                            // 如果dataFact是this.属性的形式，则直接返回
                            ret.add(dataFact);
                        }

                        if (callExpr.getBase().getName() === dataFact.getBase().getName()) {
                            // todo:base转this
                            const thisRef = new ArkInstanceFieldRef(
                                new Local('this', new ClassType(method.getDeclaringArkClass().getSignature())),
                                dataFact.getFieldSignature()
                            );
                            ret.add(thisRef);
                        }
                    } else if (
                        callExpr instanceof ArkInstanceInvokeExpr &&
                        dataFact instanceof ArkStaticFieldRef
                    ) {
                        // 如果dataFact是静态属性的形式，则直接返回
                        ret.add(dataFact);
                    } else if (
                        callExpr instanceof ArkStaticInvokeExpr &&
                        dataFact instanceof ArkStaticFieldRef &&
                        callExpr.getMethodSignature().getDeclaringClassSignature() === dataFact.getFieldSignature().getDeclaringSignature()
                    ) {
                        ret.add(dataFact);
                    }
                }
                checkerInstance.addParameters(srcStmt, dataFact, method, ret);
                return ret;
            }
        })();
    }

    insideCallFlowFunction(ret: Set<Value>, method: ArkMethod): void {
        ret.add(this.getZeroValue());
        // 加上调用函数能访问到的所有静态变量，如果不考虑多线程，加上所有变量，考虑则要统计之前已经处理过的变量并排除
        for (const field of method.getDeclaringArkClass().getStaticFields(this.classMap)) {
            if (field.getInitializer() === undefined) {
                ret.add(new ArkStaticFieldRef(field.getSignature()));
            }
        }
        for (const local of method.getDeclaringArkClass().getGlobalVariable(this.globalVariableMap)) {
            ret.add(local);
        }
        // 加上所有未定义初始值的属性
        if (method.getName() === INSTANCE_INIT_METHOD_NAME || method.getName() === STATIC_INIT_METHOD_NAME) {
            for (const field of method.getDeclaringArkClass().getFields()) {
                this.addUndefinedField(field, method, ret);
            }
        }
    }

    addUndefinedField(field: ArkField, method: ArkMethod, ret: Set<Value>): void {
        let defined = false;
        for (const stmt of method.getCfg()!.getStmts()) {
            const def = stmt.getDef();
            if (def instanceof ArkInstanceFieldRef && def.getFieldSignature() === field.getSignature()) {
                defined = true;
                break;
            }
        }
        if (!defined) {
            const fieldRef = new ArkInstanceFieldRef(new Local('this', new ClassType(method.getDeclaringArkClass().getSignature())), field.getSignature());
            ret.add(fieldRef);
        }
    }

    addParameters(srcStmt: Stmt, dataFact: Value, method: ArkMethod, ret: Set<Value>): void {
        const callStmt = srcStmt as ArkInvokeStmt;
        const args = callStmt.getInvokeExpr().getArgs();
        for (let i = 0; i < args.length; i++) {
            if (args[i] === dataFact || (this.isUndefined(args[i]) && this.getZeroValue() === dataFact)) {
                const realParameter = method.getCfg()!.getStartingBlock()!.getStmts()[i].getDef();
                if (realParameter) {
                    ret.add(realParameter);
                }
            } else if (dataFact instanceof ArkInstanceFieldRef && dataFact.getBase().getName() === args[i].toString()) {
                const realParameter = method.getCfg()!.getStartingBlock()!.getStmts()[i].getDef();
                if (realParameter) {
                    const retRef = new ArkInstanceFieldRef(realParameter as Local, dataFact.getFieldSignature());
                    ret.add(retRef);
                }
            } else if (dataFact instanceof ArkArrayRef && dataFact.getBase().getName() === args[i].toString()) {
                const realParameter = method.getCfg()!.getStartingBlock()!.getStmts()[i].getDef();
                if (realParameter) {
                    const retRef = new ArkArrayRef(realParameter as Local, dataFact.getIndex());
                    ret.add(retRef);
                }
            }
        }
    }

    getExitToReturnFlowFunction(srcStmt: Stmt, tgtStmt: Stmt, callStmt: Stmt): FlowFunction<Value> {
        let checkerInstance: UndefinedVariableChecker = this;
        return new (class implements FlowFunction<Value> {
            getDataFacts(dataFact: Value): Set<Value> {
                let ret: Set<Value> = new Set<Value>();
                if (dataFact === checkerInstance.getZeroValue()) {
                    ret.add(checkerInstance.getZeroValue());
                }
                // 需要将局部变量映射到调用过程的输入变量
                // 对于以this开头的域变量，可以不做处理直接返回
                if (dataFact instanceof ArkInstanceFieldRef) {
                    const base = dataFact.getBase();
                    if (base instanceof Local && base.getName() === 'this') {
                        ret.add(dataFact);
                    }
                }
                if (srcStmt instanceof ArkReturnStmt) {
                    const retVal = srcStmt.getOp();
                    if (checkerInstance.isUndefined(retVal) || checkerInstance.isNull(retVal) || checkerInstance.factEqual(retVal, dataFact)) {
                        const retLocal = callStmt.getDef();
                        if (retLocal instanceof Local) {
                            ret.add(retLocal);
                        }
                    }
                }
                return ret;
            }
        })();
    }

    getCallToReturnFlowFunction(srcStmt: Stmt, tgtStmt: Stmt): FlowFunction<Value> {
        let checkerInstance: UndefinedVariableChecker = this;
        return new (class implements FlowFunction<Value> {
            getDataFacts(dataFact: Value): Set<Value> {
                const ret: Set<Value> = new Set();
                if (checkerInstance.getZeroValue() === dataFact) {
                    ret.add(checkerInstance.getZeroValue());
                }
                const defValue = srcStmt.getDef();
                if (!(defValue && defValue === dataFact)) {
                    ret.add(dataFact);
                }
                return ret;
            }
        })();
    }

    createZeroValue(): Value {
        return this.zeroValue;
    }

    getZeroValue(): Value {
        return this.zeroValue;
    }

    factEqual(d1: Value, d2: Value): boolean {
        if (d1 instanceof Constant && d2 instanceof Constant) {
            return d1 === d2;
        } else if (d1 instanceof Local && d2 instanceof Local) {
            return LocalEqual(d1, d2);
        } else if (d1 instanceof AbstractRef && d2 instanceof AbstractRef) {
            return RefEqual(d1, d2);
        }
        return false;
    }

    // public getOutcomes(): Outcome[] {
    //     return this.outcomes;
    // }
}

export class UndefinedVariableSolver extends DataflowSolver<Value> {
    constructor(problem: UndefinedVariableChecker, scene: Scene) {
        super(problem, scene);
    }

    public toResult(className: String, methodName: String, params: MethodParameter[], reportManager: NPDReportManager): void {
        if (!fs.existsSync('./output')) {
            fs.mkdirSync('./output');
        }

        // print pathedge results
        // for (const pathEdge of this.pathEdgeSet) {
        //     let sNode = pathEdge.edgeStart.node;
        //     let eNode = pathEdge.edgeEnd.node;
        //     console.log("[node: " + "{Stmt: {" + sNode + "} method: {" + sNode.getCfg().getDeclaringMethod().getSignature() + "}}" + ", fact: " + pathEdge.edgeStart.fact + "]\n ----->\n[node:" + "{Stmt: {" + eNode + "} method: {" + eNode.getCfg().getDeclaringMethod().getSignature() + "}}" + ", fact: " + pathEdge.edgeEnd.fact + "]\n");
        // }
        let methodSig = className + '.' + methodName + '(' + params.map(p => p.getName()).join(', ') + ')';
        const fileStream = fs.createWriteStream(`./output/pathedge_${methodSig}.txt`);
        for (const pathEdge of this.pathEdgeSet) {
            let sNode = pathEdge.edgeStart.node;
            let eNode = pathEdge.edgeEnd.node;
            const output = `[node: {Stmt: {${sNode}} method: {${sNode.getCfg().getDeclaringMethod().getSignature()}}}, fact: ${pathEdge.edgeStart.fact}]\n ----->\n[node: {Stmt: {${eNode}} method: {${eNode.getCfg().getDeclaringMethod().getSignature()}}}, fact: ${pathEdge.edgeEnd.fact}]\n\n`;
            fileStream.write(output);
        }
        fileStream.end();
        // console.log(`path edges has been outputed to ./output/pathedge_${methodSig}.txt`);

        this.extractNPDReports(methodSig, this.pathEdgeSet, reportManager);
    }

    protected extractNPDReports(methodSig:string, edges: Set<PathEdge<Value>>, reportManager:NPDReportManager) {    
        const pathsByFact = new Map<Value, PathEdge<Value>[]>();
    
        for (const edge of edges) {
            const fact = edge.edgeEnd.fact;
            if (!pathsByFact.has(fact)) {
                pathsByFact.set(fact, []);
            }
            pathsByFact.get(fact)!.push(edge);
        }
    
        for (const [fact, path] of pathsByFact.entries()) {
            if (fact === this.zeroFact)
                continue;
            for (const edge of path) {
                const stmt = edge.edgeEnd.node;
                if (stmt === null || stmt === undefined) {
                    continue;
                }
                if (this.isNullPointerDereferenceTriggered(stmt, fact)) {
                    const report = new NPDReport(fact, stmt, `Variable '${fact}' used before being defined (undefined)`);
                    // TODO: complement the def-use chain searching
                    this.retrieveDataFlowPaths(fact, stmt, report);
                    reportManager.addReport(methodSig, report);
                    break; 
                }
            }
        }
    }

    protected isNullPointerDereferenceTriggered(stmt: Stmt, fact: Value): boolean {
        let triggered = false;
        // stmt has invocation expr && input fact the same as the base local
        if (stmt.containsInvokeExpr()) {
            const invokeExpr = stmt.getInvokeExpr();
            if (invokeExpr) {
                // ArkStaticInvokeExpr, ArkInstanceInvokeExpr, or ArkPtrInvokeExpr
                if (invokeExpr instanceof ArkInstanceInvokeExpr) {
                    const base = invokeExpr.getBase();
                    if (this.problem.factEqual(base, fact)) {
                        triggered = true;
                    }
                }
            }
        }
        // 诸如 this.p.pp 且 this.p 为空指针的情况
        if (stmt instanceof ArkAssignStmt) {
            const rightOp = stmt.getRightOp();
            if (rightOp instanceof ArkInstanceFieldRef) {
                const base = rightOp.getBase();
                if (this.problem.factEqual(base, fact)) {
                    triggered = true;
                }
            }

            const assigned = stmt.getLeftOp();
            if (assigned instanceof ArkInstanceFieldRef) {
                const base = assigned.getBase();
                if (this.problem.factEqual(base, fact)) {
                    triggered = true;
                }
            }
        }
        // 诸如 a[0] 且 a 为空指针的情况
        if (stmt instanceof ArkAssignStmt) {
            const rightOp = stmt.getRightOp();
            const assigned = stmt.getLeftOp();
            if (rightOp instanceof ArkArrayRef && this.problem.factEqual(rightOp.getBase(), fact)) {
                triggered = true;
            }
            if (assigned instanceof ArkArrayRef && this.problem.factEqual(assigned.getBase(), fact)) {
                triggered = true;
            }
        }
        return triggered;
    }

    protected retrieveDataFlowPaths(sinkFact:Value, sinkStmt:Stmt, report: NPDReport): void {
        // const reverseGraph = new Map<string, PathEdge<Value>[]();

        // for (const edge of pathedges) {
        //     const key = keyFor(edge.target);
        //     if (!reverseGraph.has(key)) {
        //         reverseGraph.set(key, []);
        //     }
        //     reverseGraph.get(key)!.push(edge);
        // }

        if (sinkFact instanceof Local) {
            let def = sinkFact.getDeclaringStmt()
            if (def !== null) {
                report.addPathPoint(def);
            }
            for (let use of sinkFact.getUsedStmts()){
                report.addPathPoint(use);
            }
        }
    }
}

// class Outcome {
//     value: Value;
//     stmt: Stmt;
//     constructor(v: Value, s: Stmt) {
//         this.value = v;
//         this.stmt = s;
//     }
// }
