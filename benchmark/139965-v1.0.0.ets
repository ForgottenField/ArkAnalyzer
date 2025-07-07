/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__deref_after_check_04.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-04.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: deref_after_check
*    GoodSink: Do not dereference an object if it is null
*    BadSink : Dereference after checking to see if an object is null
* Flow Variant: 04 Control flow: if(PRIVATE_STATIC_FINAL_TRUE) and if(PRIVATE_STATIC_FINAL_FALSE)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_04 extends AbstractTestCase {
    /* These two variables are declared 'readonly' and 'static', indicating that their values are constant and accessible globally within the class. A static analysis tool should recognize that reads of these variables will always return their initialized values. */
    private static readonly PRIVATE_STATIC_FINAL_TRUE: boolean = true;
    private static readonly PRIVATE_STATIC_FINAL_FALSE: boolean = false;

    public bad(): void {
        if (CWE476_NULL_Pointer_Dereference__deref_after_check_04.PRIVATE_STATIC_FINAL_TRUE) {
            {
                /* FLAW: Check for null, but still dereference the object */
                // To replicate the original logic, we declare 'myString' as potentially null.
                // The non-null assertion '!' is used to allow the dereference, which will cause a runtime error if 'myString' is null.
                let myString: string | null = null;
                if (myString == null) {
                    IO.writeLine(myString!.length);
                }
            }
        }
    }

    /* good1() changes PRIVATE_STATIC_FINAL_TRUE to PRIVATE_STATIC_FINAL_FALSE */
    private good1(): void {
        if (CWE476_NULL_Pointer_Dereference__deref_after_check_04.PRIVATE_STATIC_FINAL_FALSE) {
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
        if (CWE476_NULL_Pointer_Dereference__deref_after_check_04.PRIVATE_STATIC_FINAL_TRUE) {
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
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}