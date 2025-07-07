/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_03.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-03.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: null_check_after_deref
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after the object has already been dereferenced
* Flow Variant: 03 Control flow: if(5==5) and if(5!=5)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_03 extends AbstractTestCase {

    public bad(): void {
        if (5 == 5) {
            {
                // In ArkTS, `null` is a distinct primitive type. We declare myString as potentially string or null.
                let myString: string | null = null;
                // Assigning a non-null string literal
                myString = "Hello";
                // Accessing the 'length' property of the string.
                // At this point, myString is "Hello", so this is a valid operation.
                IO.writeLine(myString.length);
                /* FLAW: This null check is redundant after the string has already been successfully dereferenced. */
                if (myString != null) {
                    myString = "my, how I've changed";
                }
                // Accessing the 'length' property again.
                // At this point, myString is "my, how I've changed", so this is also a valid operation.
                IO.writeLine(myString.length);
            }
        }
    }

    /* good1() changes 5==5 to 5!=5 */
    private good1(): void {
        if (5 != 5) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never execute. */
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null;
                myString = "Hello";

                IO.writeLine(myString.length);

                /* FIX: There's no need for a null check here, as the string has already been successfully used. */
                myString = "my, how I've changed";

                IO.writeLine(myString.length);
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (5 == 5) {
            {
                let myString: string | null = null;
                myString = "Hello";
                IO.writeLine(myString.length);
                /* FIX: There's no need for a null check here, as the string has already been successfully used. */
                myString = "my, how I've changed";
                IO.writeLine(myString.length);
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    /* This 'main' function is primarily for standalone testing or for building a binary
     * to use in testing binary analysis tools. It is not used when compiling all the
     * testcases as one application, which is how source code analysis tools are typically tested.
     */
    public static main(args: string[]): void {
        // Calling the parent's main method to execute the test cases.
        AbstractTestCase.mainFromParent(args);
    }
}