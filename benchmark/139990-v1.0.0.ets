/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_12.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-12.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 12 Control flow: if(IO.staticReturnsTrueOrFalse())
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport'; // Importing necessary utilities and base classes from the testcase support module.

export class CWE476_NULL_Pointer_Dereference__int_array_12 extends AbstractTestCase {

    bad(): void {
        let data: number[] | null;
        if (IO.staticReturnsTrueOrFalse()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = new Array<number>(5);
        }

        if (IO.staticReturnsTrueOrFalse()) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // Accessing the 'length' property on 'data' without a null check. If 'data' is null, this will cause a runtime error.
            IO.writeLine("" + data.length);
        } else {
            /* FIX: validate that data is non-null */
            // Checking if 'data' is non-null before attempting to access its 'length' property.
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodG2B() - use goodsource and badsink by changing the first "if" so that
     * both branches use the GoodSource */
    private goodG2B(): void {
        let data: number[] | null; // Declared with null possibility to match the original pattern, though it will not be null here.
        if (IO.staticReturnsTrueOrFalse()) {
            /* FIX: hardcode data to non-null */
            data = new Array<number>(5);
        } else {
            /* FIX: hardcode data to non-null */
            data = new Array<number>(5);
        }

        if (IO.staticReturnsTrueOrFalse()) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In this specific path (goodG2B), 'data' is guaranteed to be non-null before accessing 'length'.
            IO.writeLine("" + data.length);
        } else {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In this specific path (goodG2B), 'data' is guaranteed to be non-null before accessing 'length'.
            IO.writeLine("" + data.length);
        }
    }

    /* goodB2G() - use badsource and goodsink by changing the second "if" so that
     * both branches use the GoodSink */
    private goodB2G(): void {
        let data: number[] | null;
        if (IO.staticReturnsTrueOrFalse()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* POTENTIAL FLAW: data is null */
            data = null;
        }

        if (IO.staticReturnsTrueOrFalse()) {
            /* FIX: validate that data is non-null */
            // Checking if 'data' is non-null before attempting to access its 'length' property.
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        } else {
            /* FIX: validate that data is non-null */
            // Checking if 'data' is non-null before attempting to access its 'length' property.
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

    /* This 'main' method is included for standalone testing purposes, specifically for building and analyzing this test case.
     * It is typically not used when compiling the application as a whole, which is how many source code analysis tools operate.
     */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}