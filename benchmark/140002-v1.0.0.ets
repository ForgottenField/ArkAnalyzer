/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_51a.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-51a.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 51 Data flow: data passed as an argument from one function to another in different classes in the same package
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/**
 * Represents the sink logic for CWE476_NULL_Pointer_Dereference__int_array_51.
 * This class contains methods that demonstrate both vulnerable and safe array dereference operations.
 */
export class CWE476_NULL_Pointer_Dereference__int_array_51b {

    /**
     * badSink: Demonstrates a potential null dereference.
     * @param data The number array, which might be null.
     */
    public badSink(data: number[] | null): void {

        /* POTENTIAL FLAW: null dereference will occur if data is null. In ArkTS, attempting to access 'length' on a 'null' array will throw a TypeError. */
        IO.writeLine("" + data.length); // This line replicates the bug.

    }

    /**
     * goodG2BSink: Demonstrates a potential null dereference, replicating the bad sink logic.
     * This method is part of a flow that originates from a good source but leads to a bad sink.
     * @param data The number array, which might be null.
     */
    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(data: number[] | null): void {

        /* POTENTIAL FLAW: null dereference will occur if data is null. In ArkTS, attempting to access 'length' on a 'null' array will throw a TypeError. */
        IO.writeLine("" + data.length); // This line replicates the bug.

    }

    /**
     * goodB2GSink: Demonstrates how to safely handle a potentially null array.
     * This method is part of a flow that originates from a bad source but leads to a good sink.
     * @param data The number array, which might be null.
     */
    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(data: number[] | null): void {

        /* FIX: validate that data is non-null before accessing its properties */
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }

    }
}

/**
 * Represents the source logic for CWE476_NULL_Pointer_Dereference__int_array_51.
 * This class sets up different scenarios for a number array, which are then passed to sink methods.
 */
export class CWE476_NULL_Pointer_Dereference__int_array_51a extends AbstractTestCase {

    /**
     * bad: Sets up a scenario where the array is explicitly null and passes it to a vulnerable sink.
     */
    public bad(): void {
        let data: number[] | null; // Declare data, allowing it to be a number array or null.

        /* POTENTIAL FLAW: data is null */
        data = null;

        // Pass the null data to the bad sink to trigger the null pointer dereference.
        new CWE476_NULL_Pointer_Dereference__int_array_51b().badSink(data);
    }

    /**
     * good: Executes both good source to bad sink and bad source to good sink scenarios.
     */
    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /**
     * goodG2B(): Uses a good source (non-null data) but passes it to a bad sink (vulnerable).
     * Even though the source is good, the sink doesn't check for null, which is a flaw in the sink itself.
     */
    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: number[] | null; // Declare data, allowing it to be a number array or null.

        /* FIX: hardcode data to a non-null array */
        // In ArkTS, `new Array<number>(5)` creates an array of 5 `undefined` elements.
        // For array length access, this is functionally equivalent to Java's `new int[5]` where elements are default initialized.
        data = new Array<number>(5);

        // Pass the non-null data to the bad sink.
        new CWE476_NULL_Pointer_Dereference__int_array_51b().goodG2BSink(data);
    }

    /**
     * goodB2G(): Uses a bad source (null data) but passes it to a good sink (safe).
     * The sink correctly validates for null, preventing a dereference.
     */
    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: number[] | null; // Declare data, allowing it to be a number array or null.

        /* POTENTIAL FLAW: data is null */
        data = null;

        // Pass the null data to the good sink which handles null safely.
        new CWE476_NULL_Pointer_Dereference__int_array_51b().goodB2GSink(data);
    }

    /**
     * The main entry point for running this test case.
     * This method is primarily used when compiling and testing this specific test case in isolation.
     * It's not typically used when all test cases are compiled together as a single application.
     * @param args Command-line arguments.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}