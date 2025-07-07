/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_07.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-07.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: null_check_after_deref
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after the object has already been dereferenced
* Flow Variant: 07 Control flow: if(privateFive==5) and if(privateFive!=5)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_07 extends AbstractTestCase {

    /* This variable is not declared 'readonly', but it is never reassigned,
     * allowing analysis tools to infer its constant value.
     */
    private privateFive: number = 5;

    public bad(): void {
        if (this.privateFive === 5) {
            {
                let myString: string | null = null; // Declare with explicit nullability to match original Java's potential for null.
                myString = "Hello";
                // In ArkTS, accessing a property like 'length' on a string variable is direct.
                // This line will execute without error as 'myString' is "Hello". The '!' asserts non-null
                // to replicate Java's direct access behavior which would throw if null.
                IO.writeLine(myString!.length);
                /* FLAW: Check for null after dereferencing the object. This null check is unnecessary. */
                if (myString !== null) { // This check is redundant as myString is guaranteed non-null here.
                    myString = "my, how I've changed";
                }
                // In ArkTS, accessing a property like 'length' on a string variable is direct.
                // This line will execute without error as 'myString' is "my, how I've changed".
                IO.writeLine(myString!.length);
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
                myString = "Hello";

                // In ArkTS, accessing a property like 'length' on a string variable is direct.
                IO.writeLine(myString!.length);

                /* FIX: Don't check for null since we wouldn't reach this line if the object was null. */
                myString = "my, how I've changed";

                // In ArkTS, accessing a property like 'length' on a string variable is direct.
                IO.writeLine(myString!.length);
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (this.privateFive === 5) {
            {
                let myString: string | null = null;
                myString = "Hello";
                // In ArkTS, accessing a property like 'length' on a string variable is direct.
                IO.writeLine(myString!.length);
                /* FIX: Don't check for null since we wouldn't reach this line if the object was null. */
                myString = "my, how I've changed";
                // In ArkTS, accessing a property like 'length' on a string variable is direct.
                IO.writeLine(myString!.length);
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