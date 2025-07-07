/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__binary_if_02.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-02.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: binary_if
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after an object has already been dereferenced
* Flow Variant: 02 Control flow: if(true) and if(false)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_02 extends AbstractTestCase {

    bad(): void {
        if (true) {
            {
                let myString: string | null = null;
                /* FLAW: In the original Java code, the bitwise AND (&) operator in the 'if' statement forced the evaluation
                 * of both operands, even if the first was false. This caused 'myString.length()' to be called on a null object.
                 * To replicate this flaw in ArkTS, we explicitly force access to 'myString!.length',
                 * which will result in a runtime error (e.g., TypeError: Cannot read properties of null) when 'myString' is null.
                 * The subsequent logical AND will not be fully evaluated due to this error. */
                let firstCondition = (myString != null);
                // This line will cause the runtime error as we are accessing 'length' on a null 'myString'.
                let secondCondition = (myString!.length > 0);

                // The 'if' statement below will not be reached because the assignment to 'secondCondition' above throws an error.
                if (firstCondition && secondCondition) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good1() changes true to false */
    private good1(): void {
        if (false) {
            /* INCIDENTAL: Dead Code - the code below will never run due to the 'if (false)' condition. */
            IO.writeLine("Benign, fixed string");
        } else {

            {
                let myString: string | null = null;

                /* FIX: Using logical AND (&&) ensures that if the left side of the expression (myString != null) is false,
                 * the right side (myString.length > 0) will not be evaluated, preventing a runtime error.
                 * ArkTS/TypeScript's control flow analysis ensures 'myString' is treated as non-null within the '&&' block. */
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }

        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (true) {
            {
                let myString: string | null = null;
                /* FIX: Using logical AND (&&) ensures that if the left side of the expression (myString != null) is false,
                 * the right side (myString.length > 0) will not be evaluated, preventing a runtime error.
                 * ArkTS/TypeScript's control flow analysis ensures 'myString' is treated as non-null within the '&&' block. */
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
