/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_12.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-12.tmpl.java
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

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_12 extends AbstractTestCase {

    public bad(): void {
        let data: string | null;
        if (IO.staticReturnsTrueOrFalse()) {
            /* POTENTIAL FLAW: 'data' is assigned null */
            data = null;
        } else {
            /* FIX: 'data' is assigned a non-null value (an empty string to simulate non-null StringBuilder) */
            data = "";
        }

        if (IO.staticReturnsTrueOrFalse()) {
            /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its 'length' property */
            // In TypeScript/ArkTS, accessing a property like 'length' on a 'null' value will cause a runtime error.
            IO.writeLine("" + data.length);
        } else {
            /* FIX: Validate that 'data' is non-null before dereferencing */
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodG2B() - uses a good source and a bad sink by ensuring both branches
     * of the initial conditional assign a non-null value. */
    private goodG2B(): void {
        let data: string | null;
        if (IO.staticReturnsTrueOrFalse()) {
            /* FIX: 'data' is assigned a non-null value */
            data = "";
        } else {
            /* FIX: 'data' is assigned a non-null value */
            data = "";
        }

        if (IO.staticReturnsTrueOrFalse()) {
            /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its 'length' property */
            // In TypeScript/ArkTS, accessing a property like 'length' on a 'null' value will cause a runtime error.
            IO.writeLine("" + data.length);
        } else {
            /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its 'length' property */
            // In TypeScript/ArkTS, accessing a property like 'length' on a 'null' value will cause a runtime error.
            IO.writeLine("" + data.length);
        }
    }

    /* goodB2G() - uses a bad source and a good sink by ensuring both branches
     * of the latter conditional validate for null before dereferencing. */
    private goodB2G(): void {
        let data: string | null;
        if (IO.staticReturnsTrueOrFalse()) {
            /* POTENTIAL FLAW: 'data' is assigned null */
            data = null;
        } else {
            /* POTENTIAL FLAW: 'data' is assigned null */
            data = null;
        }

        if (IO.staticReturnsTrueOrFalse()) {
            /* FIX: Validate that 'data' is non-null before dereferencing */
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        } else {
            /* FIX: Validate that 'data' is non-null before dereferencing */
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

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
