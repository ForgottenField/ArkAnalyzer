/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_16.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-16.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: null_check_after_deref
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after the object has already been dereferenced
* Flow Variant: 16 Control flow: while(true)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_16 extends AbstractTestCase {

    bad(): void {
        while (true) {
            {
                let myString: string | null = null; // Declare myString and allow it to be null, mirroring the original variable initialization.
                myString = "Hello"; // Assign a non-null string value.
                // In ArkTS, 'length' is a property of a string, not a method.
                // This line accesses the 'length' property of 'myString'.
                IO.writeLine(myString.length);
                /* FLAW: Check for null after dereferencing the object. This null check is unnecessary. */
                // The original logic is replicated: 'myString' is guaranteed to be non-null here,
                // making the null check redundant but preserving the flaw.
                if (myString !== null) {
                    myString = "my, how I've changed";
                }
                // This line accesses the 'length' property of 'myString' again.
                IO.writeLine(myString.length);
            }
            break;
        }
    }

    /* good1() change the conditions on the while statements */
    private good1(): void {
        while (true) {
            {
                let myString: string | null = null; // Declare myString and allow it to be null.
                myString = "Hello"; // Assign a non-null string value.
                // This line accesses the 'length' property of 'myString'.
                IO.writeLine(myString.length);
                /* FIX: Don't check for null since we wouldn't reach this line if the object was null */
                // The original logic is replicated here, assigning a new value to myString.
                myString = "my, how I've changed";
                // This line accesses the 'length' property of 'myString' again.
                IO.writeLine(myString.length);
            }
            break;
        }
    }

    good(): void {
        this.good1();
    }

    /* This 'main' function is part of the test runner setup.
     * It is primarily used for individual testing of this test case
     * or when building a specific binary for analysis tools.
     * It is typically not used when compiling all test cases as a single application,
     * which is a common approach for source code analysis tools.
     */
    static main(args: string[]): void {
        AbstractTestCaseBase.mainFromParent(args);
    }
}