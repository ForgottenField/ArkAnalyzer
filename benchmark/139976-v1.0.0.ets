/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__deref_after_check_15.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-15.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: deref_after_check
*    GoodSink: Do not dereference an object if it is null
*    BadSink : Dereference after checking to see if an object is null
* Flow Variant: 15 Control flow: switch(7)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_15 extends AbstractTestCase {
    public bad(): void {
        switch (7) {
            case 7: {
                /* FLAW: Check for null, but still dereference the object */
                let myString: string | null = null;
                if (myString == null) {
                    // To replicate the original logic, we access the 'length' property directly,
                    // which is the equivalent of Java's 'length()' method for strings in ArkTS.
                    // The '!' operator asserts non-null to satisfy TypeScript,
                    // but at runtime, this will still cause an error as 'myString' is null.
                    IO.writeLine(myString!.length);
                }
            }
            break;
            default:
                /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
                IO.writeLine("Benign, fixed string");
                break;
        }
    }

    /* good1() change the switch to switch(8) */
    private good1(): void {
        switch (8) {
            case 7:
                /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
                IO.writeLine("Benign, fixed string");
                break;
            default: {
                /* FIX: Check for null and do not dereference the object if it is null */
                let myString: string | null = null;
                if (myString == null) {
                    IO.writeLine("The string is null");
                }
            }
            break;
        }
    }

    /* good2() reverses the blocks in the switch  */
    private good2(): void {
        switch (7) {
            case 7: {
                /* FIX: Check for null and do not dereference the object if it is null */
                let myString: string | null = null;
                if (myString == null) {
                    IO.writeLine("The string is null");
                }
            }
            break;
            default:
                /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
                IO.writeLine("Benign, fixed string");
                break;
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
    public static main(...args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}