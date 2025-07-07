// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_01.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-01.tmpl.java
//
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 01 Baseline
//
import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_01 extends AbstractTestCase {
    public bad(): void {
        let data: number | null;

        // To replicate the original logic, 'data' is intentionally set to null here.
        data = null;

        // This is a potential flaw: a null dereference will occur if 'data' is null.
        // The original logic intentionally performs a toString() call on a potentially null value.
        IO.writeLine('' + data.toString());
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - use goodsource and badsink
    private goodG2B(): void {
        let data: number | null;

        // FIX: 'data' is explicitly set to a non-null value.
        data = 5;

        // This is a potential flaw: a null dereference will occur if 'data' is null.
        // The original logic intentionally performs a toString() call on a potentially null value.
        IO.writeLine('' + data.toString());
    }

    // goodB2G() - use badsource and goodsink
    private goodB2G(): void {
        let data: number | null;

        // To replicate the original logic, 'data' is intentionally set to null here.
        data = null;

        // FIX: 'data' is validated to ensure it is not null.
        if (data != null) {
            IO.writeLine('' + data.toString());
        } else {
            IO.writeLine('data is null');
        }
    }

    /*
     * This is the main method, typically used for testing this specific test case in isolation.
     * It's not part of the standard application build process when all test cases are compiled together.
     */
    public static main(...args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}