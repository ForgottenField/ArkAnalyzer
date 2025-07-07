// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__binary_if_12.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
// Template File: point-flaw-12.tmpl.ts
//
// @description
// CWE: 476 NULL Pointer Dereference
// Sinks: binary_if
//    GoodSink: Do not check for null after the object has been dereferenced
//    BadSink : Check for null after an object has already been dereferenced
// Flow Variant: 12 Control flow: if(IO.staticReturnsTrueOrFalse())
//

import { IO, AbstractTestCase, AbstractTestCaseBase, mainFromParent } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_12 extends AbstractTestCase {

    public bad(): void {
        if (IO.staticReturnsTrueOrFalse()) {
            {
                let myString: string | null = null;
                // FLAW: Using a single '&' (bitwise AND) in the 'if' statement will cause both sides of the expression to be evaluated,
                // leading to a Null Pointer Dereference if 'myString' is null when 'myString.length' is accessed.
                if ((myString != null) & (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        } else {
            {
                let myString: string | null = null;
                // FIX: Use '&&' (logical AND) in the 'if' statement. This short-circuits,
                // meaning the right side will not be evaluated if the left side (myString != null) is false.
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good1() changes the "if" so that both branches use the GoodSink */
    private good1(): void {
        if (IO.staticReturnsTrueOrFalse()) {
            {
                let myString: string | null = null;
                // FIX: Use '&&' (logical AND) in the 'if' statement. This short-circuits,
                // meaning the right side will not be evaluated if the left side (myString != null) is false.
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        } else {
            {
                let myString: string | null = null;
                // FIX: Use '&&' (logical AND) in the 'if' statement. This short-circuits,
                // meaning the right side will not be evaluated if the left side (myString != null) is false.
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    public good(): void {
        this.good1();
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        mainFromParent(args);
    }
}
