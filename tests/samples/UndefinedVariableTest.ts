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

import { SceneConfig } from '../../src';
import { Scene } from '../../src';
import { ModelUtils } from '../../src';
import { UndefinedVariableChecker, UndefinedVariableSolver } from '../../src';
import { Logger, LOG_LEVEL, LOG_MODULE_TYPE } from '../../src';
import { NPDReportManager } from '../../src/core/dataflow/UndefinedVariable';

const logger = Logger.getLogger(LOG_MODULE_TYPE.TOOL, 'UndefinedVariableTest');
Logger.configure('', LOG_LEVEL.ERROR, LOG_LEVEL.INFO, false);


let config: SceneConfig = new SceneConfig();
config.buildFromProjectDir("benchmark/139834");
// config.buildFromProjectDir("benchmark");
const scene = new Scene();
scene.buildBasicInfo(config);
scene.buildSceneFromProjectDir(config);
const defaultMethod = scene.getFiles()[0].getDefaultClass().getDefaultArkMethod();
let method = ModelUtils.getMethodWithName("CWE476_NULL_Pointer_Dereference__Integer_01.good",defaultMethod!);
if(method){
    logger.info("Test begins.");
    const reportManager = new NPDReportManager();
    const problem = new UndefinedVariableChecker([...method.getCfg()!.getBlocks()][0].getStmts()[method.getParameters().length],method);
    const solver = new UndefinedVariableSolver(problem, scene);
    solver.solve();
    solver.toResult(method.getDeclaringArkClass().getName(), method.getName(), method.getParameters(), reportManager);
    for (const outcome of problem.getOutcomes()) {
        let position = outcome.stmt.getOriginPositionInfo();
        logger.info('undefined error in line ' + position.getLineNo());
    }
    reportManager.exportJSONToFile(`./output/report.json`);
    logger.info("Test finished.");
    debugger;
}
