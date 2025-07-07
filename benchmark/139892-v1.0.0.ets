// Define a minimal StringBuilder-like class to replicate the Java behavior.
// This class is provided to ensure the 'length()' method call for the vulnerability.
class StringBuilder {
    private content: string = "";
    constructor(initialContent: string = "") {
        this.content = initialContent;
    }
    public append(s: string): StringBuilder {
        this.content += s;
        return this;
    }
    public toString(): string {
        return this.content;
    }
    // Mimics Java's length() method.
    public length(): number {
        return this.content.length;
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_42.ts
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

export class CWE476_NULL_Pointer_Dereference__StringBuilder_42 extends AbstractTestCase {
    private badSource(): StringBuilder | null {
        let data: StringBuilder | null;

        // POTENTIAL FLAW: 'data' is assigned null.
        data = null;

        return data;
    }

    public bad(): void {
        let data: StringBuilder | null = this.badSource();

        // POTENTIAL FLAW: A null dereference will occur here if 'data' is null,
        // as 'length()' is called on a potentially null object.
        IO.writeLine("" + data!.length());
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2BSource(): StringBuilder | null {
        let data: StringBuilder | null;

        // FIX: Assigns a non-null value to 'data'.
        data = new StringBuilder();

        return data;
    }

    private goodG2B(): void {
        let data: StringBuilder | null = this.goodG2BSource();

        // POTENTIAL FLAW: A null dereference will occur here if 'data' is null,
        // as 'length()' is called on a potentially null object.
        IO.writeLine("" + data!.length());
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2GSource(): StringBuilder | null {
        let data: StringBuilder | null;

        // POTENTIAL FLAW: 'data' is assigned null.
        data = null;

        return data;
    }

    private goodB2G(): void {
        let data: StringBuilder | null = this.goodB2GSource();

        // FIX: Validates that 'data' is not null before use.
        if (data !== null) {
            IO.writeLine("" + data.length());
        } else {
            IO.writeLine("data is null");
        }
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* The 'main' method below is for standalone testing purposes.
     * It is not used when compiling all the test cases as one application,
     * which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
