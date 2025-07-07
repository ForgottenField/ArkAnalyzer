/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_10.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-10.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 10 Control flow: if(IO.staticTrue) and if(IO.staticFalse)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_10 extends AbstractTestCase {

    public bad(): void {
        let data: string | null;
        if (IO.staticTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This block is intentionally unreachable, mirroring the original Java logic for variable initialization and avoiding compilation errors in strict type environments. */
            data = null;
        }

        if (IO.staticTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first IO.staticTrue to IO.staticFalse */
    private goodG2B1(): void {
        let data: string | null;
        if (IO.staticFalse) {
            /* This block is intentionally unreachable, mirroring the original Java logic for variable initialization and avoiding compilation errors in strict type environments. */
            data = null;
        } else {

            /* FIX: hardcode data to non-null */
            data = new String();

        }

        if (IO.staticTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: string | null;
        if (IO.staticTrue) {
            /* FIX: hardcode data to non-null */
            data = new String();
        } else {
            /* This block is intentionally unreachable, mirroring the original Java logic for variable initialization and avoiding compilation errors in strict type environments. */
            data = null;
        }

        if (IO.staticTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second IO.staticTrue to IO.staticFalse */
    private goodB2G1(): void {
        let data: string | null;
        if (IO.staticTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This block is intentionally unreachable, mirroring the original Java logic for variable initialization and avoiding compilation errors in strict type environments. */
            data = null;
        }

        if (IO.staticFalse) {
            /* This code block is intentionally unreachable. */
            IO.writeLine("Benign, fixed string");
        } else {

            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length);
            }
            else {
                IO.writeLine("data is null");
            }

        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: string | null;
        if (IO.staticTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This block is intentionally unreachable, mirroring the original Java logic for variable initialization and avoiding compilation errors in strict type environments. */
            data = null;
        }

        if (IO.staticTrue) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length);
            }
            else {
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