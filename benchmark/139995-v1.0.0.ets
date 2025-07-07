import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_17.java (original Java filename for context)
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-17.tmpl.java

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Sets a variable to null.
 * GoodSource: Sets a variable to a non-null value.
 * Sinks:
 *    GoodSink: Adds a check to prevent the possibility of a null dereference.
 *    BadSink : Allows for the possibility of a null dereference.
 * Flow Variant: 17 Control flow: for loops
 *
 */

export class CWE476_NULL_Pointer_Dereference__int_array_17 extends AbstractTestCase {

    public bad(): void {
        let data: number[] | null;

        // To ensure the variable is properly initialized for its first use,
        // we assign it outside the loop.
        // POTENTIAL FLAW: data is null
        data = null;

        for (let j: number = 0; j < 1; j++) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
            // We use the non-null assertion operator (!) to replicate the original Java runtime error.
            IO.writeLine("" + data!.length);
        }
    }

    // goodG2B() - uses a good source and a bad sink
    private goodG2B(): void {
        let data: number[] | null;

        // FIX: Initializes 'data' with a non-null array.
        data = new Array<number>(5);

        for (let j: number = 0; j < 1; j++) {
            // POTENTIAL FLAW: A null dereference would occur here if 'data' were null.
            // In this specific case, 'data' is not null, so the access is safe.
            IO.writeLine("" + data!.length);
        }
    }

    // goodB2G() - uses a bad source and a good sink
    private goodB2G(): void {
        let data: number[] | null;

        // POTENTIAL FLAW: data is null
        data = null;

        for (let k: number = 0; k < 1; k++) {
            // FIX: Validates that 'data' is not null before attempting to access its 'length'.
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* Below is the main() method. It is only used when building this test case independently
     * for testing or for creating a binary to use in testing binary analysis tools.
     * It is not utilized when compiling all test cases as a single application,
     * which is the typical approach for testing source code analysis tools.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}