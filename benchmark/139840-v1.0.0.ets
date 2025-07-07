/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_07.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-07.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 07 Control flow: if(privateFive==5) and if(privateFive!=5)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_07 extends AbstractTestCase {
    /* This variable is effectively a constant within this test case,
     * maintaining its initialized value throughout execution. */
    private privateFive: number = 5;

    public bad(): void {
        let data: Number | null; // Replicating Java's Integer object which can be null

        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: 'data' is assigned null */
            data = null;
        } else {
            /* This code path is unreachable due to the control flow,
             * but it ensures 'data' is initialized to satisfy type checking. */
            data = null;
        }

        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: null dereference will occur if 'data' is null.
             * The 'toString()' method is called on a potentially null object. */
            IO.writeLine("" + data.toString()); // This will throw an error if data is null
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first privateFive==5 to privateFive!=5 */
    private goodG2B1(): void {
        let data: Number | null;

        if (this.privateFive !== 5) {
            /* This code path is unreachable due to the control flow,
             * but it ensures 'data' is initialized to satisfy type checking. */
            data = null;
        } else {
            /* FIX: assign a non-null Number object to 'data' */
            data = new Number(5);
        }

        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: null dereference will occur if 'data' is null.
             * The 'toString()' method is called on a potentially null object. */
            IO.writeLine("" + data.toString());
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: Number | null;

        if (this.privateFive === 5) {
            /* FIX: assign a non-null Number object to 'data' */
            data = new Number(5);
        } else {
            /* This code path is unreachable due to the control flow,
             * but it ensures 'data' is initialized to satisfy type checking. */
            data = null;
        }

        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: null dereference will occur if 'data' is null.
             * The 'toString()' method is called on a potentially null object. */
            IO.writeLine("" + data.toString());
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second privateFive==5 to privateFive!=5 */
    private goodB2G1(): void {
        let data: Number | null;

        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: 'data' is assigned null */
            data = null;
        } else {
            /* This code path is unreachable due to the control flow,
             * but it ensures 'data' is initialized to satisfy type checking. */
            data = null;
        }

        if (this.privateFive !== 5) {
            /* This code path is unreachable due to the control flow. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that 'data' is non-null before dereferencing */
            if (data !== null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: Number | null;

        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: 'data' is assigned null */
            data = null;
        } else {
            /* This code path is unreachable due to the control flow,
             * but it ensures 'data' is initialized to satisfy type checking. */
            data = null;
        }

        if (this.privateFive === 5) {
            /* FIX: validate that 'data' is non-null before dereferencing */
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

    /* This is the main entry point, used for testing this test case in isolation.
     * It is not typically used when all test cases are compiled together for
     * source code analysis.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}