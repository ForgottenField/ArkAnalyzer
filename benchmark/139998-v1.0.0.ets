/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_31.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-31.tmpl.java
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

export class CWE476_NULL_Pointer_Dereference__int_array_31 extends AbstractTestCase {

    public bad(): void {
        let dataCopy: number[] | null;
        {
            let data: number[] | null;

            /* POTENTIAL FLAW: data is null */
            data = null;

            dataCopy = data;
        }
        {
            let data: number[] | null = dataCopy;

            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS, accessing a property like 'length' on a null reference will result in a runtime error, similar to a NullPointerException in Java.
            IO.writeLine("" + data!.length); // Using '!' to explicitly allow dereferencing a potentially null value to replicate the bug.
        }
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let dataCopy: number[] | null;
        {
            let data: number[] | null;

            /* FIX: hardcode data to non-null */
            data = new Array<number>(5); // Initialize an array of 5 numbers.

            dataCopy = data;
        }
        {
            let data: number[] | null = dataCopy;

            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS, accessing a property like 'length' on a null reference will result in a runtime error, similar to a NullPointerException in Java.
            IO.writeLine("" + data!.length); // Using '!' to explicitly allow dereferencing a potentially null value to replicate the bug.
        }
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let dataCopy: number[] | null;
        {
            let data: number[] | null;

            /* POTENTIAL FLAW: data is null */
            data = null;

            dataCopy = data;
        }
        {
            let data: number[] | null = dataCopy;

            /* FIX: validate that data is non-null */
            if (data !== null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}