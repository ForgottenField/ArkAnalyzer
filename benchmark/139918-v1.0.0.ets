/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_11.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-11.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 11 Control flow: if(IO.staticReturnsTrue()) and if(IO.staticReturnsFalse())
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_11 extends AbstractTestCase {

    bad(): void {
        let data: string | null;
        if (IO.staticReturnsTrue()) {
            // Potential issue: data is explicitly set to null.
            data = null;
        } else {
            // This code path is unreachable due to the preceding condition.
            // It's included to replicate the original logic and ensure
            // the variable is always initialized.
            data = null;
        }

        if (IO.staticReturnsTrue()) {
            // Potential issue: a null pointer dereference will occur if data is null,
            // as we are attempting to access its 'length' property.
            IO.writeLine('' + data.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first IO.staticReturnsTrue() to IO.staticReturnsFalse() */
    private goodG2B1(): void {
        let data: string | null;
        if (IO.staticReturnsFalse()) {
            // This code path is unreachable due to the preceding condition.
            // It's included to replicate the original logic and ensure
            // the variable is always initialized.
            data = null;
        } else {

            // FIX: Assign data to a non-null string value.
            data = "This is not null";

        }

        if (IO.staticReturnsTrue()) {
            // Potential issue: a null pointer dereference will occur if data is null,
            // as we are attempting to access its 'length' property.
            IO.writeLine('' + data.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: string | null;

        if (IO.staticReturnsTrue()) {
            // FIX: Assign data to a non-null string value.
            data = "This is not null";
        } else {
            // This code path is unreachable due to the preceding condition.
            // It's included to replicate the original logic and ensure
            // the variable is always initialized.
            data = null;
        }

        if (IO.staticReturnsTrue()) {
            // Potential issue: a null pointer dereference will occur if data is null,
            // as we are attempting to access its 'length' property.
            IO.writeLine('' + data.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second IO.staticReturnsTrue() to IO.staticReturnsFalse() */
    private goodB2G1(): void {
        let data: string | null;
        if (IO.staticReturnsTrue()) {
            // Potential issue: data is explicitly set to null.
            data = null;
        } else {
            // This code path is unreachable due to the preceding condition.
            // It's included to replicate the original logic and ensure
            // the variable is always initialized.
            data = null;
        }

        if (IO.staticReturnsFalse()) {
            // This code path is unreachable due to the preceding condition.
            // The original logic included a benign string write here.
            IO.writeLine("Benign, fixed string");
        } else {

            // FIX: Validate that data is non-null before accessing its properties.
            if (data != null) {
                IO.writeLine('' + data.length);
            } else {
                IO.writeLine("data is null");
            }

        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: string | null;
        if (IO.staticReturnsTrue()) {
            // Potential issue: data is explicitly set to null.
            data = null;
        } else {
            // This code path is unreachable due to the preceding condition.
            // It's included to replicate the original logic and ensure
            // the variable is always initialized.
            data = null;
        }

        if (IO.staticReturnsTrue()) {
            // FIX: Validate that data is non-null before accessing its properties.
            if (data != null) {
                IO.writeLine('' + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    public good(): void {
        this.goodG2B1();
        this.goodG2B2();
        this.goodB2G1();
        this.goodB2G2();
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}