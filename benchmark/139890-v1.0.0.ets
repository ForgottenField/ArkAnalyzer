/* Translated from Java:
 * Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_31.java
 * This file demonstrates a null pointer dereference vulnerability.
 * It uses a flow variant where data is copied within the same method.
 *
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 31 Data flow: make a copy of data within the same method
 *
 * */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_31 extends AbstractTestCase {

    public bad(): void {
        let dataCopy: string | null; // To replicate the original logic, this variable can hold a string or null.
        {
            let data: string | null;

            // POTENTIAL FLAW: 'data' is assigned null, replicating the bad source.
            data = null;

            dataCopy = data;
        }
        {
            let data: string | null = dataCopy; // 'data' now holds the null value from 'dataCopy'.

            // POTENTIAL FLAW: Attempting to access the 'length' property on a potentially null 'data' will cause a runtime error.
            // This replicates the original behavior of attempting to access a property on a potentially null object without a check.
            IO.writeLine("" + data!.length); // Using '!' to explicitly tell TypeScript to bypass null checks, replicating the original vulnerability.
        }
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - uses a good source (non-null) and a bad sink (no null check)
    private goodG2B(): void {
        let dataCopy: string | null;
        {
            let data: string | null;

            // FIX: 'data' is initialized to a non-null empty string, representing a valid StringBuilder state.
            data = ""; // Analogous to new StringBuilder() in terms of having a length.

            dataCopy = data;
        }
        {
            let data: string | null = dataCopy;

            // POTENTIAL FLAW: Accessing 'length' on 'data' without a null check.
            // In this specific 'good' scenario, 'data' is non-null, so no error occurs here.
            // However, the sink is still 'bad' because it lacks a proper null validation.
            IO.writeLine("" + data!.length); // Using '!' to replicate the original behavior of no null check.
        }
    }

    // goodB2G() - uses a bad source (null) and a good sink (with null check)
    private goodB2G(): void {
        let dataCopy: string | null;
        {
            let data: string | null;

            // POTENTIAL FLAW: 'data' is assigned null, replicating the bad source.
            data = null;

            dataCopy = data;
        }
        {
            let data: string | null = dataCopy;

            // FIX: Validates that 'data' is non-null before attempting to access its 'length' property.
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    // This is the main entry point, used for testing purposes.
    // It is not used when compiling all test cases as one application, which is how source code analysis tools are tested.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
