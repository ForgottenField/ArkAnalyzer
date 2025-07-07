// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_08.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
// Template File: point-flaw-08.tmpl.ts
//
// @description
// CWE: 476 NULL Pointer Dereference
// Sinks: null_check_after_deref
//    GoodSink: Do not check for null after the object has been dereferenced
//    BadSink : Check for null after the object has already been dereferenced
// Flow Variant: 08 Control flow: if(privateReturnsTrue()) and if(privateReturnsFalse())
//

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_08 extends AbstractTestCase {
    // These methods consistently return the same boolean value, allowing static analysis tools to predict their outcomes.
    private privateReturnsTrue(): boolean {
        return true;
    }

    private privateReturnsFalse(): boolean {
        return false;
    }

    public bad(): void {
        if (this.privateReturnsTrue()) {
            {
                let myString: string | null = null;
                myString = "Hello";
                IO.writeLine(myString.length);
                // FLAW: A null check is performed after the object has already been accessed, making the check redundant and misplaced.
                if (myString != null) {
                    myString = "my, how I've changed";
                }
                IO.writeLine(myString.length);
            }
        }
    }

    // good1() changes privateReturnsTrue() to privateReturnsFalse()
    private good1(): void {
        if (this.privateReturnsFalse()) {
            // INCIDENTAL: This code is unreachable due to the preceding condition, classifying it as dead code.
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null;
                myString = "Hello";

                IO.writeLine(myString.length);

                // FIX: A null check is omitted here because the execution flow guarantees the object is not null at this point.
                myString = "my, how I've changed";

                IO.writeLine(myString.length);
            }
        }
    }

    // good2() reverses the bodies in the if statement
    private good2(): void {
        if (this.privateReturnsTrue()) {
            {
                let myString: string | null = null;
                myString = "Hello";
                IO.writeLine(myString.length);
                // FIX: A null check is omitted here because the execution flow guarantees the object is not null at this point.
                myString = "my, how I've changed";
                IO.writeLine(myString.length);
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    // This 'main' method is provided for standalone testing and binary analysis purposes. It is not utilized when compiling the entire test suite as a single application.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
