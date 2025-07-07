/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__binary_if_04.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-04.tmpl.ts
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: binary_if
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after an object has already been dereferenced
* Flow Variant: 04 Control flow: if(PRIVATE_STATIC_FINAL_TRUE) and if(PRIVATE_STATIC_FINAL_FALSE)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_04 extends AbstractTestCase {
    /* The two variables below are declared "static readonly", indicating they are constant and their values will not change after initialization. */
    private static readonly PRIVATE_STATIC_FINAL_TRUE: boolean = true;
    private static readonly PRIVATE_STATIC_FINAL_FALSE: boolean = false;

    public bad(): void {
        if (CWE476_NULL_Pointer_Dereference__binary_if_04.PRIVATE_STATIC_FINAL_TRUE) {
            {
                let myString: string | null = null;
                /* FLAW: In ArkTS/TypeScript, using a single '&' (bitwise AND) in the 'if' statement will cause both sides of the expression to be evaluated, thus leading to a Null Pointer Dereference if 'myString' is null. */
                if ((myString != null) & (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good1() changes PRIVATE_STATIC_FINAL_TRUE to PRIVATE_STATIC_FINAL_FALSE */
    private good1(): void {
        if (CWE476_NULL_Pointer_Dereference__binary_if_04.PRIVATE_STATIC_FINAL_FALSE) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
        } else {
            {
                let myString: string | null = null;

                /* FIX: In ArkTS/TypeScript, using '&&' (logical AND) in the 'if' statement ensures short-circuit evaluation. If the left side of the expression is false, the right side will not be evaluated, preventing a Null Pointer Dereference. */
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (CWE476_NULL_Pointer_Dereference__binary_if_04.PRIVATE_STATIC_FINAL_TRUE) {
            {
                let myString: string | null = null;
                /* FIX: In ArkTS/TypeScript, using '&&' (logical AND) in the 'if' statement ensures short-circuit evaluation. If the left side of the expression is false, the right side will not be evaluated, preventing a Null Pointer Dereference. */
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

    /* Below is the 'main' method. It is used for testing this specific test case in isolation. */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}