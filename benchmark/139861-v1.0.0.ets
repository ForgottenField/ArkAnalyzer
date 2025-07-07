// CWE476_NULL_Pointer_Dereference__Integer_61a.ts

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 61 Data flow: data returned from one method to another in different classes in the same package
 *
 * */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_61a extends AbstractTestCase {

    public bad(): void {
        // To replicate the original logic, 'data' is obtained from a source that could return null.
        let data: number | null = (new CWE476_NULL_Pointer_Dereference__Integer_61b()).badSource();

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // Calling 'toString()' on a potentially null 'data' will cause a runtime error.
        IO.writeLine("" + data.toString());
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        // To replicate the original logic, 'data' is obtained from a source that returns a non-null value.
        let data: number | null = (new CWE476_NULL_Pointer_Dereference__Integer_61b()).goodG2BSource();

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // Calling 'toString()' on a potentially null 'data' will cause a runtime error.
        IO.writeLine("" + data.toString());
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        // To replicate the original logic, 'data' is obtained from a source that could return null.
        let data: number | null = (new CWE476_NULL_Pointer_Dereference__Integer_61b()).goodB2GSource();

        /* FIX: validate that data is non-null */
        // A null check prevents the dereference error.
        if (data != null) {
            IO.writeLine("" + data.toString());
        } else {
            IO.writeLine("data is null");
        }
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    // This 'main' method is for running this specific test case in isolation,
    // useful for testing or binary analysis. It is not typically part of a larger application build.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}

// CWE476_NULL_Pointer_Dereference__Integer_61b.ts

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 61 Data flow: data returned from one method to another in different classes in the same package
 *
 * */


export class CWE476_NULL_Pointer_Dereference__Integer_61b {

    public badSource(): number | null {
        let data: number | null;

        /* POTENTIAL FLAW: data is null */
        // This explicitly sets 'data' to null to simulate a problematic source.
        data = null;

        return data;
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSource(): number | null {
        let data: number | null;

        /* FIX: hardcode data to non-null */
        // This assigns a non-null value to 'data', replicating the behavior of Integer.valueOf(5).
        data = 5;

        return data;
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSource(): number | null {
        let data: number | null;

        /* POTENTIAL FLAW: data is null */
        // This explicitly sets 'data' to null to simulate a problematic source.
        data = null;

        return data;
    }
}