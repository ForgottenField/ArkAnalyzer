// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_13.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-13.tmpl.java

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 13 Control flow: if(IO.STATIC_FINAL_FIVE==5) and if(IO.STATIC_FINAL_FIVE!=5)

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_13 extends AbstractTestCase {

    public bad(): void {
        let data: number[] | null;
        if (IO.STATIC_FINAL_FIVE == 5) {
            // POTENTIAL FLAW: 'data' is assigned null.
            data = null;
        } else {
            // INCIDENTAL: CWE 561 Dead Code. This block will never execute due to the condition,
            // but it's kept to maintain the original structure and variable initialization.
            data = null;
        }

        if (IO.STATIC_FINAL_FIVE == 5) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null,
            // attempting to access its 'length' property.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first IO.STATIC_FINAL_FIVE==5 to IO.STATIC_FINAL_FIVE!=5 */
    private goodG2B1(): void {
        let data: number[] | null;
        if (IO.STATIC_FINAL_FIVE != 5) {
            // INCIDENTAL: CWE 561 Dead Code. This block will never execute due to the condition,
            // but it's kept to maintain the original structure and variable initialization.
            data = null;
        } else {
            // FIX: Assign 'data' to a non-null array.
            data = new Array<number>(5).fill(0);
        }

        if (IO.STATIC_FINAL_FIVE == 5) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null,
            // attempting to access its 'length' property.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number[] | null;
        if (IO.STATIC_FINAL_FIVE == 5) {
            // FIX: Assign 'data' to a non-null array.
            data = new Array<number>(5).fill(0);
        } else {
            // INCIDENTAL: CWE 561 Dead Code. This block will never execute due to the condition,
            // but it's kept to maintain the original structure and variable initialization.
            data = null;
        }

        if (IO.STATIC_FINAL_FIVE == 5) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null,
            // attempting to access its 'length' property.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second IO.STATIC_FINAL_FIVE==5 to IO.STATIC_FINAL_FIVE!=5 */
    private goodB2G1(): void {
        let data: number[] | null;
        if (IO.STATIC_FINAL_FIVE == 5) {
            // POTENTIAL FLAW: 'data' is assigned null.
            data = null;
        } else {
            // INCIDENTAL: CWE 561 Dead Code. This block will never execute due to the condition,
            // but it's kept to maintain the original structure and variable initialization.
            data = null;
        }

        if (IO.STATIC_FINAL_FIVE != 5) {
            // INCIDENTAL: CWE 561 Dead Code. This block will never execute due to the condition.
            IO.writeLine("Benign, fixed string");
        } else {
            // FIX: Validate that 'data' is non-null before dereferencing.
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
        if (IO.STATIC_FINAL_FIVE == 5) {
            // POTENTIAL FLAW: 'data' is assigned null.
            data = null;
        } else {
            // INCIDENTAL: CWE 561 Dead Code. This block will never execute due to the condition,
            // but it's kept to maintain the original structure and variable initialization.
            data = null;
        }

        if (IO.STATIC_FINAL_FIVE == 5) {
            // FIX: Validate that 'data' is non-null before dereferencing.
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