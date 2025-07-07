import { IO, AbstractTestCase } from './testcasesupport';

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_02.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-02.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: null_check_after_deref
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after the object has already been dereferenced
* Flow Variant: 02 Control flow: if(true) and if(false)
*
* */

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_02 extends AbstractTestCase {

    public bad(): void {
        if (true) {
            {
                let myString: string | null = null; // Declare myString, initially null
                myString = "Hello"; // Assign a non-null string
                // Accessing the length property. At this point, myString is guaranteed non-null.
                IO.writeLine(myString.length);
                /* FLAW: This null check is redundant in ArkTS, as the object has already been safely accessed. */
                if (myString != null) {
                    myString = "my, how I\'ve changed"; // Reassign myString
                }
                // Accessing the length property again. myString is still non-null.
                IO.writeLine(myString.length);
            }
        }
    }

    /* good1() changes true to false */
    private good1(): void {
        if (false) {
            /* This code block is unreachable in ArkTS due to the 'if (false)' condition. */
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null; // Declare myString, initially null
                myString = "Hello"; // Assign a non-null string

                // Accessing the length property. At this point, myString is guaranteed non-null.
                IO.writeLine(myString.length);

                /* FIX: No null check is needed here, as the object has already been safely accessed. */
                myString = "my, how I\'ve changed"; // Reassign myString

                // Accessing the length property again. myString is still non-null.
                IO.writeLine(myString.length);
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (true) {
            {
                let myString: string | null = null; // Declare myString, initially null
                myString = "Hello"; // Assign a non-null string
                // Accessing the length property. At this point, myString is guaranteed non-null.
                IO.writeLine(myString.length);
                /* FIX: No null check is needed here, as the object has already been safely accessed. */
                myString = "my, how I\'ve changed"; // Reassign myString
                // Accessing the length property again. myString is still non-null.
                IO.writeLine(myString.length);
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    /* This is the main entry point for the test case when built independently.
     * It is not typically used when compiling all test cases together for static analysis.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}