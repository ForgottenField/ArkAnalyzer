/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__deref_after_check_08.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-08.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: deref_after_check
*    GoodSink: Do not dereference an object if it is null
*    BadSink : Dereference after checking to see if an object is null
* Flow Variant: 08 Control flow: if(privateReturnsTrue()) and if(privateReturnsFalse())
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

class CWE476_NULL_Pointer_Dereference__deref_after_check_08 extends AbstractTestCase {

    /* The methods below always return the same value.
     * Tools should be able to determine that every call to these methods
     * will consistently return true or false.
     */
    private privateReturnsTrue(): boolean {
        return true;
    }

    private privateReturnsFalse(): boolean {
        return false;
    }

    public bad(): void {
        if (this.privateReturnsTrue()) {
            {
                /* FLAW: This code checks for null, but then still attempts to dereference the object. */
                let myString: string | null = null;
                if (myString === null) {
                    // This will cause a runtime error because myString is null.
                    IO.writeLine(myString.length);
                }
            }
        }
    }

    /* good1() changes privateReturnsTrue() to privateReturnsFalse() */
    private good1(): void {
        if (this.privateReturnsFalse()) {
            /* INCIDENTAL: Dead Code - this block will never execute due to the preceding condition. */
            IO.writeLine("Benign, fixed string");
        } else {
            {
                /* FIX: This code checks for null and correctly avoids dereferencing the object if it is null. */
                let myString: string | null = null;

                if (myString === null) {
                    IO.writeLine("The string is null");
                }
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (this.privateReturnsTrue()) {
            {
                /* FIX: This code checks for null and correctly avoids dereferencing the object if it is null. */
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

    /* This is the main entry point for running this test case in isolation.
     * It is not typically used when compiling all test cases together for
     * static analysis tools.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
