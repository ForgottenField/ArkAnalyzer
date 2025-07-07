/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__deref_after_check_07.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-07.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: deref_after_check
*    GoodSink: Do not dereference an object if it is null
*    BadSink : Dereference after checking to see if an object is null
* Flow Variant: 07 Control flow: if(privateFive==5) and if(privateFive!=5)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_07 extends AbstractTestCase {

    // This variable is initialized once and its value does not change, making its reads predictable for static analysis.
    private privateFive: number = 5;

    public bad(): void {
        if (this.privateFive === 5) {
            {
                /* FLAW: Check for null, but still dereference the object */
                let myString: string | null = null;
                if (myString === null) {
                    // This line replicates the original Java bug.
                    // Attempting to access 'length' on a 'null' object will cause a runtime error.
                    IO.writeLine(myString.length);
                }
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
                /* FIX: Check for null and do not dereference the object if it is null */
                let myString: string | null = null;

                if (myString === null) {
                    IO.writeLine("The string is null");
                }
            }

        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (this.privateFive === 5) {
            {
                /* FIX: Check for null and do not dereference the object if it is null */
                let myString: string | null = null;
                if (myString === null) {
                    IO.writeLine("The string is null");
                }
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
