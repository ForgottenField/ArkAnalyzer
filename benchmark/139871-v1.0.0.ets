// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_01.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-01.tmpl.java

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 01 Baseline

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_01 extends AbstractTestCase {

    public bad(): void {
        let data: string | null;

        // POTENTIAL FLAW: 'data' is assigned null.
        data = null;

        // POTENTIAL FLAW: The original logic attempts to get the length of the string,
        // which will cause a runtime error if 'data' is null.
        IO.writeLine("" + data!.length);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - use goodsource and badsink
    private goodG2B(): void {
        let data: string | null;

        // FIX: Initialize 'data' to a non-null string.
        data = ""; // An empty string is a non-null value, similar to new StringBuilder()

        // POTENTIAL FLAW: A null dereference would occur here if 'data' were null.
        // The original logic attempts to get the length of the string.
        IO.writeLine("" + data.length);
    }

    // goodB2G() - use badsource and goodsink
    private goodB2G(): void {
        let data: string | null;

        // POTENTIAL FLAW: 'data' is assigned null.
        data = null;

        // FIX: Validate that 'data' is not null before use.
        if (data != null) {
            // The original logic attempts to get the length of the string.
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }

    // The 'main' method is typically used for standalone testing or for building a binary
    // for analysis tools. It is not used when compiling all test cases as one application,
    // which is how source code analysis tools are tested.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
