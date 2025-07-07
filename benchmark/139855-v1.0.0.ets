/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_42.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-42.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 42 Data flow: data returned from one method to another in the same class
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_42 extends AbstractTestCase {

    private badSource(): number | null {
        let data: number | null;

        /* POTENTIAL FLAW: To replicate the original logic, this value is intentionally set to null. */
        data = null;

        return data;
    }

    public bad(): void {
        let data: number | null = this.badSource();

        /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null, replicating the original Java vulnerability. */
        IO.writeLine("" + data!.toString());

    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2BSource(): number | null {
        let data: number | null;

        /* FIX: 'data' is assigned a non-null value. */
        data = 5;

        return data;
    }

    private goodG2B(): void {
        let data: number | null = this.goodG2BSource();

        /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null, replicating the original Java vulnerability. */
        IO.writeLine("" + data!.toString());

    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2GSource(): number | null {
        let data: number | null;

        /* POTENTIAL FLAW: To replicate the original logic, this value is intentionally set to null. */
        data = null;

        return data;
    }

    private goodB2G(): void {
        let data: number | null = this.goodB2GSource();

        /* FIX: The 'data' value is validated to ensure it is not null before use. */
        if (data !== null)
        {
            IO.writeLine("" + data.toString());
        }
        else
        {
            IO.writeLine("data is null");
        }

    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void
    {
        AbstractTestCaseBase.mainFromParent(args);
    }
}
