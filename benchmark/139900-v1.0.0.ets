/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_67a.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-67a.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:   Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 * GoodSink: add check to prevent possibility of null dereference
 * BadSink : possibility of null dereference
 * Flow Variant: 67 Data flow: data passed in a class from one method to another in different source files in the same package
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';
import { StringBuilder } from '@ohos.utils.text';
// Importing the companion class for data flow

export class CWE476_NULL_Pointer_Dereference__StringBuilder_67a extends AbstractTestCase {
    // In ArkTS, nested classes are typically defined outside or as interfaces/types.
    // For simplicity and to maintain similar structure, we define it here.
    static Container = class {
        containerOne: StringBuilder | null; // Allow null to match Java behavior
    };

    bad(): void {
        let data: StringBuilder | null;

        /* To replicate the original logic, we assign null to data, simulating a potential flaw. */
        data = null;

        let dataContainer: typeof CWE476_NULL_Pointer_Dereference__StringBuilder_67a.Container = new CWE476_NULL_Pointer_Dereference__StringBuilder_67a.Container();
        dataContainer.containerOne = data;
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_67b()).badSink(dataContainer);
    }

    good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: StringBuilder | null;

        /* To fix the vulnerability, data is explicitly initialized to a non-null value. */
        data = new StringBuilder();

        let dataContainer: typeof CWE476_NULL_Pointer_Dereference__StringBuilder_67a.Container = new CWE476_NULL_Pointer_Dereference__StringBuilder_67a.Container();
        dataContainer.containerOne = data;
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_67b()).goodG2BSink(dataContainer);
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: StringBuilder | null;

        /* To replicate the original logic, we assign null to data, simulating a potential flaw. */
        data = null;

        let dataContainer: typeof CWE476_NULL_Pointer_Dereference__StringBuilder_67a.Container = new CWE476_NULL_Pointer_Dereference__StringBuilder_67a.Container();
        dataContainer.containerOne = data;
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_67b()).goodB2GSink(dataContainer);
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_67b.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-67b.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:   Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 * GoodSink: add check to prevent possibility of null dereference
 * BadSink : possibility of null dereference
 * Flow Variant: 67 Data flow: data passed in a class from one method to another in different source files in the same package
 *
 * */

import { IO } from './testcasesupport';
import { StringBuilder } from '@ohos.utils.text';
// Importing the Container class from the companion file

export class CWE476_NULL_Pointer_Dereference__StringBuilder_67b {
    // Parameter type needs to refer to the static inner class from the other file
    badSink(dataContainer: typeof CWE476_NULL_Pointer_Dereference__StringBuilder_67a.Container): void {
        let data: StringBuilder | null = dataContainer.containerOne;

        /* A null dereference will occur here if data is null, replicating the original flaw. */
        // To faithfully replicate the bug, we must allow the potential runtime error, similar to Java.
        // TypeScript's type system would normally prevent this unless explicitly bypassed.
        // Using 'as StringBuilder' asserts the type, which allows the access but shifts
        // the responsibility to the developer, leading to a runtime error if 'data' is indeed null.
        IO.writeLine("" + (data as StringBuilder).length);
    }

    /* goodG2B() - use goodsource and badsink */
    goodG2BSink(dataContainer: typeof CWE476_NULL_Pointer_Dereference__StringBuilder_67a.Container): void {
        let data: StringBuilder | null = dataContainer.containerOne;

        /* A null dereference will occur here if data is null, replicating the original flaw. */
        IO.writeLine("" + (data as StringBuilder).length);
    }

    /* goodB2G() - use badsource and goodsink */
    goodB2GSink(dataContainer: typeof CWE476_NULL_Pointer_Dereference__StringBuilder_67a.Container): void {
        let data: StringBuilder | null = dataContainer.containerOne;

        /* To prevent a null dereference, the data is explicitly checked for null before use. */
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }
}