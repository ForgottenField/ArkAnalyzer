/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_01.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-01.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 01 Baseline
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_01 extends AbstractTestCase {
    bad(): void {
        let data: string | null;

        /* POTENTIAL FLAW: 'data' is assigned null */
        data = null;

        /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null. */
        // To replicate the original logic, we simulate a scenario where this value could be null.
        // In ArkTS, string length is accessed via the '.length' property, not a method.
        IO.writeLine("" + data!.length);
    }

    good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use good source and bad sink */
    private goodG2B(): void {
        let data: string | null;

        /* FIX: 'data' is hardcoded to a non-null value */
        data = "This is not null";

        /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
         * In this good path, 'data' is not null, so no dereference occurs.
         */
        IO.writeLine("" + data.length);
    }

    /* goodB2G() - use bad source and good sink */
    private goodB2G(): void {
        let data: string | null;

        /* POTENTIAL FLAW: 'data' is assigned null */
        data = null;

        /* FIX: Validate that 'data' is non-null before dereferencing it */
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }

    /* This main function is used for standalone testing or for building a binary for analysis tools.
     * It is not part of the standard application compilation process for source code analysis.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
