/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_17.ts
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

export class CWE476_NULL_Pointer_Dereference__String_17 extends AbstractTestCase {

    public bad(): void {
        let data: string | null;

        /* To ensure the variable 'data' is declared before its first assignment,
         * which might otherwise lead to a compilation error if only assigned within a loop's scope.
         */

        /* POTENTIAL FLAW: data is null */
        data = null;

        for (let j = 0; j < 1; j++) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data!.length); // Use '!' to simulate the unchecked dereference, allowing runtime error
        }
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: string | null;

        /* FIX: hardcode data to non-null */
        data = "This is not null";

        for (let j = 0; j < 1; j++) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data!.length); // Use '!' to replicate the bad sink behavior
        }
    }

    /* goodB2G() - use badsource and goodsink*/
    private goodB2G(): void {
        let data: string | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        for (let k = 0; k < 1; k++) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* This main method is for testing purposes only. It is used when building this test case
     * individually or for creating a binary to analyze with testing tools.
     * It is not utilized when compiling all test cases as a single application,
     * which is the typical approach for source code analysis tool testing.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
