// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__binary_if_15.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
// Template File: point-flaw-15.tmpl.ts

// @description
// CWE: 476 NULL Pointer Dereference
// Sinks: binary_if
//    GoodSink: Do not check for null after the object has been dereferenced
//    BadSink : Check for null after an object has already been dereferenced
// Flow Variant: 15 Control flow: switch(7)

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_15 extends AbstractTestCase {

    public bad(): void {
        switch (7) {
            case 7: {
                let myString: string | null = null;
                // FLAW: Using a single '&' (bitwise AND) in the 'if' statement, rather than '&&' (logical AND), forces both sides of the expression to be evaluated, leading to a Null Pointer Dereference.
                if ((myString != null) & (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
            break;
            default:
                // INCIDENTAL: CWE 561 Dead Code. The code below will never run due to the 'switch' statement's logic.
                IO.writeLine("Benign, fixed string");
                break;
        }
    }

    // good1(): Changes the 'switch' condition to '8'.
    private good1(): void {
        switch (8) {
            case 7:
                // INCIDENTAL: CWE 561 Dead Code. The code below will never run due to the 'switch' statement's logic.
                IO.writeLine("Benign, fixed string");
                break;
            default: {
                let myString: string | null = null;
                // FIX: Use '&&' (logical AND) in the 'if' statement. If the left side of the expression is false, the right side will not be evaluated, preventing the Null Pointer Dereference.
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
            break;
        }
    }

    // good2(): Reverses the blocks within the 'switch' statement.
    private good2(): void {
        switch (7) {
            case 7: {
                let myString: string | null = null;
                // FIX: Use '&&' (logical AND) in the 'if' statement. If the left side of the expression is false, the right side will not be evaluated, preventing the Null Pointer Dereference.
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
            break;
            default:
                // INCIDENTAL: CWE 561 Dead Code. The code below will never run due to the 'switch' statement's logic.
                IO.writeLine("Benign, fixed string");
                break;
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    // The 'main' method. It is typically used for standalone testing or for building a binary for analysis tools. It is not generally used when compiling all test cases as a single application.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}