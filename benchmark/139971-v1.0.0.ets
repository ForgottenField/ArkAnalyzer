/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__deref_after_check_10.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-10.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: deref_after_check
* GoodSink: Do not dereference an object if it is null
* BadSink : Dereference after checking to see if an object is null
* Flow Variant: 10 Control flow: if(IO.staticTrue) and if(IO.staticFalse)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_10 extends AbstractTestCase {
    public bad(): void {
        if (IO.staticTrue) {
            {
                /* FLAW: Check for null, but still dereference the object */
                let myString: string | null = null;
                if (myString === null) {
                    // To replicate the original logic, accessing 'length' on a 'null' string
                    // will still cause a runtime error in ArkTS, mirroring the Java NullPointerException.
                    // Note: In ArkTS/TypeScript, `length` is a property for strings, not a method.
                    IO.writeLine(myString.length);
                }
            }
        }
    }

    /* good1() changes IO.staticTrue to IO.staticFalse */
    private good1(): void {
        if (IO.staticFalse) {
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
        if (IO.staticTrue) {
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

    /* Below is the main() function. It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}