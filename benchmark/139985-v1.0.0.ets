import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_07.java
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

export class CWE476_NULL_Pointer_Dereference__int_array_07 extends AbstractTestCase {
    /* The variable below is not declared "final" in Java, but its value never changes.
     * In ArkTS/TypeScript, its value is fixed after initialization, allowing tools to recognize this. */
    private privateFive: number = 5;

    public bad(): void {
        let data: number[] | null;
        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: 'data' is explicitly set to null */
            data = null;
        } else {
            /* INCIDENTAL: This code is unreachable due to the control flow, but it's included to ensure 'data' is assigned a value, aligning with the original logic. */
            data = null;
        }

        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its length. */
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first privateFive==5 to privateFive!=5 */
    private goodG2B1(): void {
        let data: number[] | null;
        if (this.privateFive !== 5) {
            /* INCIDENTAL: This code is unreachable due to the control flow, but it's included to ensure 'data' is assigned a value, aligning with the original logic. */
            data = null;
        } else {
            /* FIX: 'data' is explicitly set to a non-null array. */
            data = new Array<number>(5);
        }

        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its length. */
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number[] | null;
        if (this.privateFive === 5) {
            /* FIX: 'data' is explicitly set to a non-null array. */
            data = new Array<number>(5);
        } else {
            /* INCIDENTAL: This code is unreachable due to the control flow, but it's included to ensure 'data' is assigned a value, aligning with the original logic. */
            data = null;
        }

        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its length. */
            IO.writeLine("" + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second privateFive==5 to privateFive!=5 */
    private goodB2G1(): void {
        let data: number[] | null;
        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: 'data' is explicitly set to null */
            data = null;
        } else {
            /* INCIDENTAL: This code is unreachable due to the control flow, but it's included to ensure 'data' is assigned a value, aligning with the original logic. */
            data = null;
        }

        if (this.privateFive !== 5) {
            /* INCIDENTAL: This code is unreachable due to the control flow. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: 'data' is validated to be non-null before use. */
            if (data !== null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: number[] | null;
        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: 'data' is explicitly set to null */
            data = null;
        } else {
            /* INCIDENTAL: This code is unreachable due to the control flow, but it's included to ensure 'data' is assigned a value, aligning with the original logic. */
            data = null;
        }

        if (this.privateFive === 5) {
            /* FIX: 'data' is validated to be non-null before use. */
            if (data !== null) {
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

    /* This `main` method is for standalone testing or building a binary for analysis tools.
     * It is not used when compiling all test cases as a single application, which is common for source code analysis tool testing.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}