// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_15.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
// Template File: point-flaw-15.tmpl.java

/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: null_check_after_deref
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after the object has already been dereferenced
* Flow Variant: 15 Control flow: switch(7)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_15 extends AbstractTestCase {

    bad(): void {
        switch (7) {
        case 7:
        {
            let myString: string | null = null;
            myString = "Hello";
            IO.writeLine(myString.length);
            // FLAW: This check for null is redundant as the value has already been used.
            if (myString != null) {
                myString = "my, how I've changed";
            }
            IO.writeLine(myString.length);
        }
        break;
        default:
            // INCIDENTAL: This code is unreachable and will never execute.
            IO.writeLine("Benign, fixed string");
            break;
        }
    }

    // good1() changes the switch to switch(8)
    private good1(): void {
        switch (8) {
        case 7:
            // INCIDENTAL: This code is unreachable and will never execute.
            IO.writeLine("Benign, fixed string");
            break;
        default:
        {
            let myString: string | null = null;
            myString = "Hello";
            IO.writeLine(myString.length);
            // FIX: No null check is needed here, as the object would not be null at this point.
            myString = "my, how I've changed";
            IO.writeLine(myString.length);
        }
        break;
        }
    }

    // good2() reverses the blocks in the switch
    private good2(): void {
        switch (7) {
        case 7:
        {
            let myString: string | null = null;
            myString = "Hello";
            IO.writeLine(myString.length);
            // FIX: No null check is needed here, as the object would not be null at this point.
            myString = "my, how I've changed";
            IO.writeLine(myString.length);
        }
        break;
        default:
            // INCIDENTAL: This code is unreachable and will never execute.
            IO.writeLine("Benign, fixed string");
            break;
        }
    }

    good(): void {
        this.good1();
        this.good2();
    }

    // This is the main function. It is only used when building this testcase on
    // its own for testing or for building a binary to use in testing binary
    // analysis tools. It is not used when compiling all the testcases as one
    // application, which is how source code analysis tools are tested.
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
