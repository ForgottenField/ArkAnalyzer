/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_03.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-03.tmpl.ts
*/

/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource: Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 03 Control flow: if(5==5) and if(5!=5)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_03 extends AbstractTestCase {

    public bad(): void {
        let data: string | null;

        if (5 == 5) {
            // POTENTIAL FLAW: 'data' is assigned null.
            data = null;
        } else {
            // INCIDENTAL: CWE 561 Dead Code. This block will never execute, but it ensures 'data' is initialized.
            data = null;
        }

        if (5 == 5) {
            // POTENTIAL FLAW: A null dereference will occur if 'data' is null.
            IO.writeLine("" + data!.length); // Using '!' to replicate the original Java null pointer dereference behavior at runtime.
        }
    }

    // goodG2B1() - use goodsource and badsink by changing first 5==5 to 5!=5
    private goodG2B1(): void {
        let data: string | null;
        if (5 != 5) {
            // INCIDENTAL: CWE 561 Dead Code. This block will never execute, but it ensures 'data' is initialized.
            data = null;
        } else {
            // FIX: Assign a non-null value to 'data'.
            data = "This is not null";
        }

        if (5 == 5) {
            // POTENTIAL FLAW: A null dereference will occur if 'data' is null.
            IO.writeLine("" + data!.length); // Using '!' to replicate the original Java null pointer dereference behavior at runtime.
        }
    }

    // goodG2B2() - use goodsource and badsink by reversing statements in first if
    private goodG2B2(): void {
        let data: string | null;
        if (5 == 5) {
            // FIX: Assign a non-null value to 'data'.
            data = "This is not null";
        } else {
            // INCIDENTAL: CWE 561 Dead Code. This block will never execute, but it ensures 'data' is initialized.
            data = null;
        }

        if (5 == 5) {
            // POTENTIAL FLAW: A null dereference will occur if 'data' is null.
            IO.writeLine("" + data!.length); // Using '!' to replicate the original Java null pointer dereference behavior at runtime.
        }
    }

    // goodB2G1() - use badsource and goodsink by changing second 5==5 to 5!=5
    private goodB2G1(): void {
        let data: string | null;
        if (5 == 5) {
            // POTENTIAL FLAW: 'data' is assigned null.
            data = null;
        } else {
            // INCIDENTAL: CWE 561 Dead Code. This block will never execute, but it ensures 'data' is initialized.
            data = null;
        }

        if (5 != 5) {
            // INCIDENTAL: CWE 561 Dead Code. This block will never execute.
            IO.writeLine("Benign, fixed string");
        } else {
            // FIX: Validate that 'data' is not null before use.
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    // goodB2G2() - use badsource and goodsink by reversing statements in second if
    private goodB2G2(): void {
        let data: string | null;
        if (5 == 5) {
            // POTENTIAL FLAW: 'data' is assigned null.
            data = null;
        } else {
            // INCIDENTAL: CWE 561 Dead Code. This block will never execute, but it ensures 'data' is initialized.
            data = null;
        }

        if (5 == 5) {
            // FIX: Validate that 'data' is not null before use.
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

    // This 'main' function is used for standalone testing or building a binary for analysis tools.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
