/**
 * TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__String_13.java (translated to ArkTS)
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-13.tmpl.java (translated to ArkTS)
 */

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set 'data' to null
 * GoodSource: Set 'data' to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 13 Control flow: if(IO.STATIC_FINAL_FIVE==5) and if(IO.STATIC_FINAL_FIVE!=5)
 *
 */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_13 extends AbstractTestCase {

    public bad(): void {
        let data: string | null; // Use 'string | null' to replicate Java's potential nullability

        if (IO.STATIC_FINAL_FIVE === 5) {
            /* POTENTIAL FLAW: 'data' is assigned null */
            data = null;
        } else {
            /*
             * To maintain the original logic, this code path is designed to be unreachable
             * but still initializes 'data' to avoid potential type errors later.
             */
            data = null;
        }

        if (IO.STATIC_FINAL_FIVE === 5) {
            /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null. */
            // To replicate the original bug, we use a type assertion to bypass TypeScript's null check.
            IO.writeLine("" + (data as string).length);
        }
    }

    /* goodG2B1() - uses a good source and a bad sink by changing the first IO.STATIC_FINAL_FIVE==5 condition */
    private goodG2B1(): void {
        let data: string | null;
        if (IO.STATIC_FINAL_FIVE !== 5) {
            /*
             * To maintain the original logic, this code path is designed to be unreachable
             * but still initializes 'data' to avoid potential type errors later.
             */
            data = null;
        } else {
            /* FIX: 'data' is intentionally set to a non-null value. */
            data = "This is not null";
        }

        if (IO.STATIC_FINAL_FIVE === 5) {
            /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null. */
            IO.writeLine("" + (data as string).length);
        }
    }

    /* goodG2B2() - uses a good source and a bad sink by reversing statements in the first if block */
    private goodG2B2(): void {
        let data: string | null;
        if (IO.STATIC_FINAL_FIVE === 5) {
            /* FIX: 'data' is intentionally set to a non-null value. */
            data = "This is not null";
        } else {
            /*
             * To maintain the original logic, this code path is designed to be unreachable
             * but still initializes 'data' to avoid potential type errors later.
             */
            data = null;
        }

        if (IO.STATIC_FINAL_FIVE === 5) {
            /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null. */
            IO.writeLine("" + (data as string).length);
        }
    }

    /* goodB2G1() - uses a bad source and a good sink by changing the second IO.STATIC_FINAL_FIVE==5 condition */
    private goodB2G1(): void {
        let data: string | null;
        if (IO.STATIC_FINAL_FIVE === 5) {
            /* POTENTIAL FLAW: 'data' is assigned null */
            data = null;
        } else {
            /*
             * To maintain the original logic, this code path is designed to be unreachable
             * but still initializes 'data' to avoid potential type errors later.
             */
            data = null;
        }

        if (IO.STATIC_FINAL_FIVE !== 5) {
            /* To maintain the original logic, this code path is designed to be unreachable. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: Check if 'data' is non-null before use. */
            if (data !== null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - uses a bad source and a good sink by reversing statements in the second if block */
    private goodB2G2(): void {
        let data: string | null;
        if (IO.STATIC_FINAL_FIVE === 5) {
            /* POTENTIAL FLAW: 'data' is assigned null */
            data = null;
        } else {
            /*
             * To maintain the original logic, this code path is designed to be unreachable
             * but still initializes 'data' to avoid potential type errors later.
             */
            data = null;
        }

        if (IO.STATIC_FINAL_FIVE === 5) {
            /* FIX: Check if 'data' is non-null before use. */
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

    /*
     * This 'main' method is typically used when building this test case for standalone testing.
     * It is not used when compiling all test cases as a single application, which is common
     * for source code analysis tools.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}