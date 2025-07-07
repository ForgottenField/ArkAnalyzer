/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_09.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-09.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 09 Control flow: if(IO.STATIC_FINAL_TRUE) and if(IO.STATIC_FINAL_FALSE)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_09 extends AbstractTestCase {

    public bad(): void {
        let data: number | null; // Declare data as a number that can also be null.
        if (IO.STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensures data is initialized before the Sink to avoid compilation errors */
            data = null;
        }

        if (IO.STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data.toString());
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first IO.STATIC_FINAL_TRUE to IO.STATIC_FINAL_FALSE */
    private goodG2B1(): void {
        let data: number | null;
        if (IO.STATIC_FINAL_FALSE) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensures data is initialized before the Sink to avoid compilation errors */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = 5; // Integer.valueOf(5) translates to a number primitive in ArkTS
        }

        if (IO.STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data.toString());
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number | null;
        if (IO.STATIC_FINAL_TRUE) {
            /* FIX: hardcode data to non-null */
            data = 5;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensures data is initialized before the Sink to avoid compilation errors */
            data = null;
        }

        if (IO.STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data.toString());
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second IO.STATIC_FINAL_TRUE to IO.STATIC_FINAL_FALSE */
    private goodB2G1(): void {
        let data: number | null;
        if (IO.STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensures data is initialized before the Sink to avoid compilation errors */
            data = null;
        }

        if (IO.STATIC_FINAL_FALSE) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that data is non-null */
            if (data !== null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: number | null;
        if (IO.STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensures data is initialized before the Sink to avoid compilation errors */
            data = null;
        }

        if (IO.STATIC_FINAL_TRUE) {
            /* FIX: validate that data is non-null */
            if (data !== null) {
                IO.writeLine("" + data.toString());
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
     * In ArkTS, static methods inherited from the superclass (AbstractTestCase)
     * are explicitly called using the superclass name.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
