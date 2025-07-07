/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_05.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-05.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 05 Control flow: if(privateTrue) and if(privateFalse)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_05 extends AbstractTestCase {
    /* The two variables below are not defined as "final", but are never
     * assigned any other value, so a tool should be able to identify that
     * reads of these will always return their initialized values.
     */
    private privateTrue: boolean = true;
    private privateFalse: boolean = false;

    public bad(): void {
        let data: number[] | null; // Declare data as an array of numbers or null
        if (this.privateTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensure data is initialized before the Sink to avoid compiler errors */
            data = null;
        }

        if (this.privateTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original logic, we simulate a scenario where this value could be null.
            // We use the non-null assertion operator (!) to bypass TypeScript's null safety checks,
            // ensuring the potential runtime error is preserved as per the original Java code's intent.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first privateTrue to privateFalse */
    private goodG2B1(): void {
        let data: number[] | null;
        if (this.privateFalse) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensure data is initialized before the Sink to avoid compiler errors */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = new Array<number>(5); // Initialize an array of 5 numbers
        }

        if (this.privateTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original logic, we simulate a scenario where this value could be null.
            // We use the non-null assertion operator (!) to bypass TypeScript's null safety checks,
            // ensuring the potential runtime error is preserved as per the original Java code's intent.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number[] | null;
        if (this.privateTrue) {
            /* FIX: hardcode data to non-null */
            data = new Array<number>(5);
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensure data is initialized before the Sink to avoid compiler errors */
            data = null;
        }

        if (this.privateTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original logic, we simulate a scenario where this value could be null.
            // We use the non-null assertion operator (!) to bypass TypeScript's null safety checks,
            // ensuring the potential runtime error is preserved as per the original Java code's intent.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second privateTrue to privateFalse */
    private goodB2G1(): void {
        let data: number[] | null;

        if (this.privateTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensure data is initialized before the Sink to avoid compiler errors */
            data = null;
        }

        if (this.privateFalse) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
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
        if (this.privateTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensure data is initialized before the Sink to avoid compiler errors */
            data = null;
        }

        if (this.privateTrue) {
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