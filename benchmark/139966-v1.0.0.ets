import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_05 extends AbstractTestCase {
    // These properties are initialized once and not reassigned, allowing tools to recognize their constant values. This ensures that reads of these properties will always return their initialized values.
    private privateTrue: boolean = true;
    private privateFalse: boolean = false;

    public bad(): void {
        if (this.privateTrue) {
            {
                // FLAW: Check for null, but still dereference the object
                let myString: string | null = null;
                if (myString == null) {
                    // To replicate the original Java NullPointerException, myString is null, but we use the non-null assertion operator (!) to force access to its length, which will cause a runtime error.
                    IO.writeLine(myString!.length);
                }
            }
        }
    }

    /* good1() changes privateTrue to privateFalse */
    private good1(): void {
        if (this.privateFalse) {
            // INCIDENTAL: CWE 561 Dead Code, the code below will never run
            IO.writeLine("Benign, fixed string");
        } else {
            {
                // FIX: Check for null and do not dereference the object if it is null
                let myString: string | null = null;

                if (myString == null) {
                    IO.writeLine("The string is null");
                }
            }
        }
    }

    /* good2() reverses the bodies in the if statement */
    private good2(): void {
        if (this.privateTrue) {
            {
                // FIX: Check for null and do not dereference the object if it is null
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

    // This section serves as the entry point when running this test case in isolation, useful for testing or for generating a binary for analysis tools. It is typically not utilized when compiling multiple test cases as a single application, which is the standard approach for source code analysis tool testing.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}