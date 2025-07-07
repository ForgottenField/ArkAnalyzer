// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__binary_if_13.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
// Template File: point-flaw-13.tmpl.java

// @description
// CWE: 476 NULL Pointer Dereference
// Sinks: binary_if
//    GoodSink: Do not check for null after the object has been dereferenced
//    BadSink : Check for null after an object has already been dereferenced
// Flow Variant: 13 Control flow: if(IO.STATIC_FINAL_FIVE==5) and if(IO.STATIC_FINAL_FIVE!=5)

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_13 extends AbstractTestCase {
    public bad(): void {
        if (IO.STATIC_FINAL_FIVE == 5) {
            {
                let myString: string | null = null;
                // FLAW: Using a single & in the if statement will cause both sides of the expression to be evaluated, thus causing a Null Pointer Dereference.
                // In ArkTS, the bitwise '&' operator will still cause both operands to be evaluated before the bitwise operation,
                // leading to the same null pointer issue on 'myString.length'.
                if ((myString != null) & (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    // good1() changes IO.STATIC_FINAL_FIVE==5 to IO.STATIC_FINAL_FIVE!=5
    private good1(): void {
        if (IO.STATIC_FINAL_FIVE != 5) {
            // INCIDENTAL: CWE 561 Dead Code, the code below will never run
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null;

                // FIX: Use && (logical AND) in the if statement so that if the left side of the expression evaluates to false (e.g., a null check fails),
                // the right side will not be evaluated, preventing a Null Pointer Dereference.
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    // good2() reverses the bodies in the if statement
    private good2(): void {
        if (IO.STATIC_FINAL_FIVE == 5) {
            {
                let myString: string | null = null;
                // FIX: Use && (logical AND) in the if statement so that if the left side of the expression evaluates to false (e.g., a null check fails),
                // the right side will not be evaluated, preventing a Null Pointer Dereference.
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    // Below is the main(). It is only used when building this testcase on
    // its own for testing or for building a binary to use in testing binary
    // analysis tools. It is not used when compiling all the testcases as one
    // application, which is how source code analysis tools are tested.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}