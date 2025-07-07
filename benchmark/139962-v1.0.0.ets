/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__deref_after_check_01.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-01.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: deref_after_check
*    GoodSink: Do not dereference an object if it is null
*    BadSink : Dereference after checking to see if an object is null
* Flow Variant: 01 Baseline
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_01 extends AbstractTestCase {

    bad(): void {
        {
            /* FLAW: The code checks for null, but then attempts to dereference the object anyway. */
            let myString: string | null = null;

            if (myString === null) {
                IO.writeLine(myString.length); // This line will cause a runtime error
            }
        }
    }

    good(): void {
        this.good1();
    }

    private good1(): void {
        {
            /* FIX: The code correctly checks for null and avoids dereferencing the object if it is null. */
            let myString: string | null = null;

            if (myString === null) {
                IO.writeLine("The string is null");
            }
        }
    }

    /* This main method is for standalone execution of the test case, typically for testing binary analysis tools. */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}