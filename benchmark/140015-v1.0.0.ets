/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_01.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-01.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: null_check_after_deref
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after the object has already been dereferenced
* Flow Variant: 01 Baseline
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

class CWE476_NULL_Pointer_Dereference__null_check_after_deref_01 extends AbstractTestCase {

    public bad(): void {
        {
            let myString: string | null = null;
            myString = "Hello";

            // Accessing the 'length' property of myString.
            // To replicate the original logic, this operation proceeds directly as myString is guaranteed to be non-null.
            IO.writeLine(myString.length);

            /* To replicate the original logic, this check for null is performed after the string's length has already been accessed.
             * This demonstrates a scenario where a null check is redundant because the object was already successfully used.
             */
            if (myString != null)
            {
                myString = "my, how I've changed";
            }

            // Accessing the 'length' property of myString again. This is also safe.
            IO.writeLine(myString.length);
        }
    }

    public good(): void {
        this.good1();
    }

    private good1(): void {
        {
            let myString: string | null = null;
            myString = "Hello";

            // Accessing the 'length' property of myString.
            // To replicate the original logic, this operation proceeds directly as myString is guaranteed to be non-null.
            IO.writeLine(myString.length);

            /* This is the corrected approach: the null check is removed as it's unnecessary after the string's length has already been accessed successfully.
             * The code directly proceeds with the intended operation as the object is known to be valid at this point.
             */
            myString = "my, how I've changed";

            // Accessing the 'length' property of myString again. This is also safe.
            IO.writeLine(myString.length);
        }
    }

    /* Below is the main() method. It is only used when building this test case on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the test cases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
