/* TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_17.ts
 * Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
 * Template File: point-flaw-17.tmpl.ts
 */
/*
 * @description
 * CWE: 476 NULL Pointer Dereference
 * Sinks: null_check_after_deref
 *    GoodSink: Do not check for null after the object has been dereferenced
 *    BadSink : Check for null after the object has already been dereferenced
 * Flow Variant: 17 Control flow: for loops
 *
 */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_17 extends AbstractTestCase {

    public bad(): void {
        // The original Java code uses a for loop that iterates once (j = 0 to < 1).
        // This loop structure is replicated in ArkTS.
        for (let j: number = 0; j < 1; j++) {
            {
                // In the original Java, myString is initialized to null, then immediately assigned a non-null value.
                // In ArkTS, 'string | null' is used to represent a variable that could potentially be null,
                // though in this specific execution path, it's quickly assigned a string.
                let myString: string | null = null;
                myString = "Hello";
                // The '!' non-null assertion operator is used here to mirror the direct dereference of 'myString.length()'
                // in Java. In this specific execution path, myString is guaranteed not to be null when '.length' is accessed.
                IO.writeLine(myString!.length);
                /* FLAW: This null check occurs after 'myString' has already been accessed (dereferenced)
                 * using '.length' above. In this context, this null check is redundant and does not prevent
                 * a potential null dereference, as the access has already occurred.
                 */
                if (myString !== null) {
                    myString = "my, how I've changed";
                }
                // Accessing length again. 'myString' is guaranteed not to be null here as well.
                IO.writeLine(myString!.length);
            }
        }
    }

    /* good1() replicates the good sink body within a for loop */
    private good1(): void {
        // The original Java code uses a for loop that iterates once (k = 0 to < 1).
        // This loop structure is replicated in ArkTS.
        for (let k: number = 0; k < 1; k++) {
            {
                // Similar to the bad method, myString is initialized as nullable then assigned a string.
                let myString: string | null = null;
                myString = "Hello";
                // Direct access using '!' as 'myString' is known to be non-null here.
                IO.writeLine(myString!.length);
                /* FIX: In ArkTS, this mirrors the Java behavior where there is no redundant null check.
                 * Since 'myString' was just assigned "Hello", it's guaranteed to be non-null when '.length' is called.
                 * The subsequent assignment is safe without a check.
                 */
                myString = "my, how I've changed";
                IO.writeLine(myString!.length);
            }
        }
    }

    public good(): void {
        this.good1();
    }

    /* Below is the main() method. It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        // This calls a function from the parent test case support, mirroring the Java behavior.
        // It's used for standalone execution of this test case.
        AbstractTestCase.mainFromParent(args);
    }
}
