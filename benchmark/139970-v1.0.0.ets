/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__deref_after_check_09.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-09.tmpl.ts
*/
//
// @description
// CWE: 476 NULL Pointer Dereference
// Sinks: deref_after_check
// GoodSink: Do not dereference an object if it is null
// BadSink : Dereference after checking to see if an object is null
// Flow Variant: 09 Control flow: if(IO.STATIC_FINAL_TRUE) and if(IO.STATIC_FINAL_FALSE)
//

// Import specific dependencies from './testcasesupport'
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_09 extends AbstractTestCase {
    public bad(): void {
        if (IO.STATIC_FINAL_TRUE) {
            {
                // FLAW: Even after checking for null, the object is still dereferenced.
                let myString: string | null = null;
                if (myString == null) {
                    // In ArkTS, 'length' is a property, not a method for strings.
                    // Accessing 'length' on a null 'myString' will cause a runtime error.
                    IO.writeLine(myString.length);
                }
            }
        }
    }

    // good1() changes IO.STATIC_FINAL_TRUE to IO.STATIC_FINAL_FALSE
    private good1(): void {
        if (IO.STATIC_FINAL_FALSE) {
            // INCIDENTAL: Dead code; this block will never execute due to the condition.
            IO.writeLine("Benign, fixed string");
        } else {
            {
                // FIX: Check for null and avoid dereferencing the object if it is null.
                let myString: string | null = null;

                if (myString == null) {
                    IO.writeLine("The string is null");
                }
            }
        }
    }

    // good2() reverses the bodies in the if statement
    private good2(): void {
        if (IO.STATIC_FINAL_TRUE) {
            {
                // FIX: Check for null and avoid dereferencing the object if it is null.
                let myString: string | null = null;
                if (myString == null) {
                    IO.writeLine("The string is null");
                }
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    /*
     * This is the main method, used for building this test case for stand-alone testing or for generating a binary
     * for analysis tools. It is not used when compiling all test cases as a single application, which is the typical
     * approach for source code analysis tool testing.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}