// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__binary_if_06.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
// Template File: point-flaw-06.tmpl.ts

// @description
// CWE: 476 NULL Pointer Dereference
// Sinks: binary_if
//    GoodSink: Do not check for null after the object has been dereferenced
//    BadSink : Check for null after an object has already been dereferenced
// Flow Variant: 06 Control flow: if(PRIVATE_STATIC_FINAL_FIVE==5) and if(PRIVATE_STATIC_FINAL_FIVE!=5)

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_06 extends AbstractTestCase {
    // This constant is used to control execution paths. Its value is fixed.
    private static readonly PRIVATE_STATIC_FINAL_FIVE: number = 5;

    public bad(): void {
        if (CWE476_NULL_Pointer_Dereference__binary_if_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            {
                let myString: string | null = null;
                // FLAW: Using a bitwise AND (&) on boolean expressions will cause both sides of the expression to be evaluated,
                // potentially leading to a null pointer dereference if the left side is false but the right side attempts to dereference null.
                // In ArkTS (TypeScript/JavaScript), accessing properties of 'null' will throw a TypeError.
                if ((myString !== null) & (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    // good1() changes PRIVATE_STATIC_FINAL_FIVE==5 to PRIVATE_STATIC_FINAL_FIVE!=5
    private good1(): void {
        if (CWE476_NULL_Pointer_Dereference__binary_if_06.PRIVATE_STATIC_FINAL_FIVE !== 5) {
            // This code path is unreachable due to the constant condition.
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null;

                // FIX: Use logical AND (&&) in the if statement. If the left side of the expression is false,
                // the right side will not be evaluated, preventing a null pointer dereference.
                if ((myString !== null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    // good2() reverses the bodies in the if statement
    private good2(): void {
        if (CWE476_NULL_Pointer_Dereference__binary_if_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            {
                let myString: string | null = null;
                // FIX: Use logical AND (&&) in the if statement. If the left side of the expression is false,
                // the right side will not be evaluated, preventing a null pointer dereference.
                if ((myString !== null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    // The main method is for standalone execution and testing purposes. It is not typically
    // used when compiling all test cases as a single application.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}