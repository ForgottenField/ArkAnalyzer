/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__binary_if_10.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-10.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: binary_if
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after an object has already been dereferenced
* Flow Variant: 10 Control flow: if(IO.staticTrue) and if(IO.staticFalse)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_10 extends AbstractTestCase {
    public bad(): void {
        if (IO.staticTrue) {
            {
                let myString: string | null = null;
                // FLAW: To replicate the original logic, we use the bitwise AND operator (which operates on numbers)
                // after converting boolean results to numbers. This ensures both sides of the expression are evaluated,
                // causing a null pointer dereference if 'myString' is null, as 'myString!.length' will be accessed.
                if ((Number(myString !== null)) & (Number(myString!.length > 0))) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good1() changes IO.staticTrue to IO.staticFalse */
    private good1(): void {
        if (IO.staticFalse) {
            // This code block is intentionally unreachable due to the condition 'IO.staticFalse',
            // replicating the original 'dead code' aspect for testing purposes.
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null;

                // FIX: We use the logical AND operator (&&) so that if the left side of the expression is false,
                // the right side is not evaluated, preventing a null dereference.
                if ((myString !== null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (IO.staticTrue) {
            {
                let myString: string | null = null;
                // FIX: We use the logical AND operator (&&) so that if the left side of the expression is false,
                // the right side is not evaluated, preventing a null dereference.
                if ((myString !== null) && (myString.length > 0)) {
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
    public static main(args: string[]): void {
        AbstractTestCaseBase.mainFromParent(args);
    }
}