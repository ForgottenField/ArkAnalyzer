/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_14.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-14.tmpl.java
*/
/*
 * @description
 * CWE: 476 NULL Pointer Dereference
 * Sinks: null_check_after_deref
 * GoodSink: Do not check for null after the object has been dereferenced
 * BadSink : Check for null after the object has already been dereferenced
 * Flow Variant: 14 Control flow: if(IO.staticFive==5) and if(IO.staticFive!=5)
 *
 * */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_14 extends AbstractTestCase {

    public bad(): void { // Checked exceptions like 'throws Throwable' are not applicable in ArkTS/TypeScript.
        if (IO.staticFive == 5) {
            {
                let myString: string | null = null; // Declare 'myString' with a type that allows both string and null.
                myString = "Hello";
                // In ArkTS/TypeScript, 'string.length' is a property, not a method call.
                // At this point, 'myString' holds a non-null string value, so no null pointer dereference occurs.
                IO.writeLine(myString.length);
                /* FLAW: Check for null after dereferencing the object. This null check is unnecessary because 'myString' is guaranteed to be non-null here. */
                if (myString != null) { // This null check is redundant as 'myString' is known to be non-null.
                    myString = "my, how I've changed";
                }
                // 'myString' continues to hold a non-null string value.
                IO.writeLine(myString.length);
            }
        }
    }

    /* good1() changes IO.staticFive==5 to IO.staticFive!=5 */
    private good1(): void { // Checked exceptions like 'throws Throwable' are not applicable in ArkTS/TypeScript.
        if (IO.staticFive != 5) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null;
                myString = "Hello";

                // In ArkTS/TypeScript, 'string.length' is a property, not a method call.
                IO.writeLine(myString.length);

                /* FIX: Don't check for null since the execution flow ensures the object is not null at this point. */
                myString = "my, how I've changed";

                // In ArkTS/TypeScript, 'string.length' is a property, not a method call.
                IO.writeLine(myString.length);
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void { // Checked exceptions like 'throws Throwable' are not applicable in ArkTS/TypeScript.
        if (IO.staticFive == 5) {
            {
                let myString: string | null = null;
                myString = "Hello";
                // In ArkTS/TypeScript, 'string.length' is a property, not a method call.
                IO.writeLine(myString.length);
                /* FIX: Don't check for null since the execution flow ensures the object is not null at this point. */
                myString = "my, how I've changed";
                // In ArkTS/TypeScript, 'string.length' is a property, not a method call.
                IO.writeLine(myString.length);
            }
        }
    }

    public good(): void { // Checked exceptions like 'throws Throwable' are not applicable in ArkTS/TypeScript.
        this.good1();
        this.good2();
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    // The 'main' method in ArkTS/TypeScript is typically a static function that serves as the entry point.
    static main(args: string[]): void { // Removed Java-specific checked exceptions.
        AbstractTestCase.mainFromParent(args);
    }
}