// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_21.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-21.tmpl.ts
//
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 21 Control flow: Flow controlled by value of a private variable. All functions contained in one file.
//
import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_21 extends AbstractTestCase {

    // This variable is used to drive control flow in the sink function.
    private badPrivate: boolean = false;

    public bad(): void {
        // To replicate the original logic, we use 'string | null' to simulate a nullable string.
        let data: string | null;

        // POTENTIAL FLAW: data is null
        data = null;

        this.badPrivate = true;
        this.badSink(data);
    }

    private badSink(data: string | null): void {
        if (this.badPrivate) {
            // POTENTIAL FLAW: If 'data' is null, accessing its 'length' property will cause a null pointer dereference.
            IO.writeLine("" + data.length);
        }
    }

    // These variables are used to drive control flow in the sink functions.
    private goodB2G1Private: boolean = false;
    private goodB2G2Private: boolean = false;
    private goodG2BPrivate: boolean = false;

    public good(): void {
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
            // INCIDENTAL: Dead Code, the code below will never run.
            IO.writeLine("Benign, fixed string");
        } else {

            // FIX: Validate that 'data' is non-null.
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    // goodB2G2() - uses a BadSource and a GoodSink by reversing the blocks in the 'if' condition in the sink function.
    private goodB2G2(): void {
        let data: string | null;

        // POTENTIAL FLAW: data is null
        data = null;

        this.goodB2G2Private = true;
        this.goodB2G2Sink(data);
    }

    private goodB2G2Sink(data: string | null): void {
        if (this.goodB2G2Private) {
            // FIX: Validate that 'data' is non-null.
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    // goodG2B() - uses a GoodSource and a BadSink.
    private goodG2B(): void {
        let data: string | null;

        // FIX: Hardcode 'data' to a non-null string value.
        data = ""; // Using an empty string to represent a non-null, initialized string.

        this.goodG2BPrivate = true;
        this.goodG2BSink(data);
    }

    private goodG2BSink(data: string | null): void {
        if (this.goodG2BPrivate) {
            // POTENTIAL FLAW: If 'data' is null, accessing its 'length' property will cause a null pointer dereference.
            // Note: In this specific 'goodG2BSink' path, 'data' is intentionally non-null,
            // but the 'badSink' logic is replicated for consistency across good/bad examples.
            IO.writeLine("" + data.length);
        }
    }

    // The static 'main' method is typically used for running test cases independently.
    // When compiling all test cases as one application, this method is not used.
    public static main(args: string[]): void {
        // Calls the main entry point from the parent test case support, as used in the original Java.
        AbstractTestCase.mainFromParent(args);
    }
}
