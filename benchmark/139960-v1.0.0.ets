/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__binary_if_16.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-16.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: binary_if
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after an object has already been dereferenced
* Flow Variant: 16 Control flow: while(true)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_16 extends AbstractTestCase {

    bad(): void {
        while(true) {
            {
                let myString: string | null = null;
                /* FLAW: Using a single '&' (bitwise AND) in the 'if' statement will cause both sides of the expression to be evaluated,
                 * leading to a potential Null Pointer Dereference when attempting to access 'myString.length' on a null value. */
                if ((myString != null) & (myString.length > 0)) { 
                    IO.writeLine("The string length is greater than 0");
                }
            }
            break;
        }
    }

    /* good1() adapts the conditions within the while loop */
    private good1(): void {
        while(true) {
            {
                let myString: string | null = null;
                /* FIX: Use '&&' (logical AND) in the 'if' statement so that if the left side of the expression evaluates to false (e.g., 'myString' is null),
                 * the right side ('myString.length > 0') will not be evaluated, preventing a Null Pointer Dereference. */
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
            break;
        }
    }

    public good(): void {
        this.good1();
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCaseBase.mainFromParent(args);
    }
}