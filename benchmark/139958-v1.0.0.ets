/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__binary_if_14.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-14.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: binary_if
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after an object has already been dereferenced
* Flow Variant: 14 Control flow: if(IO.staticFive==5) and if(IO.staticFive!=5)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_14 extends AbstractTestCase {

    public bad(): void {
        if (IO.staticFive == 5) {
            {
                let myString: string | null = null;
                /* FLAW: To replicate the original logic, using the bitwise AND operator (`&`) ensures both sides of the expression are evaluated, even if the left side is false. This leads to a null pointer dereference when attempting to access the 'length' property of a null string. In ArkTS (TypeScript/JavaScript), `&` is the bitwise AND operator and does not short-circuit, behaving identically to the Java flaw. */
                if ((myString != null) & (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
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
                let myString: string | null = null;

                /* FIX: Using the logical AND operator (`&&`) ensures short-circuit evaluation. If the left side of the expression is false, the right side will not be evaluated, preventing the null dereference when accessing the 'length' property. */
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (IO.staticFive == 5) {
            {
                let myString: string | null = null;
                /* FIX: Using the logical AND operator (`&&`) ensures short-circuit evaluation. If the left side of the expression is false, the right side will not be evaluated, preventing the null dereference when accessing the 'length' property. */
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
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
        // Assuming mainFromParent is a static method provided by testcasesupport or AbstractTestCaseBase.
        // This simulates the original Java call without requiring its source.
        AbstractTestCaseBase.mainFromParent(args);
    }
}