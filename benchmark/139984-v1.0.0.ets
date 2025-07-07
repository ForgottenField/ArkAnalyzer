/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_06.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-06.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 06 Control flow: if(PRIVATE_STATIC_FINAL_FIVE==5) and if(PRIVATE_STATIC_FINAL_FIVE!=5)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

class CWE476_NULL_Pointer_Dereference__int_array_06 extends AbstractTestCase {
    /* The variable below is declared "readonly", so a tool should be able
     * to identify that reads of this will always give its initialized
     * value. */
    private static readonly PRIVATE_STATIC_FINAL_FIVE: number = 5;

    public bad(): void {
        let data: number[] | null;

        if (CWE476_NULL_Pointer_Dereference__int_array_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            /* POTENTIAL FLAW: 'data' is assigned null */
            data = null;
        } else {
            /* This code path is unreachable due to the conditional logic,
             * but it ensures 'data' is initialized to avoid compile-time errors in environments with strict type checking. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__int_array_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its 'length' property. */
            IO.writeLine("" + data!.length);
        }
    }

    private goodG2B1(): void {
        let data: number[] | null;
        if (CWE476_NULL_Pointer_Dereference__int_array_06.PRIVATE_STATIC_FINAL_FIVE !== 5) {
            /* This code path is unreachable due to the conditional logic,
             * but it ensures 'data' is initialized to avoid compile-time errors in environments with strict type checking. */
            data = null;
        } else {
            /* FIX: 'data' is explicitly set to a non-null array. */
            data = new Array<number>(5);
        }

        if (CWE476_NULL_Pointer_Dereference__int_array_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its 'length' property.
             * In this specific scenario, 'data' is guaranteed to be non-null due to the preceding 'if-else' block,
             * but the 'sink' itself is vulnerable if 'data' were null. */
            IO.writeLine("" + data!.length);
        }
    }

    private goodG2B2(): void {
        let data: number[] | null;
        if (CWE476_NULL_Pointer_Dereference__int_array_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            /* FIX: 'data' is explicitly set to a non-null array. */
            data = new Array<number>(5);
        } else {
            /* This code path is unreachable due to the conditional logic,
             * but it ensures 'data' is initialized to avoid compile-time errors in environments with strict type checking. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__int_array_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its 'length' property.
             * In this specific scenario, 'data' is guaranteed to be non-null due to the preceding 'if-else' block,
             * but the 'sink' itself is vulnerable if 'data' were null. */
            IO.writeLine("" + data!.length);
        }
    }

    private goodB2G1(): void {
        let data: number[] | null;
        if (CWE476_NULL_Pointer_Dereference__int_array_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            /* POTENTIAL FLAW: 'data' is assigned null */
            data = null;
        } else {
            /* This code path is unreachable due to the conditional logic,
             * but it ensures 'data' is initialized to avoid compile-time errors in environments with strict type checking. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__int_array_06.PRIVATE_STATIC_FINAL_FIVE !== 5) {
            /* This code path is unreachable due to the conditional logic. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: Validate that 'data' is non-null before attempting to access its 'length' property. */
            if (data !== null) {
                IO.writeLine("" + data.length);
            }
            else {
                IO.writeLine("data is null");
            }
        }
    }

    private goodB2G2(): void {
        let data: number[] | null;
        if (CWE476_NULL_Pointer_Dereference__int_array_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            /* POTENTIAL FLAW: 'data' is assigned null */
            data = null;
        } else {
            /* This code path is unreachable due to the conditional logic,
             * but it ensures 'data' is initialized to avoid compile-time errors in environments with strict type checking. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__int_array_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            /* FIX: Validate that 'data' is non-null before attempting to access its 'length' property. */
            if (data !== null) {
                IO.writeLine("" + data.length);
            }
            else {
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

    /* Below is the main() function. It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}