import * as fs from 'fs';
import { Value } from '../base/Value';
import { Stmt } from '../base/Stmt';
import { Local } from '../base/Local';
import { ArkMethod } from '../model/ArkMethod';

// newly added
// build the Report class to record NPD information and paths
export class NPDReport {
    fact: Value;
    node: Stmt;
    reason: string;
    line: number;
    method: ArkMethod;
    path: Stmt[];
    constructor(fact: Value, node: Stmt, reason: string) {
        this.fact = fact;
        this.node = node;
        this.reason = reason;
        this.line = node.getOriginPositionInfo().getLineNo();
        this.method = node.getCfg().getDeclaringMethod();
        this.path = [];
    }

    addPathPoint(edge: Stmt) {
        this.path.push(edge);
    }

    toJSON(): object {
        return {
            fact: (this.fact instanceof Local) ? this.fact.getName() : this.fact.getType(),
            node: this.node.toString(),
            line: this.line,
            method: this.method.getSignature(),
            reason: this.reason,
            path: this.path.map((stmt, index) => ({
                step: index + 1,
                stmt: stmt.toString(),
                line: stmt.getOriginPositionInfo().getLineNo(),
                method: stmt.getCfg().getDeclaringMethod().getSignature()
            }))
        };
    }
}

export class NPDReportManager {
    map: Map<string, NPDReport[]>;
    reportCount: number;
    elapsedTime: number;
    constructor() {
        this.map = new Map();
        this.reportCount = 0;
        this.elapsedTime = 0;
    }
    
    getReportCount(): number {
        return this.reportCount;
    }

    getElapsedTime(): number {
        return this.elapsedTime;
    }

    addReport(methodSig: string, report: NPDReport) {
        let reports = this.map.get(methodSig);
        if (reports === undefined) {
            reports = [];
            this.map.set(methodSig, reports);
        } 
        reports.push(report);
    }

    exportJSONToFile(filename: string, elapsedTime: number): void {
        fs.writeFileSync(filename, '', 'utf-8'); // 清空文件内容
        const output: { [key: string]: any } = {};
        let totalReports = 0;

        for (const [methodSignature, reports] of this.map.entries()) {
            if (reports.length !== 0) {
                output[methodSignature] = reports.map(r => r.toJSON());
                totalReports += reports.length;
            }
        }

        output['Report_Summary'] = {
            totalReports: totalReports,
            reportCountMessage: `Total NullPointer reports exported: ${totalReports}`,
            executionTime: `Total elapsed time(ms): ${elapsedTime}`
        };
        this.reportCount = totalReports;
        this.elapsedTime = elapsedTime;
        const jsonOutput = JSON.stringify(output, null, 2);
        fs.writeFileSync(filename, jsonOutput, 'utf-8');
        console.log(`JSON file has been outputed to dir: ${filename}`);
    }
}