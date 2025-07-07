// @ts-nocheck
/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_03.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-03.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 03 Control flow: if(5==5) and if(5!=5)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

class CWE476_NULL_Pointer_Dereference__Integer_03 extends AbstractTestCase {

    public bad(): void {
        // Declare 'data' which can be a number or null, to replicate the original behavior.
        let data: number | null;
        if (5 == 5) {
            // POTENTIAL FLAW: 'data' is assigned null.
            data = null;
        } else {
            // INCIDENTAL: This code is unreachable due to the condition,
            // but it's included to replicate the original Java structure and ensure
            // 'data' is explicitly initialized, preventing potential type errors in stricter modes.
            data = null;
        }

        if (5 == 5) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
            // Replicating the original Java bug where toString() is called on a null reference.
            IO.writeLine("" + data.toString());
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first 5==5 to 5!=5 */
    private goodG2B1(): void {
        let data: number | null;
        if (5 != 5) {
            // INCIDENTAL: This code is unreachable due to the condition,
            // but it's included to replicate the original Java structure and ensure
            // 'data' is explicitly initialized, preventing potential type errors in stricter modes.
            data = null;
        } else {
            // FIX: Assign a non-null value to 'data'.
            data = 5;
        }

        if (5 == 5) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
            // Replicating the original Java bug where toString() is called on a null reference.
            IO.writeLine("" + data.toString());
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number | null;
        if (5 == 5) {
            // FIX: Assign a non-null value to 'data'.
            data = 5;
        } else {
            // INCIDENTAL: This code is unreachable due to the condition,
            // but it's included to replicate the original Java structure and ensure
            // 'data' is explicitly initialized, preventing potential type errors in stricter modes.
            data = null;
        }

        if (5 == 5) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
            // Replicating the original Java bug where toString() is called on a null reference.
            IO.writeLine("" + data.toString());
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second 5==5 to 5!=5 */
    private goodB2G1(): void {
        let data: number | null;
        if (5 == 5) {
            // POTENTIAL FLAW: 'data' is assigned null.
            data = null;
        } else {
            // INCIDENTAL: This code is unreachable due to the condition,
            // but it's included to replicate the original Java structure and ensure
            // 'data' is explicitly initialized, preventing potential type errors in stricter modes.
            data = null;
        }

        if (5 != 5) {
            // INCIDENTAL: This code is unreachable due to the condition.
            IO.writeLine("Benign, fixed string");
        } else {
            // FIX: Validate that 'data' is not null before use.
            if (data != null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: number | null;
        if (5 == 5) {
            // POTENTIAL FLAW: 'data' is assigned null.
            data = null;
        } else {
            // INCIDENTAL: This code is unreachable due to the condition,
            // but it's included to replicate the original Java structure and ensure
            // 'data' is explicitly initialized, preventing potential type errors in stricter modes.
            data = null;
        }

        if (5 == 5) {
            // FIX: Validate that 'data' is not null before use.
            if (data != null) {
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

    /*
     * This 'main' method is used for standalone execution of this test case,
     * often for testing or for building a binary to analyze with static analysis tools.
     * It is not typically used when compiling all test cases as a single application,
     * which is the standard approach for testing source code analysis tools.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}