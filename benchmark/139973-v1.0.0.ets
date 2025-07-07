/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__deref_after_check_12.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-12.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: deref_after_check
*    GoodSink: Do not dereference an object if it is null
*    BadSink : Dereference after checking to see if an object is null
* Flow Variant: 12 Control flow: if(IO.staticReturnsTrueOrFalse())
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_12 extends AbstractTestCase {

    bad(): void {
        if (IO.staticReturnsTrueOrFalse()) {
            {
                /* FLAW: Check for null, but still dereference the object */
                let myString: string | null = null; // Declare myString and explicitly allow it to be null in ArkTS/TypeScript
                if (myString == null) {
                    // Attempting to access the 'length' property on a null string
                    // will cause a runtime TypeError in ArkTS/TypeScript, replicating the original Java flaw.
                    IO.writeLine(myString.length); 
                }
            }
        } else {
            {
                /* FIX: Check for null and do not dereference the object if it is null */
                let myString: string | null = null; // Declare myString and explicitly allow it to be null in ArkTS/TypeScript

                if (myString == null) {
                    IO.writeLine("The string is null");
                }
            }
        }
    }

    /* good1() changes the "if" so that both branches use the GoodSink */
    private good1(): void {
        if (IO.staticReturnsTrueOrFalse()) {
            {
                /* FIX: Check for null and do not dereference the object if it is null */
                let myString: string | null = null; // Declare myString and explicitly allow it to be null in ArkTS/TypeScript
                if (myString == null) {
                    IO.writeLine("The string is null");
                }
            }
        } else {
            {
                /* FIX: Check for null and do not dereference the object if it is null */
                let myString: string | null = null; // Declare myString and explicitly allow it to be null in ArkTS/TypeScript

                if (myString == null) {
                    IO.writeLine("The string is null");
                }
            }
        }
    }

    public good(): void {
        this.good1();
    }

    /* Below is the main() method. It is typically used when building this testcase
     * for independent execution or for analysis by security tools. It is not used
     * when compiling all testcases together as a single application, which is the
     * common approach for testing source code analysis tools.
     */
    public static main(args: string[]): void {
        // In ArkTS/TypeScript, similar to Java, we might call a utility method
        // to handle the setup for test case execution.
        // Assuming mainFromParent exists and handles arguments for test execution within AbstractTestCase.
        AbstractTestCase.mainFromParent(args);
    }
}