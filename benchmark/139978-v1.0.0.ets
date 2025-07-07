/*
 * @description
 * This test case addresses CWE-476: NULL Pointer Dereference.
 * Sinks: deref_after_check
 *    GoodSink: Do not dereference an object if it is null
 *    BadSink : Dereference after checking to see if an object is null
 * Flow Variant: 17 Control flow: for loops
 *
 */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_17 extends AbstractTestCase {
    public bad(): void {
        for (let j = 0; j < 1; j++) {
            {
                /* FLAW: Check for null, but still dereference the object */
                let myString: string | null = null;
                if (myString == null) {
                    // To replicate the original logic, we attempt to access a property on a potentially null value.
                    // In ArkTS/TypeScript, string length is a property, not a method.
                    IO.writeLine(myString.length);
                }
            }
        }
    }

    /* good1() use the GoodSinkBody in the for statement */
    private good1(): void {
        for (let k = 0; k < 1; k++) {
            {
                /* FIX: Check for null and do not dereference the object if it is null */
                let myString: string | null = null;
                if (myString == null) {
                    IO.writeLine("The string is null");
                }
            }
        }
    }

    public good(): void {
        this.good1();
    }

    /* This static method is typically used for standalone testing of this test case
     * or for building a test binary. It is not part of the standard application
     * execution flow when compiled with other test cases, which is how static
     * analysis tools usually test.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
