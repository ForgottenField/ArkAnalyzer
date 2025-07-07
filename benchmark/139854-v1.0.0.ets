/* TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__Integer_41.ts
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-41.tmpl.ts
 */

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource: Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 41 Data flow: data passed as an argument from one method to another in the same class
 *
 * */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_41 extends AbstractTestCase {

    private badSink(data: number | null): void {

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // To replicate the original Java behavior where a null object method call would throw an error,
        // we use the non-null assertion operator (!) which will cause a runtime error if data is null.
        IO.writeLine("" + data!.toString());
    }

    public bad(): void {
        let data: number | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        this.badSink(data);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    private goodG2BSink(data: number | null): void {

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // To replicate the original Java behavior where a null object method call would throw an error,
        // we use the non-null assertion operator (!) which will cause a runtime error if data is null.
        IO.writeLine("" + data!.toString());
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: number | null;

        /* FIX: hardcode data to non-null */
        // In ArkTS, `number` is a primitive type, so directly assign the numeric value.
        data = 5;

        this.goodG2BSink(data);
    }

    private goodB2GSink(data: number | null): void {

        /* FIX: validate that data is non-null */
        if (data != null) {
            IO.writeLine("" + data.toString());
        } else {
            IO.writeLine("data is null");
        }
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: number | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        this.goodB2GSink(data);
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