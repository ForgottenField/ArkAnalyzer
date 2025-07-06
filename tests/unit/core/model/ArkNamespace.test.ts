/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { assert, describe, it } from 'vitest';
import { buildScene } from '../../common';
import path from 'path';
import {
    Basic_Namespace_Nested,
    Continuous_Namespace_Nested, Continuous_Namespace_Nested_With_The_Same_Name,
    Namespaces_With_The_Same_Name,
} from '../../../resources/model/namespace/NamespaceExpect';
import { ArkFile, ArkNamespace } from '../../../../src';

describe('namespace Test', () => {
    const scene = buildScene(path.join(__dirname, '../../../resources/model/namespace'));
    it('namespace with the same name', async () => {
        const arkFile = scene.getFiles().find((file) => file.getName() === 'NamespacesWithTheSameName.ts');
        assert.isDefined(arkFile);

        const namespaces = arkFile!.getNamespaces();
        assertNamespacesEqual(namespaces!, Namespaces_With_The_Same_Name);
    });

    it('basic namespace in namespace', async () => {
        const arkFile = scene.getFiles().find((file) => file.getName() === 'Namespaces.ts');
        assert.isDefined(arkFile);

        const namespace = arkFile!.getNamespaceWithName('A');
        assert.isNotNull(namespace);
        assertNamespaceEqual(namespace!, Basic_Namespace_Nested);
    });

    it('continuous namespace in namespace', async () => {
        const arkFile = scene.getFiles().find((file) => file.getName() === 'Namespaces.ts');
        assert.isDefined(arkFile);

        const namespace = arkFile!.getNamespaceWithName('Foo');
        assert.isNotNull(namespace);
        assertNamespaceEqual(namespace!, Continuous_Namespace_Nested);
    });

    it('continuous namespace with the same name', async () => {
        const arkFile = scene.getFiles().find((file) => file.getName() === 'Namespaces.ts');
        assert.isDefined(arkFile);

        const namespace = arkFile!.getNamespaceWithName('C');
        assert.isNotNull(namespace);
        assertNamespaceEqual(namespace!, Continuous_Namespace_Nested_With_The_Same_Name);
    });
});

function assertNamespacesEqual(namespaces: ArkNamespace[], expectNamespaces: any): void {
    assert.deepEqual(namespaces.length, expectNamespaces.length);
    for (const expectNamespace of expectNamespaces) {
        const expectNamespaceName = expectNamespace.namespaceName;
        const namespace = namespaces.find((namespace) => namespace.getName() === expectNamespaceName);
        assert.isDefined(namespace);
        assertNamespaceEqual(namespace!, expectNamespace);
    }
}

function assertNamespaceEqual(namespace: ArkNamespace, expectNamespace: any): void {
    assert.deepEqual(namespace!.getNamespaceSignature().toString(), expectNamespace.namespaceSignature);

    const declaringNamespace = namespace!.getDeclaringArkNamespace();
    if (declaringNamespace !== null) {
        assert.deepEqual(declaringNamespace.getNamespaceSignature().toString(), expectNamespace.declaringNamespaceSignature);
    } else {
        assert.deepEqual(declaringNamespace, expectNamespace.declaringNamespaceSignature);
    }

    const declaringInstance = namespace!.getDeclaringInstance();
    if (declaringInstance instanceof ArkFile) {
        assert.deepEqual(declaringInstance.getFileSignature().toString(), expectNamespace.declaringInstanceSignature);
    } else {
        assert.deepEqual(declaringInstance.getSignature().toString(), expectNamespace.declaringInstanceSignature);
    }
    assert.deepEqual(namespace!.getLineColPairs(), expectNamespace.linCols);

    const classes = namespace!.getClasses();
    const expectClasses = expectNamespace.classes;
    assert.deepEqual(classes.length, expectClasses.length);
    for (const expectClass of expectClasses) {
        const expectClassName = expectClass.className;
        const arkClass = classes.find((arkClass) => arkClass.getName() === expectClassName);
        assert.isDefined(arkClass);
        assert.deepEqual(arkClass!.getSignature().toString(), expectClass.classSignature);
    }

    const nestedNamespaces = namespace!.getNamespaces();
    assertNamespacesEqual(nestedNamespaces, expectNamespace.nestedNamespaces);
}