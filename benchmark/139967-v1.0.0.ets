/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__deref_after_check_06.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-06.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: deref_after_check
*    GoodSink: Do not dereference an object if it is null
*    BadSink : Dereference after checking to see if an object is null
* Flow Variant: 06 Control flow: if(PRIVATE_STATIC_FINAL_FIVE==5) and if(PRIVATE_STATIC_FINAL_FIVE!=5)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_06 extends AbstractTestCase {
    /* This variable is declared with 'readonly', which in ArkTS/TypeScript ensures it can only be assigned once and its value remains constant. */
    private static readonly PRIVATE_STATIC_FINAL_FIVE: number = 5;

    public bad(): void {
        if (CWE476_NULL_Pointer_Dereference__deref_after_check_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            {
                /* FLAW: Check for null, but still dereference the object */
                let myString: string | null = null;
                if (myString === null) {
                    // In ArkTS/TypeScript, 'length' is a property, but accessing it on a 'null' object still results in a runtime error, replicating the Java method call dereference.
                    // The '!' non-null assertion is used to bypass compile-time null checks and replicate the original flaw.
                    IO.writeLine(myString!.length);
                }
            }
        }
    }

    /* good1() changes PRIVATE_STATIC_FINAL_FIVE==5 to PRIVATE_STATIC_FINAL_FIVE!=5 */
    private good1(): void {
        if (CWE476_NULL_Pointer_Dereference__deref_after_check_06.PRIVATE_STATIC_FINAL_FIVE !== 5) {
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
        if (CWE476_NULL_Pointer_Dereference__deref_after_check_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
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

    /* Below is the main entry point for this test case. It is used when building this test case
     * on its own for testing or for building a binary to use in testing binary analysis tools.
     * It is not used when compiling all the test cases as one application, which is how source
     * code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}