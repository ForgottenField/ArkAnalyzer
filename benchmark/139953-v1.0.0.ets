/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__binary_if_09.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-09.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: binary_if
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after an object has already been dereferenced
* Flow Variant: 09 Control flow: if(IO.STATIC_FINAL_TRUE) and if(IO.STATIC_FINAL_FALSE)
*
* */

// To replicate the original logic, we import necessary utilities from a common testcasesupport module.
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_09 extends AbstractTestCase {

    public bad(): void {
        if (IO.STATIC_FINAL_TRUE) {
            // A block to encapsulate the string declaration.
            {
                let myString: string | null = null;
                /* FLAW: Using a single & (bitwise AND) in the if statement will cause both sides of the expression to be evaluated.
                 * This leads to a Null Pointer Dereference at runtime when attempting to access the 'length' property of a null string. */
                if ((myString != null) & (myString!.length > 0)) { // Use ! to assert non-null, replicating the runtime dereference of null
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good1() changes IO.STATIC_FINAL_TRUE to IO.STATIC_FINAL_FALSE */
    private good1(): void {
        if (IO.STATIC_FINAL_FALSE) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
        } else {
            // A block to encapsulate the string declaration.
            {
                let myString: string | null = null;

                /* FIX: Use && (logical AND) in the if statement so that if the left side of the expression evaluates to false,
                 * the right side will not be evaluated, preventing the dereference of a null value. */
                if ((myString != null) && (myString!.length > 0)) { // myString! used for consistency, though '&&' prevents dereference
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (IO.STATIC_FINAL_TRUE) {
            // A block to encapsulate the string declaration.
            {
                let myString: string | null = null;
                /* FIX: Use && (logical AND) in the if statement so that if the left side of the expression evaluates to false,
                 * the right side will not be evaluated, preventing the dereference of a null value. */
                if ((myString != null) && (myString!.length > 0)) { // myString! used for consistency, though '&&' prevents dereference
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    /* This 'main' function serves as an entry point for standalone execution or for building a binary to use in testing binary
     * analysis tools. It is not typically used when compiling all test cases as a single application, which is how
     * source code analysis tools are tested. */
    public static main(args: string[]): void {
        // Calls the parent class's main method to execute the test cases.
        AbstractTestCase.mainFromParent(args);
    }
}