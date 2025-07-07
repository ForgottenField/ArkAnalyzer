/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__deref_after_check_14.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-14.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: deref_after_check
*    GoodSink: Do not dereference an object if it is null
*    BadSink : Dereference after checking to see if an object is null
* Flow Variant: 14 Control flow: if(IO.staticFive==5) and if(IO.staticFive!=5)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_14 extends AbstractTestCase {

    bad(): void {
        if (IO.staticFive == 5) {
            {
                /* FLAW: Check for null, but still dereference the object */
                let myString: string | null = null;
                if (myString == null) {
                    // To replicate the original Java logic, we access the 'length' property
                    // of a potentially null string. The '!' operator asserts non-null
                    // at compile-time to allow this, leading to a runtime error when 'myString' is null.
                    IO.writeLine(myString!.length);
                }
            }
        }
    }

    /* good1() changes IO.staticFive==5 to IO.staticFive!=5 */
    private good1(): void {
        if (IO.staticFive != 5) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
        } else {
            {
                /* FIX: Check for null and do not dereference the object if it is null */
                let myString: string | null = null;

                if (myString == null) {
                    IO.writeLine("The string is null");
                }
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (IO.staticFive == 5) {
            {
                /* FIX: Check for null and do not dereference the object if it is null */
                let myString: string | null = null;
                if (myString == null) {
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
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
