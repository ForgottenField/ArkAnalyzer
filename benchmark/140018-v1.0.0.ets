/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_04.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-04.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: null_check_after_deref
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after the object has already been dereferenced
* Flow Variant: 04 Control flow: if(PRIVATE_STATIC_FINAL_TRUE) and if(PRIVATE_STATIC_FINAL_FALSE)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_04 extends AbstractTestCase {
    /* These constant variables are declared 'readonly', meaning their values
     * are set once and cannot be changed. This allows tools to confidently
     * determine their initialized values.
     */
    private static readonly PRIVATE_STATIC_FINAL_TRUE: boolean = true;
    private static readonly PRIVATE_STATIC_FINAL_FALSE: boolean = false;

    public bad(): void { // In ArkTS, method signatures typically do not declare 'throws Throwable'.
        if (CWE476_NULL_Pointer_Dereference__null_check_after_deref_04.PRIVATE_STATIC_FINAL_TRUE) {
            {
                let myString: string | null = null; // Declare with '| null' to explicitly allow null, mirroring Java's nullable reference type.
                myString = "Hello";
                // At this point, 'myString' is "Hello", so accessing its 'length' property is safe.
                IO.writeLine(myString.length); // In ArkTS, 'length' is a property of a string, not a method.
                /* FLAW: This check for null is redundant because 'myString' has already
                 * been safely dereferenced, implying it was not null at that point. */
                if (myString !== null) { // Using '!==' for strict inequality check.
                    myString = "my, how I've changed";
                }
                IO.writeLine(myString.length); // Still safe after reassignment.
            }
        }
    }

    /* good1() changes PRIVATE_STATIC_FINAL_TRUE to PRIVATE_STATIC_FINAL_FALSE */
    private good1(): void {
        if (CWE476_NULL_Pointer_Dereference__null_check_after_deref_04.PRIVATE_STATIC_FINAL_FALSE) {
            /* This code block is unreachable because the condition is always false,
             * leading to dead code. */
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null;
                myString = "Hello";

                IO.writeLine(myString.length);

                /* FIX: There is no need for a null check here, as execution would not
                 * reach this point if the object were null and a prior dereference failed. */
                myString = "my, how I've changed";

                IO.writeLine(myString.length);
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (CWE476_NULL_Pointer_Dereference__null_check_after_deref_04.PRIVATE_STATIC_FINAL_TRUE) {
            {
                let myString: string | null = null;
                myString = "Hello";
                IO.writeLine(myString.length);
                /* FIX: There is no need for a null check here, as execution would not
                 * reach this point if the object were null and a prior dereference failed. */
                myString = "my, how I've changed";
                IO.writeLine(myString.length);
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    /* This 'main' method is used for standalone testing or for building a binary
     * for analysis tools. It is not used when the test cases are compiled together
     * as a single application, which is typical for source code analysis tool testing.
     */
    public static main(args: string[]): void { // Removed 'throws' clauses as ArkTS does not use checked exceptions.
        AbstractTestCase.mainFromParent(args);
    }
}