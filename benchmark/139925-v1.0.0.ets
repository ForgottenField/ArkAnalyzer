// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__String_21.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-21.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 21 Control flow: Flow controlled by value of a private variable. All functions contained in one file.

import { IO, AbstractTestCase } from './testcasesupport';

class CWE476_NULL_Pointer_Dereference__String_21 extends AbstractTestCase {

    // The variable below is used to drive control flow in the sink function.
    private badPrivate: boolean = false;

    bad(): void {
        let data: string | null;

        // POTENTIAL FLAW: data is null
        data = null;

        this.badPrivate = true;
        this.badSink(data);
    }

    private badSink(data: string | null): void {
        if (this.badPrivate) {
            // POTENTIAL FLAW: A null dereference will occur if data is null.
            // In ArkTS, accessing a property like 'length' on a 'null' value will result in a runtime error.
            // The '!' operator is used here to bypass strict null checks and replicate the original Java bug.
            IO.writeLine("" + data!.length);
        }
    }

    // The variables below are used to drive control flow in the sink functions.
    private goodB2G1Private: boolean = false;
    private goodB2G2Private: boolean = false;
    private goodG2BPrivate: boolean = false;

    good(): void {
        this.goodB2G1();
        this.goodB2G2();
        this.goodG2B();
    }

    // goodB2G1() - uses a BadSource and a GoodSink by setting the control variable to false instead of true.
    private goodB2G1(): void {
        let data: string | null;

        // POTENTIAL FLAW: data is null
        data = null;

        this.goodB2G1Private = false;
        this.goodB2G1Sink(data);
    }

    private goodB2G1Sink(data: string | null): void {
        if (this.goodB2G1Private) {
            // INCIDENTAL: CWE 561 Dead Code, this code block will never execute.
            IO.writeLine("Benign, fixed string");
        } else {

            // FIX: Validate that data is non-null before dereferencing it.
            if (data !== null) {
                IO.writeLine("" + data.length);
            }
            else {
                IO.writeLine("data is null");
            }

        }
    }

    // goodB2G2() - uses a BadSource and a GoodSink by reversing the blocks in the sink function's conditional.
    private goodB2G2(): void {
        let data: string | null;

        // POTENTIAL FLAW: data is null
        data = null;

        this.goodB2G2Private = true;
        this.goodB2G2Sink(data);
    }

    private goodB2G2Sink(data: string | null): void {
        if (this.goodB2G2Private) {
            // FIX: Validate that data is non-null before dereferencing it.
            if (data !== null) {
                IO.writeLine("" + data.length);
            }
            else {
                IO.writeLine("data is null");
            }
        }
    }

    // goodG2B() - uses a GoodSource and a BadSink.
    private goodG2B(): void {
        let data: string | null;

        // FIX: Hardcode data to a non-null value.
        data = "This is not null";

        this.goodG2BPrivate = true;
        this.goodG2BSink(data);
    }

    private goodG2BSink(data: string | null): void {
        if (this.goodG2BPrivate) {
            // POTENTIAL FLAW: A null dereference will occur if data is null.
            // In ArkTS, accessing a property like 'length' on a 'null' value will result in a runtime error.
            // The '!' operator is used here to bypass strict null checks and replicate the original Java bug.
            IO.writeLine("" + data!.length);
        }
    }

    // This 'main' method is provided for standalone testing of this test case.
    // It is not typically used when compiling the entire suite of test cases
    // as part of a larger application.
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
