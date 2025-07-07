// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_04.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-04.tmpl.ts

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 04 Control flow: if(PRIVATE_STATIC_FINAL_TRUE) and if(PRIVATE_STATIC_FINAL_FALSE)
 *
 */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_04 extends AbstractTestCase {
    /* These constants are declared as 'readonly', ensuring their values are fixed and can be statically analyzed.
     */
    private static readonly PRIVATE_STATIC_FINAL_TRUE: boolean = true;
    private static readonly PRIVATE_STATIC_FINAL_FALSE: boolean = false;

    public bad(): void {
        let data: number[] | null;
        if (CWE476_NULL_Pointer_Dereference__int_array_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This code path is unreachable; however, it ensures 'data' is assigned to satisfy type checks. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__int_array_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java bug, we assert `data` is non-null. 
            // In a real ArkTS application, this would typically involve optional chaining `data?.length` or a null check.
            IO.writeLine("" + (data as number[]).length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first PRIVATE_STATIC_FINAL_TRUE to PRIVATE_STATIC_FINAL_FALSE */
    private goodG2B1(): void {
        let data: number[] | null;
        if (CWE476_NULL_Pointer_Dereference__int_array_04.PRIVATE_STATIC_FINAL_FALSE) {
            /* This code path is unreachable; however, it ensures 'data' is assigned to satisfy type checks. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = new Array<number>(5);
        }

        if (CWE476_NULL_Pointer_Dereference__int_array_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java bug, we assert `data` is non-null.
            IO.writeLine("" + (data as number[]).length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number[] | null;
        if (CWE476_NULL_Pointer_Dereference__int_array_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* FIX: hardcode data to non-null */
            data = new Array<number>(5);
        } else {
            /* This code path is unreachable; however, it ensures 'data' is assigned to satisfy type checks. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__int_array_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java bug, we assert `data` is non-null.
            IO.writeLine("" + (data as number[]).length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second PRIVATE_STATIC_FINAL_TRUE to PRIVATE_STATIC_FINAL_FALSE */
    private goodB2G1(): void {
        let data: number[] | null;
        if (CWE476_NULL_Pointer_Dereference__int_array_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This code path is unreachable; however, it ensures 'data' is assigned to satisfy type checks. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__int_array_04.PRIVATE_STATIC_FINAL_FALSE) {
            /* This code path is unreachable. */
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
        if (CWE476_NULL_Pointer_Dereference__int_array_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This code path is unreachable; however, it ensures 'data' is assigned to satisfy type checks. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__int_array_04.PRIVATE_STATIC_FINAL_TRUE) {
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

    /* The 'main' method is used for standalone testing or binary analysis, not when compiling all testcases together.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
