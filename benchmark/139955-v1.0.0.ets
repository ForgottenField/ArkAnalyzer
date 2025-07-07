/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__binary_if_11.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-11.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: binary_if
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after an object has already been dereferenced
* Flow Variant: 11 Control flow: if(IO.staticReturnsTrue()) and if(IO.staticReturnsFalse())
*
* */

// ArkTS equivalent for importing testcasesupport classes.
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// Define the class extending AbstractTestCase.
export class CWE476_NULL_Pointer_Dereference__binary_if_11 extends AbstractTestCase {

    // Bad method demonstrating the null pointer dereference.
    public bad(): void {
        if (IO.staticReturnsTrue()) {
            {
                let myString: string | null = null;
                // In this flawed logic, using a single '&' for boolean evaluation forces both sides of the expression
                // to be evaluated, leading to a null pointer dereference if 'myString' is null.
                if ((myString != null) & (myString.length > 0)) { // myString.length will throw if myString is null
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    // Good method demonstrating a fixed approach (good1).
    // good1() changes IO.staticReturnsTrue() to IO.staticReturnsFalse().
    private good1(): void {
        if (IO.staticReturnsFalse()) {
            // This section of code will never execute due to the control flow condition.
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null;
                // To fix, use '&&' in the 'if' statement. This ensures that if the left side of the expression
                // is false, the right side is not evaluated, preventing a null pointer dereference.
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    // Good method demonstrating a fixed approach (good2).
    // good2() reverses the bodies in the if statement.
    private good2(): void {
        if (IO.staticReturnsTrue()) {
            {
                let myString: string | null = null;
                // To fix, use '&&' in the 'if' statement. This ensures that if the left side of the expression
                // is false, the right side is not evaluated, preventing a null pointer dereference.
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    // Public method to run all good test cases.
    public good(): void {
        this.good1();
        this.good2();
    }

    // This 'main' method is provided for standalone testing and analysis purposes,
    // not for integration into a larger application.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}