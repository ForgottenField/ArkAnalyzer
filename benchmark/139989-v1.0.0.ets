/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_11.java
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

export class CWE476_NULL_Pointer_Dereference__int_array_11 extends AbstractTestCase {
    public bad(): void {
        let data: number[] | null;
        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. To replicate the original logic, we ensure data is assigned a value even if this path is not taken, avoiding ArkTS type errors. */
            data = null;
        }

        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // Accessing 'length' on a potentially null 'data'. We use '!' to bypass strict type checking and replicate the runtime error.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first IO.staticReturnsTrue() to IO.staticReturnsFalse() */
    private goodG2B1(): void {
        let data: number[] | null;
        if (IO.staticReturnsFalse()) {
            /* INCIDENTAL: CWE 561 Dead Code. To replicate the original logic, we ensure data is assigned a value even if this path is not taken, avoiding ArkTS type errors. */
            data = null;
        } else {

            /* FIX: hardcode data to non-null */
            data = new Array<number>(5);

        }

        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number[] | null;

        if (IO.staticReturnsTrue()) {
            /* FIX: hardcode data to non-null */
            data = new Array<number>(5);
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. To replicate the original logic, we ensure data is assigned a value even if this path is not taken, avoiding ArkTS type errors. */
            data = null;
        }

        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second IO.staticReturnsTrue() to IO.staticReturnsFalse() */
    private goodB2G1(): void {
        let data: number[] | null;
        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. To replicate the original logic, we ensure data is assigned a value even if this path is not taken, avoiding ArkTS type errors. */
            data = null;
        }

        if (IO.staticReturnsFalse()) {
            /* INCIDENTAL: CWE 561 Dead Code. This path will never be executed. */
            IO.writeLine("Benign, fixed string");
        } else {

            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }

        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: number[] | null;
        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. To replicate the original logic, we ensure data is assigned a value even if this path is not taken, avoiding ArkTS type errors. */
            data = null;
        }

        if (IO.staticReturnsTrue()) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length);
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
