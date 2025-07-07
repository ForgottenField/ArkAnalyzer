/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_12.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-12.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: null_check_after_deref
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after the object has already been dereferenced
* Flow Variant: 12 Control flow: if(IO.staticReturnsTrueOrFalse())
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_12 extends AbstractTestCase {

    public bad(): void {
        if (IO.staticReturnsTrueOrFalse()) {
            {
                let myString: string | null = null;
                myString = "Hello";
                // In ArkTS, the length of a string is accessed as a property, not a method.
                IO.writeLine(myString.length);
                /* FLAW: Check for null after dereferencing the object. This null check is unnecessary. */
                if (myString != null) {
                    myString = "my, how I've changed";
                }
                IO.writeLine(myString.length);
            }
        } else {
            {
                let myString: string | null = null;
                myString = "Hello";

                IO.writeLine(myString.length);

                /* FIX: Don't check for null since we wouldn't reach this line if the object was null */
                myString = "my, how I've changed";

                IO.writeLine(myString.length);
            }
        }
    }

    /* good1() changes the "if" so that both branches use the GoodSink */
    private good1(): void {
        if (IO.staticReturnsTrueOrFalse()) {
            {
                let myString: string | null = null;
                myString = "Hello";
                IO.writeLine(myString.length);
                /* FIX: Don't check for null since we wouldn't reach this line if the object was null */
                myString = "my, how I've changed";
                IO.writeLine(myString.length);
            }
        } else {
            {
                let myString: string | null = null;
                myString = "Hello";

                IO.writeLine(myString.length);

                /* FIX: Don't check for null since we wouldn't reach this line if the object was null */
                myString = "my, how I've changed";

                IO.writeLine(myString.length);
            }
        }
    }

    public good(): void {
        this.good1();
    }

    /* Below is the main() function. It is only used when building this test case on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the test cases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
