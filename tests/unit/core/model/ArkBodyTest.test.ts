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

import path from 'path';
import { ArkClass, INSTANCE_INIT_METHOD_NAME, Scene, SceneConfig, STATIC_INIT_METHOD_NAME } from '../../../../src';
import { assert, describe, expect, it } from 'vitest';
import { Trap } from '../../../../src/core/base/Trap';
import {
    TRAP_EXPECT_CASE1,
    TRAP_EXPECT_CASE2,
    TRAP_EXPECT_CASE3,
    TRAP_EXPECT_CASE4,
    TRAP_EXPECT_CASE5,
    TRAP_EXPECT_CASE6,
    TRAP_EXPECT_CASE7,
    TRAP_EXPECT_CASE8,
} from '../../../resources/model/body/trap/TrapExpect';
import { assertBlocksEqual } from '../../common';
import { Local_Expect_In_Generated_Method } from '../../../resources/model/body/local/LocalExpect';

const BASE_DIR = path.join(__dirname, '../../../../tests/resources/model/body');

describe('trap Test', () => {
    const scene = buildScene('trap');

    it('trap case1', async () => {
        testTraps(scene, 'TrapTest.ts', 'case1', TRAP_EXPECT_CASE1.traps);
    });

    it('trap case2', async () => {
        testTraps(scene, 'TrapTest.ts', 'case2', TRAP_EXPECT_CASE2.traps);
    });

    it('trap case3', async () => {
        testTraps(scene, 'TrapTest.ts', 'case3', TRAP_EXPECT_CASE3.traps);
    });

    it('trap case4', async () => {
        testTraps(scene, 'TrapTest.ts', 'case4', TRAP_EXPECT_CASE4.traps);
    });

    it('trap case5', async () => {
        testTraps(scene, 'TrapTest.ts', 'case5', TRAP_EXPECT_CASE5.traps);
    });

    it('trap case6', async () => {
        testTraps(scene, 'TrapTest.ts', 'case6', TRAP_EXPECT_CASE6.traps);
    });

    it('trap case7', async () => {
        testTraps(scene, 'TrapTest.ts', 'case7', TRAP_EXPECT_CASE7.traps);
    });

    it('trap case8', async () => {
        testTraps(scene, 'TrapTest.ts', 'case8', TRAP_EXPECT_CASE8.traps);
    });
});

describe('Local Test', () => {
    const scene = buildScene('local');

    it('locals in generated method', async () => {
        assertLocalsInGeneratedMethodEqual(scene, 'LocalsInGeneratedMethod.ts', 'Case1', Local_Expect_In_Generated_Method.case1);
    });
});

function buildScene(folderName: string): Scene {
    let config: SceneConfig = new SceneConfig();
    config.buildFromProjectDir(path.join(BASE_DIR, folderName));
    let scene = new Scene();
    scene.buildSceneFromProjectDir(config);
    return scene;
}

function testTraps(scene: Scene, filePath: string, methodName: string, expectTraps: any[]): void {
    const arkFile = scene.getFiles().find((file) => file.getName().endsWith(filePath));
    const arkMethod = arkFile?.getDefaultClass().getMethods()
        .find((method) => (method.getName() === methodName));
    const traps = arkMethod?.getBody()?.getTraps();
    if (!traps) {
        assert.isDefined(traps);
        return;
    }
    assertTrapsEqual(traps, expectTraps);
}

function assertTrapsEqual(traps: Trap[], expectTraps: any[]): void {
    expect(traps.length).toEqual(expectTraps.length);
    const trapMap = new Map<string, Trap>();
    for (const trap of traps) {
        trapMap.set(generateTrapHashCode(trap), trap);
    }
    const expectTrapMap = new Map<string, any>();
    for (const expectTrap of expectTraps) {
        expectTrapMap.set(generateExpectTrapHashCode(expectTrap), expectTrap);
    }
    for (const [trapHashCode, trap] of trapMap) {
        const expectTrap = expectTrapMap.get(trapHashCode);
        if (!expectTrap) {
            assert.isDefined(expectTrap);
            return;
        }
        assertBlocksEqual(new Set(trap.getTryBlocks()), expectTrap.tryBlocks);
        assertBlocksEqual(new Set(trap.getCatchBlocks()), expectTrap.catchBlocks);
    }
}

function generateTrapHashCode(trap: Trap): string {
    const blockIds: number[] = [];
    for (const tryBlock of trap.getTryBlocks()) {
        blockIds.push(tryBlock.getId());
    }
    for (const tryBlock of trap.getCatchBlocks()) {
        blockIds.push(tryBlock.getId());
    }
    return blockIds.sort().join(',');
}

function generateExpectTrapHashCode(trap: any): string {
    const blockIds: number[] = [];
    for (const tryBlock of trap.tryBlocks) {
        blockIds.push(tryBlock.id);
    }
    for (const tryBlock of trap.catchBlocks) {
        blockIds.push(tryBlock.id);
    }
    return blockIds.sort().join(',');
}

function assertLocalsInGeneratedMethodEqual(scene: Scene, filePath: string, className: string, expectLocals: any[]): void {
    const arkFile = scene.getFiles().find((file) => file.getName().endsWith(filePath));
    const arkClass = arkFile?.getClasses().find((cls) => cls.getName() === className);
    assert.isTrue(arkClass instanceof ArkClass);

    const expectMethodLocals = new Map<string, any>();
    for (const methodItem of expectLocals) {
        expectMethodLocals.set(methodItem.methodName, methodItem.locals);
    }

    const staticInitMethod = arkClass!.getStaticInitMethod();
    const staticInitLocalsMap = staticInitMethod.getBody()?.getLocals();
    assert.isDefined(staticInitLocalsMap);
    const staticInitLocals = [];
    for (const local of staticInitLocalsMap?.values() || []) {
        staticInitLocals.push({
            name: local.getName(),
            type: local.getType().toString(),
        });
    }
    expect(staticInitLocals).toEqual(expectMethodLocals.get(STATIC_INIT_METHOD_NAME));

    const InstanceInitMethod = arkClass!.getInstanceInitMethod();
    const InstanceInitLocalsMap = InstanceInitMethod.getBody()?.getLocals();
    assert.isDefined(InstanceInitLocalsMap);
    const InstanceInitLocals = [];
    for (const local of InstanceInitLocalsMap?.values() || []) {
        InstanceInitLocals.push({
            name: local.getName(),
            type: local.getType().toString(),
        });
    }
    expect(InstanceInitLocals).toEqual(expectMethodLocals.get(INSTANCE_INIT_METHOD_NAME));
}