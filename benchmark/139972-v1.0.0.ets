/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__deref_after_check_11.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-11.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: deref_after_check
*    GoodSink: Does not dereference an object if it is null
*    BadSink : Dereferences after checking to see if an object is null
* Flow Variant: 11 Control flow: if(IO.staticReturnsTrue()) and if(IO.staticReturnsFalse())
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_11 extends AbstractTestCase {
    public bad(): void {
        if (IO.staticReturnsTrue()) {
            // FLAW: Checks for null, but still dereferences the object.
            // This replicates the original Java bug where a null value is used after a null check.
            let myString: string | null = null;
            if (myString == null) {
                // Attempting to access 'length' on a null 'myString' will cause a runtime error.
                IO.writeLine(myString.length);
            }
        }
    }

    /* good1() changes IO.staticReturnsTrue() to IO.staticReturnsFalse() */
    private good1(): void {
        if (IO.staticReturnsFalse()) {
            // This code path will not be executed due to the conditional check.
            IO.writeLine("Benign, fixed string");
        } else {
            // FIX: Checks for null and does not dereference the object if it is null.
            let myString: string | null = null;
            if (myString == null) {
                IO.writeLine("The string is null");
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (IO.staticReturnsTrue()) {
            // FIX: Checks for null and does not dereference the object if it is null.
            let myString: string | null = null;
            if (myString == null) {
                IO.writeLine("The string is null");
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    /*
     * This is the main entry point for the test case when built individually.
     * It is not used when compiling all test cases as a single application,
     * which is how source code analysis tools typically test.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}