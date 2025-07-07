/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_17.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-17.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 17 Control flow: for loops
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_17 extends AbstractTestCase {

    bad(): void {
        let data: number | null; // Represents an Integer which can be null

        /* This initialization is done outside the loop to ensure the variable is always declared before its first use, mirroring the original logic. */

        /* POTENTIAL FLAW: 'data' is assigned null */
        data = null;

        for (let j = 0; j < 1; j++) {
            /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null */
            // In ArkTS/TypeScript, we use the non-null assertion operator '!' to simulate the direct dereference of a potentially null value,
            // replicating the original bug.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: number | null; // Represents an Integer which can be null

        /* FIX: 'data' is explicitly set to a non-null value */
        data = 5; // In ArkTS, directly assign a number for Integer.valueOf(5) equivalent

        for (let j = 0; j < 1; j++) {
            /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null */
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodB2G() - use badsource and goodsink*/
    private goodB2G(): void {
        let data: number | null; // Represents an Integer which can be null

        /* POTENTIAL FLAW: 'data' is assigned null */
        data = null;

        for (let k = 0; k < 1; k++) {
            /* FIX: 'data' is validated to ensure it is not null before use */
            if (data != null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* This 'main' method is used for stand-alone testing and analysis tool evaluation. It is not invoked when the testcases are compiled as part of a larger application. */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}