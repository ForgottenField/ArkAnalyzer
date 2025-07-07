/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_15.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-15.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 15 Control flow: switch(6) and switch(7)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_15 extends AbstractTestCase {

    bad(): void {
        let data: number | null;

        switch (6) {
            case 6:
                // POTENTIAL FLAW: 'data' is intentionally set to null to demonstrate the vulnerability.
                data = null;
                break;
            default:
                // This code path is unreachable due to the switch condition.
                // It's included to ensure the 'data' variable is always assigned a value, satisfying TypeScript's strict initialization checks.
                data = null;
                break;
        }

        switch (7) {
            case 7:
                // POTENTIAL FLAW: A null dereference will occur here if 'data' is null, replicating the original vulnerability.
                IO.writeLine("" + data!.toString());
                break;
            default:
                // This code path is unreachable due to the switch condition.
                IO.writeLine("Benign, fixed string");
                break;
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing the first switch to switch(5) */
    private goodG2B1(): void {
        let data: number | null;

        switch (5) {
            case 6:
                // This code path is unreachable due to the switch condition.
                // It's included to ensure the 'data' variable is always assigned a value, satisfying TypeScript's strict initialization checks.
                data = null;
                break;
            default:
                // FIX: 'data' is set to a non-null value here.
                data = 5;
                break;
        }

        switch (7) {
            case 7:
                // POTENTIAL FLAW: A null dereference will occur here if 'data' is null, replicating the original vulnerability.
                IO.writeLine("" + data!.toString());
                break;
            default:
                // This code path is unreachable due to the switch condition.
                IO.writeLine("Benign, fixed string");
                break;
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing the blocks in the first switch  */
    private goodG2B2(): void {
        let data: number | null;

        switch (6) {
            case 6:
                // FIX: 'data' is set to a non-null value here.
                data = 5;
                break;
            default:
                // This code path is unreachable due to the switch condition.
                // It's included to ensure the 'data' variable is always assigned a value, satisfying TypeScript's strict initialization checks.
                data = null;
                break;
        }

        switch (7) {
            case 7:
                // POTENTIAL FLAW: A null dereference will occur here if 'data' is null, replicating the original vulnerability.
                IO.writeLine("" + data!.toString());
                break;
            default:
                // This code path is unreachable due to the switch condition.
                IO.writeLine("Benign, fixed string");
                break;
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing the second switch to switch(8) */
    private goodB2G1(): void {
        let data: number | null;

        switch (6) {
            case 6:
                // POTENTIAL FLAW: 'data' is intentionally set to null to demonstrate the vulnerability.
                data = null;
                break;
            default:
                // This code path is unreachable due to the switch condition.
                // It's included to ensure the 'data' variable is always assigned a value, satisfying TypeScript's strict initialization checks.
                data = null;
                break;
        }

        switch (8) {
            case 7:
                // This code path is unreachable due to the switch condition.
                IO.writeLine("Benign, fixed string");
                break;
            default:
                // FIX: 'data' is explicitly checked for null before being used.
                if (data != null) {
                    IO.writeLine("" + data.toString());
                } else {
                    IO.writeLine("data is null");
                }
                break;
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing the blocks in the second switch  */
    private goodB2G2(): void {
        let data: number | null;

        switch (6) {
            case 6:
                // POTENTIAL FLAW: 'data' is intentionally set to null to demonstrate the vulnerability.
                data = null;
                break;
            default:
                // This code path is unreachable due to the switch condition.
                // It's included to ensure the 'data' variable is always assigned a value, satisfying TypeScript's strict initialization checks.
                data = null;
                break;
        }

        switch (7) {
            case 7:
                // FIX: 'data' is explicitly checked for null before being used.
                if (data != null) {
                    IO.writeLine("" + data.toString());
                } else {
                    IO.writeLine("data is null");
                }
                break;
            default:
                // This code path is unreachable due to the switch condition.
                IO.writeLine("Benign, fixed string");
                break;
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
    static main(args: string[]): void {
        // Calling the static mainFromParent method from the AbstractTestCase base class.
        AbstractTestCase.mainFromParent(args);
    }
}