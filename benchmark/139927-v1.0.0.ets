/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_31.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-31.tmpl.ts
*/
/*
 * @description
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

export class CWE476_NULL_Pointer_Dereference__String_31 extends AbstractTestCase {

    bad(): void {
        let dataCopy: string | null;
        {
            let data: string | null;

            // To replicate the original logic, this value is intentionally set to null.
            data = null;

            dataCopy = data;
        }
        {
            let data: string | null = dataCopy;

            // POTENTIAL FLAW: A runtime error will occur if 'data' is null, as its 'length' property is accessed.
            // We use the non-null assertion operator '!' to replicate the original Java behavior
            // where a NullPointerException would occur.
            IO.writeLine("" + data!.length);
        }
    }

    good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let dataCopy: string | null;
        {
            let data: string | null;

            // FIX: Assign a non-null string value to 'data'.
            data = "This is not null";

            dataCopy = data;
        }
        {
            let data: string | null = dataCopy;

            // POTENTIAL FLAW: A runtime error will occur if 'data' is null, as its 'length' property is accessed.
            // We use the non-null assertion operator '!' to replicate the original Java behavior
            // where a NullPointerException would occur.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let dataCopy: string | null;
        {
            let data: string | null;

            // To replicate the original logic, this value is intentionally set to null.
            data = null;

            dataCopy = data;
        }
        {
            let data: string | null = dataCopy;

            // FIX: Validate that 'data' is not null before accessing its properties or methods.
            if (data != null)
            {
                IO.writeLine("" + data.length);
            }
            else
            {
                IO.writeLine("data is null");
            }
        }
    }

    /* Below is the main() method. It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
