/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_10.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-10.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: null_check_after_deref
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after the object has already been dereferenced
* Flow Variant: 10 Control flow: if(IO.staticTrue) and if(IO.staticFalse)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_10 extends AbstractTestCase {
    public bad(): void {
        if (IO.staticTrue) {
            {
                let myString: string | null = null; // Declare myString as potentially null
                myString = "Hello"; // Assign a non-null string
                // Accessing the 'length' property directly. TypeScript's flow analysis
                // understands myString is not null here.
                IO.writeLine(myString.length);
                /* FLAW: This null check is redundant, as the object was already used safely and is known to be non-null. */
                if (myString !== null) { // Use strict inequality for null check
                    myString = "my, how I've changed";
                }
                // Accessing the 'length' property again.
                IO.writeLine(myString.length);
            }
        }
    }

    /* good1() changes IO.staticTrue to IO.staticFalse */
    private good1(): void {
        if (IO.staticFalse) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null; // Declare myString as potentially null
                myString = "Hello"; // Assign a non-null string

                // Accessing the 'length' property directly.
                IO.writeLine(myString.length);

                /* FIX: This check is unnecessary as the object is guaranteed to be non-null at this point. */
                myString = "my, how I've changed";

                // Accessing the 'length' property again.
                IO.writeLine(myString.length);
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (IO.staticTrue) {
            {
                let myString: string | null = null; // Declare myString as potentially null
                myString = "Hello"; // Assign a non-null string
                // Accessing the 'length' property directly.
                IO.writeLine(myString.length);
                /* FIX: This check is unnecessary as the object is guaranteed to be non-null at this point. */
                myString = "my, how I've changed";
                // Accessing the 'length' property again.
                IO.writeLine(myString.length);
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