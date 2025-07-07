/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_42.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-42.tmpl.ts
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

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_42 extends AbstractTestCase {

    private badSource(): string | null {
        let data: string | null;

        // POTENTIAL FLAW: The 'data' variable is explicitly assigned null.
        data = null;

        return data;
    }

    public bad(): void {
        let data: string | null = this.badSource();

        // POTENTIAL FLAW: A null dereference will occur here if 'data' is null, as its 'length' property is accessed directly.
        // This replicates the behavior of attempting to access a method on a null object in the original Java code.
        IO.writeLine("" + data.length); // In ArkTS/TypeScript, 'length' is a property of a string, not a method.
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2BSource(): string {
        let data: string;

        // FIX: 'data' is explicitly set to a non-null string.
        data = "This is not null";

        return data;
    }

    private goodG2B(): void {
        let data: string = this.goodG2BSource();

        // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
        // This replicates the behavior of attempting to access a method on a null object in the original Java code.
        IO.writeLine("" + data.length);
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2GSource(): string | null {
        let data: string | null;

        // POTENTIAL FLAW: The 'data' variable is explicitly assigned null.
        data = null;

        return data;
    }

    private goodB2G(): void {
        let data: string | null = this.goodB2GSource();

        // FIX: Validate that 'data' is not null before attempting to access its properties.
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
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
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}