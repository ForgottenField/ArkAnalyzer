/* TEMPLATE GENERATED TESTCASE FILE
* Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_16.ts
* Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
* Template File: sources-sinks-16.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource: Sets a string variable to null.
* GoodSource: Sets a string variable to a non-null value.
* Sinks:
*    GoodSink: Adds a null check to prevent potential dereference.
*    BadSink : Directly dereferences a variable with the possibility of it being null.
* Flow Variant: 16 Control flow using a while(true) loop structure.
*
*/

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_16 extends AbstractTestCase {

    public bad(): void {
        let data: string | null; // Declare data as a string that can also be null

        while (true) {
            /* POTENTIAL FLAW: data is null */
            data = null;
            break;
        }

        while (true) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original logic, we expect a runtime error if data is null.
            IO.writeLine('' + data.length); // Accessing 'length' on a potentially null 'data'
            break;
        }
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: string | null;

        while (true) {
            /* FIX: hardcode data to non-null */
            data = ''; // Initialize data to an empty string, which is non-null
            break;
        }

        while (true) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine('' + data.length);
            break;
        }
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: string | null;

        while (true) {
            /* POTENTIAL FLAW: data is null */
            data = null;
            break;
        }

        while (true) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine('' + data.length);
            } else {
                // This branch is executed when data is null, preventing dereference.
                IO.writeLine('data is null');
            }
            break;
        }
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* This main method is for standalone execution of this test case,
    * useful for testing or building a binary for analysis tools.
    * It is not invoked when all test cases are compiled together as a single application,
    * which is the typical setup for source code analysis tools.
    */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}