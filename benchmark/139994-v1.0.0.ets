/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_16.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-16.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 16 Control flow: while(true)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_16 extends AbstractTestCase {

    public bad(): void {
        let data: number[] | null; // Declare data as an array of numbers that can also be null

        while (true) {
            /* POTENTIAL FLAW: data is null */
            data = null;
            break;
        }

        while (true) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // Accessing 'length' on a potentially null 'data' will cause a runtime error.
            // The non-null assertion '!' is used here to replicate the original Java behavior
            // where a NullPointerException would occur.
            IO.writeLine("" + data!.length);
            break;
        }
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: number[] | null;

        while (true) {
            /* FIX: hardcode data to non-null */
            data = new Array<number>(5); // Initialize with a non-null array of 5 elements
            break;
        }

        while (true) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // Although data is explicitly set to non-null in the good source,
            // this sink's logic still represents a potential flaw if data were null.
            // The non-null assertion '!' is used here to reflect the original Java logic
            // that would attempt the access without a null check.
            IO.writeLine("" + data!.length);
            break;
        }

    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: number[] | null;

        while (true) {
            /* POTENTIAL FLAW: data is null */
            data = null;
            break;
        }

        while (true) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length);
            }
            else {
                IO.writeLine("data is null");
            }
            break;
        }
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* This 'main' method is provided for testing the current class in isolation.
     * It functions as an entry point for standalone execution, distinct from
     * how it might be integrated into a larger application for comprehensive analysis.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}