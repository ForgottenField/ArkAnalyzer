// Translated from Java to ArkTS
// Original file: CWE476_NULL_Pointer_Dereference__Integer_06.java

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_06 extends AbstractTestCase {
    // The variable below is declared "readonly", which indicates its value will not change after initialization.
    private static readonly PRIVATE_STATIC_FINAL_FIVE: number = 5;

    public bad(): void {
        let data: number | null; // Replicates the nullable Integer type from Java
        if (CWE476_NULL_Pointer_Dereference__Integer_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // POTENTIAL FLAW: 'data' is assigned a null value.
            data = null;
        } else {
            // This is incidental dead code; it is included to ensure the 'data' variable is always initialized to prevent compilation errors.
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__Integer_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // POTENTIAL FLAW: Attempting to use 'data' when it might be null will lead to a dereference error.
            IO.writeLine("" + data!.toString()); // Replicates Java's data.toString() leading to NPE if data is null
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first PRIVATE_STATIC_FINAL_FIVE==5 to PRIVATE_STATIC_FINAL_FIVE!=5 */
    private goodG2B1(): void {
        let data: number | null;
        if (CWE476_NULL_Pointer_Dereference__Integer_06.PRIVATE_STATIC_FINAL_FIVE !== 5) {
            // This is incidental dead code; it is included to ensure the 'data' variable is always initialized to prevent compilation errors.
            data = null;
        } else {
            // FIX: Assign a non-null value to 'data'.
            data = 5; // Equivalent to Integer.valueOf(5)
        }

        if (CWE476_NULL_Pointer_Dereference__Integer_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // POTENTIAL FLAW: Attempting to use 'data' when it might be null will lead to a dereference error.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number | null;
        if (CWE476_NULL_Pointer_Dereference__Integer_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // FIX: Assign a non-null value to 'data'.
            data = 5;
        } else {
            // This is incidental dead code; it is included to ensure the 'data' variable is always initialized to prevent compilation errors.
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__Integer_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // POTENTIAL FLAW: Attempting to use 'data' when it might be null will lead to a dereference error.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second PRIVATE_STATIC_FINAL_FIVE==5 to PRIVATE_STATIC_FINAL_FIVE!=5 */
    private goodB2G1(): void {
        let data: number | null;
        if (CWE476_NULL_Pointer_Dereference__Integer_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // POTENTIAL FLAW: 'data' is assigned a null value.
            data = null;
        } else {
            // This is incidental dead code; it is included to ensure the 'data' variable is always initialized to prevent compilation errors.
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__Integer_06.PRIVATE_STATIC_FINAL_FIVE !== 5) {
            // This is incidental dead code; it will not be executed.
            IO.writeLine("Benign, fixed string");
        } else {
            // FIX: Check if 'data' is non-null before use.
            if (data !== null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if */
    private goodB2G2(): void {
        let data: number | null;
        if (CWE476_NULL_Pointer_Dereference__Integer_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // POTENTIAL FLAW: 'data' is assigned a null value.
            data = null;
        } else {
            // This is incidental dead code; it is included to ensure the 'data' variable is always initialized to prevent compilation errors.
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__Integer_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // FIX: Check if 'data' is non-null before use.
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

    // This 'main' method is for standalone testing or binary analysis; it's not used when all test cases are compiled together.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}