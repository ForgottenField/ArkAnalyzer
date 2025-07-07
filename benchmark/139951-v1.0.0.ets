/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__binary_if_07.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-07.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: binary_if
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after an object has already been dereferenced
* Flow Variant: 07 Control flow: if(privateFive==5) and if(privateFive!=5)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_07 extends AbstractTestCase {
    /* The variable below is not declared "readonly", but is never assigned
     * any other value so a tool should be able to identify that reads of
     * this will always give its initialized value.
     */
    private privateFive: number = 5;

    public bad(): void {
        if (this.privateFive === 5) {
            {
                let myString: string | null = null;
                /* FLAW: Using a single & (bitwise AND) in the if statement will cause both sides of the expression to be evaluated, even if the left side is false, thus causing a Null Pointer Dereference if the left operand is null. */
                if ((myString !== null) & (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good1() changes privateFive==5 to privateFive!=5 */
    private good1(): void {
        if (this.privateFive !== 5) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null;

                /* FIX: Use && (logical AND) in the if statement. This ensures that if the left side of the expression evaluates to false (e.g., the variable is null), the right side will not be evaluated, preventing a Null Pointer Dereference. */
                if ((myString !== null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (this.privateFive === 5) {
            {
                let myString: string | null = null;
                /* FIX: Use && (logical AND) in the if statement. This ensures that if the left side of the expression evaluates to false (e.g., the variable is null), the right side will not be evaluated, preventing a Null Pointer Dereference. */
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
        AbstractTestCase.mainFromParent(args);
    }
}