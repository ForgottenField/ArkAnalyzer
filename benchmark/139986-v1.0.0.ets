// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_08.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-08.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 08 Control flow: if(privateReturnsTrue()) and if(privateReturnsFalse())

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_08 extends AbstractTestCase {

    // These methods consistently return the same value, enabling static analysis tools to determine their outcome.
    private privateReturnsTrue(): boolean {
        return true;
    }

    private privateReturnsFalse(): boolean {
        return false;
    }

    public bad(): void {
        let data: number[] | null;
        if (this.privateReturnsTrue()) {
            // POTENTIAL FLAW: The 'data' variable is assigned null.
            data = null;
        } else {
            // INCIDENTAL: This code branch is unreachable, but it ensures 'data' is initialized to avoid compilation errors.
            data = null;
        }

        if (this.privateReturnsTrue()) {
            // POTENTIAL FLAW: A null pointer dereference will occur if 'data' is null when accessing its length.
            // To replicate the original Java bug, we bypass TypeScript's null safety check here.
            IO.writeLine("" + data!.length);
        }
    }

    // goodG2B1() - use goodsource and badsink by changing first privateReturnsTrue() to privateReturnsFalse()
    private goodG2B1(): void {
        let data: number[] | null;
        if (this.privateReturnsFalse()) {
            // INCIDENTAL: This code branch is unreachable, but it ensures 'data' is initialized to avoid compilation errors.
            data = null;
        } else {
            // FIX: 'data' is explicitly initialized to a non-null array.
            data = new Array<number>(5);
        }

        if (this.privateReturnsTrue()) {
            // POTENTIAL FLAW: A null pointer dereference will occur if 'data' is null when accessing its length.
            // To replicate the original Java bug, we bypass TypeScript's null safety check here.
            IO.writeLine("" + data!.length);
        }
    }

    // goodG2B2() - use goodsource and badsink by reversing statements in first if
    private goodG2B2(): void {
        let data: number[] | null;
        if (this.privateReturnsTrue()) {
            // FIX: 'data' is explicitly initialized to a non-null array.
            data = new Array<number>(5);
        } else {
            // INCIDENTAL: This code branch is unreachable, but it ensures 'data' is initialized to avoid compilation errors.
            data = null;
        }

        if (this.privateReturnsTrue()) {
            // POTENTIAL FLAW: A null pointer dereference will occur if 'data' is null when accessing its length.
            // To replicate the original Java bug, we bypass TypeScript's null safety check here.
            IO.writeLine("" + data!.length);
        }
    }

    // goodB2G1() - use badsource and goodsink by changing second privateReturnsTrue() to privateReturnsFalse()
    private goodB2G1(): void {
        let data: number[] | null;
        if (this.privateReturnsTrue()) {
            // POTENTIAL FLAW: The 'data' variable is assigned null.
            data = null;
        } else {
            // INCIDENTAL: This code branch is unreachable, but it ensures 'data' is initialized to avoid compilation errors.
            data = null;
        }

        if (this.privateReturnsFalse()) {
            // INCIDENTAL: This code branch is unreachable.
            IO.writeLine("Benign, fixed string");
        } else {
            // FIX: Validating 'data' to ensure it is not null before use.
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    // goodB2G2() - use badsource and goodsink by reversing statements in second if
    private goodB2G2(): void {
        let data: number[] | null;
        if (this.privateReturnsTrue()) {
            // POTENTIAL FLAW: The 'data' variable is assigned null.
            data = null;
        } else {
            // INCIDENTAL: This code branch is unreachable, but it ensures 'data' is initialized to avoid compilation errors.
            data = null;
        }

        if (this.privateReturnsTrue()) {
            // FIX: Validating 'data' to ensure it is not null before use.
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    public good(): void {
        this.goodG2B1();
        this.goodG2B2();
        this.goodB2G1();
        this.goodB2G2();
    }

    /* This static method serves as the entry point when this test case is compiled and run independently,
     * primarily for testing binary analysis tools. It is not invoked when all test cases are compiled
     * as a single application, which is typical for source code analysis tool testing. */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
