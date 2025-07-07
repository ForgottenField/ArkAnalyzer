/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_15.ts
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

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_15 extends AbstractTestCase {

    bad(): void {
        let data: string | null;

        switch (6) {
        case 6:
            /* POTENTIAL FLAW: data is null */
            data = null;
            break;
        default:
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run. In ArkTS, this ensures 'data' is initialized before its use to avoid compiler errors. */
            data = null;
            break;
        }

        switch (7) {
        case 7:
            /* POTENTIAL FLAW: A null dereference will occur if 'data' is null. */
            IO.writeLine("" + data!.length);
            break;
        default:
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
            break;
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing the first switch to switch(5) */
    private goodG2B1(): void {
        let data: string | null;

        switch (5) {
        case 6:
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run. In ArkTS, this ensures 'data' is initialized before its use to avoid compiler errors. */
            data = null;
            break;
        default:
            /* FIX: Assign a non-null value to 'data'. */
            data = "";
            break;
        }

        switch (7) {
        case 7:
            /* POTENTIAL FLAW: A null dereference will occur if 'data' is null. */
            IO.writeLine("" + data!.length);
            break;
        default:
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
            break;
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing the blocks in the first switch  */
    private goodG2B2(): void {
        let data: string | null;

        switch (6) {
        case 6:
            /* FIX: Assign a non-null value to 'data'. */
            data = "";
            break;
        default:
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run. In ArkTS, this ensures 'data' is initialized before its use to avoid compiler errors. */
            data = null;
            break;
        }

        switch (7) {
        case 7:
            /* POTENTIAL FLAW: A null dereference will occur if 'data' is null. */
            IO.writeLine("" + data!.length);
            break;
        default:
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
            break;
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing the second switch to switch(8) */
    private goodB2G1(): void {
        let data: string | null;

        switch (6) {
        case 6:
            /* POTENTIAL FLAW: data is null */
            data = null;
            break;
        default:
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run. In ArkTS, this ensures 'data' is initialized before its use to avoid compiler errors. */
            data = null;
            break;
        }

        switch (8) {
        case 7:
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
            break;
        default:
            /* FIX: Validate that 'data' is non-null. */
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
            break;
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing the blocks in the second switch  */
    private goodB2G2(): void {
        let data: string | null;

        switch (6) {
        case 6:
            /* POTENTIAL FLAW: data is null */
            data = null;
            break;
        default:
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run. In ArkTS, this ensures 'data' is initialized before its use to avoid compiler errors. */
            data = null;
            break;
        }

        switch (7) {
        case 7:
            /* FIX: Validate that 'data' is non-null. */
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
            break;
        default:
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
            break;
        }
    }

    good(): void {
        this.goodG2B1();
        this.goodG2B2();
        this.goodB2G1();
        this.goodB2G2();
    }

    /* This is the entry point for running this specific test case. It is typically used for standalone testing or for building a binary for analysis tools. When all test cases are compiled as a single application, this 'main' method is usually not used. */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
