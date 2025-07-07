// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_11.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
// Template File: point-flaw-11.tmpl.java

// @description
// CWE: 476 NULL Pointer Dereference
// Sinks: null_check_after_deref
//    GoodSink: Do not check for null after the object has been dereferenced
//    BadSink : Check for null after the object has already been dereferenced
// Flow Variant: 11 Control flow: if(IO.staticReturnsTrue()) and if(IO.staticReturnsFalse())

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_11 extends AbstractTestCase {

    public bad(): void {
        if (IO.staticReturnsTrue()) {
            {
                let myString: string | null = null;
                myString = "Hello";
                // Accessing the 'length' property of the string.
                IO.writeLine(myString.length);
                // FLAW: This code checks for null after the object has already been used (dereferenced),
                // making the null check redundant and potentially misleading.
                if (myString != null) {
                    myString = "my, how I've changed";
                }
                // Accessing the 'length' property of the string.
                IO.writeLine(myString.length);
            }
        }
    }

    /* good1() changes IO.staticReturnsTrue() to IO.staticReturnsFalse() */
    private good1(): void {
        if (IO.staticReturnsFalse()) {
            // INCIDENTAL: This is dead code; the statements below will never execute due to the preceding condition.
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null;
                myString = "Hello";

                // Accessing the 'length' property of the string.
                IO.writeLine(myString.length);

                // FIX: This code does not perform an unnecessary null check,
                // as the object is guaranteed to be non-null at this point.
                myString = "my, how I've changed";

                // Accessing the 'length' property of the string.
                IO.writeLine(myString.length);
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (IO.staticReturnsTrue()) {
            {
                let myString: string | null = null;
                myString = "Hello";
                // Accessing the 'length' property of the string.
                IO.writeLine(myString.length);
                // FIX: This code does not perform an unnecessary null check,
                // as the object is guaranteed to be non-null at this point.
                myString = "my, how I've changed";
                // Accessing the 'length' property of the string.
                IO.writeLine(myString.length);
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    // This 'main' method is for standalone testing or binary analysis tool usage.
    // It is not invoked when compiling all test cases together for source code analysis.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
