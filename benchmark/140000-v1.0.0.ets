// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_42.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-42.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 42 Data flow: data returned from one method to another in the same class

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_42 extends AbstractTestCase {

    private badSource(): number[] | null {
        let data: number[] | null;

        // POTENTIAL FLAW: 'data' is deliberately set to null.
        data = null;

        return data;
    }

    public bad(): void {
        let data: number[] | null = this.badSource();

        // POTENTIAL FLAW: A null dereference will occur when attempting to access 'data.length' if 'data' is null.
        // We use the non-null assertion operator '!' to simulate the Java behavior where the access is allowed
        // but results in a runtime error if the value is null.
        IO.writeLine("" + data!.length);
    }

    // goodG2B() - use goodsource and badsink
    private goodG2BSource(): number[] {
        let data: number[];

        // FIX: 'data' is initialized to a non-null array.
        data = new Array<number>(5);

        return data;
    }

    private goodG2B(): void {
        let data: number[] = this.goodG2BSource();

        // POTENTIAL FLAW: A null dereference would occur if 'data' were null; however, in this specific path,
        // 'data' is guaranteed to be non-null from 'goodG2BSource'.
        // We still use the non-null assertion '!' to match the pattern of the 'bad' method's sink logic.
        IO.writeLine("" + data!.length);
    }

    // goodB2G() - use badsource and goodsink
    private goodB2GSource(): number[] | null {
        let data: number[] | null;

        // POTENTIAL FLAW: 'data' is deliberately set to null.
        data = null;

        return data;
    }

    private goodB2G(): void {
        let data: number[] | null = this.goodB2GSource();

        // FIX: Validate that 'data' is non-null before dereferencing.
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

    // The 'main' method below is for stand-alone testing or for building a binary
    // to use in testing binary analysis tools. It is not used when compiling all
    // the test cases as a single application, which is how source code analysis
    // tools are typically tested.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}