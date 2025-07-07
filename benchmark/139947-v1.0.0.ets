/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__binary_if_03.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-03.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: binary_if
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after an object has already been dereferenced
* Flow Variant: 03 Control flow: if(5==5) and if(5!=5)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

class CWE476_NULL_Pointer_Dereference__binary_if_03 extends AbstractTestCase {

    public bad(): void {
        if (5 == 5) {
            {
                let myString: string | null = null;
                /* FLAW: In ArkTS, using a single '&' (bitwise AND) with boolean operands evaluates both sides of the expression.
                 * This can lead to a Null Pointer Dereference if the left side is null, as the right side will still be evaluated. */
                if ((myString != null) & (myString.length > 0)) { // myString.length in ArkTS corresponds to myString.length() in Java
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good1() changes 5==5 to 5!=5 */
    private good1(): void {
        if (5 != 5) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null;

                /* FIX: In ArkTS, use '&&' (logical AND) in the if statement. This ensures short-circuit evaluation,
                 * meaning if the left side of the expression is false, the right side will not be evaluated. */
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (5 == 5) {
            {
                let myString: string | null = null;
                /* FIX: In ArkTS, use '&&' (logical AND) in the if statement. This ensures short-circuit evaluation,
                 * meaning if the left side of the expression is false, the right side will not be evaluated. */
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
    public static main(args: string[]): void { // ArkTS does not use 'throws' for this context like Java
        AbstractTestCase.mainFromParent(args);
    }
}