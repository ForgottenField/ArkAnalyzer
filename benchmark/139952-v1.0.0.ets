/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__binary_if_08.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-08.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: binary_if
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after an object has already been dereferenced
* Flow Variant: 08 Control flow: if(privateReturnsTrue()) and if(privateReturnsFalse())
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_08 extends AbstractTestCase {

    // The methods below always return the same value, which helps static analysis tools identify predictable control flow.
    private privateReturnsTrue(): boolean {
        return true;
    }

    private privateReturnsFalse(): boolean {
        return false;
    }

    public bad(): void {
        if (this.privateReturnsTrue()) {
            {
                let myString: string | null = null;
                // FLAW: Using the bitwise AND ('&') operator with boolean operands in the 'if' statement
                // causes both sides of the expression to be evaluated. This leads to a null pointer dereference
                // when attempting to access 'length' on a 'null' value.
                if ((myString !== null) & (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good1() changes privateReturnsTrue() to privateReturnsFalse() */
    private good1(): void {
        if (this.privateReturnsFalse()) {
            // INCIDENTAL: This code is unreachable due to the preceding condition.
            IO.writeLine("Benign, fixed string");
        } else {

            {
                let myString: string | null = null;

                // FIX: Using the logical AND ('&&') operator ensures short-circuit evaluation:
                // if the left side is false, the right side is not evaluated, preventing null pointer dereferences.
                if ((myString !== null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }

        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (this.privateReturnsTrue()) {
            {
                let myString: string | null = null;
                // FIX: Using the logical AND ('&&') operator ensures short-circuit evaluation:
                // if the left side is false, the right side is not evaluated, preventing null pointer dereferences.
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

    // This 'main' method is for standalone testing or binary analysis tool testing.
    // It is not part of the aggregated test suite compilation used for source code analysis tools.
    public static main(args: string[]): void {
        CWE476_NULL_Pointer_Dereference__binary_if_08.mainFromParent(args);
    }
}
