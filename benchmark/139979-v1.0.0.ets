/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_01.ts
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

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_01 extends AbstractTestCase {

    public bad(): void {
        let data: number[] | null; // Declares a number array variable that can be null.

        // To replicate the original logic, 'data' is explicitly set to null here.
        data = null;

        // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
        IO.writeLine("" + data.length); // Accessing 'length' property on a potentially null 'data'.
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - use goodsource and badsink
    private goodG2B(): void {
        let data: number[] | null; // Declares a number array variable that can be null.

        // FIX: 'data' is initialized to a non-null array.
        data = new Array<number>(5);

        // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
        IO.writeLine("" + data.length); // Accessing 'length' property on 'data'.
    }

    // goodB2G() - use badsource and goodsink
    private goodB2G(): void {
        let data: number[] | null; // Declares a number array variable that can be null.

        // To replicate the original logic, 'data' is explicitly set to null here.
        data = null;

        // FIX: Validating 'data' to ensure it is not null before access.
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }

    /*
     * This is the main method, used for testing this test case in isolation or
     * for building a binary to use in testing binary analysis tools.
     * It is not used when compiling all test cases as one application, which
     * is how source code analysis tools are tested.
     */
    public static main(): void {
        // Calls the mainFromParent method, passing command-line arguments.
        // This is typical for setting up test execution in a framework.
        CWE476_NULL_Pointer_Dereference__int_array_01.mainFromParent(process.argv);
    }
}
