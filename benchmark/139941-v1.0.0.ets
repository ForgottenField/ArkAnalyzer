/* TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__String_73b.ts
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-73b.tmpl.ts
 */
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 73 Data flow: data passed in an array from one method to another in different source files in the same logical grouping.
 *
 */

// Importing necessary utilities from a common test support module.
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_73b {
    /**
     * Handles a potentially null string received via an array.
     * Replicates a scenario where a null dereference might occur.
     * @param dataLinkedList An array of strings, which might contain null values.
     */
    public badSink(dataLinkedList: Array<string | null>): void {
        // In ArkTS, Array.splice(index, 1) removes one element at the specified index and returns an array of the removed elements.
        // We then take the first element from this returned array. If the index is out of bounds or the array is empty after splice,
        // this will result in 'undefined'. However, in this test case, the index 2 will always be valid and contain the 'null' or 'string' value.
        const data: string | null = dataLinkedList.splice(2, 1)[0];

        /* POTENTIAL FLAW: A null dereference will occur if 'data' is null.
         * The original Java code would throw a NullPointerException here.
         * In ArkTS, accessing a property like 'length' on a 'null' or 'undefined' value directly
         * would result in a runtime error (e.g., "TypeError: Cannot read properties of null (reading 'length')").
         * This faithfully reproduces the original bug.
         */
        IO.writeLine("" + data.length);
    }

    /**
     * Handles a string received from a good source via an array, but with a bad sink.
     * @param dataLinkedList An array of strings.
     */
    public goodG2BSink(dataLinkedList: Array<string | null>): void {
        const data: string | null = dataLinkedList.splice(2, 1)[0];

        /* POTENTIAL FLAW: A null dereference will occur if 'data' is null.
         * This sink is intentionally flawed to test the good source against a bad sink.
         */
        IO.writeLine("" + data.length);
    }

    /**
     * Handles a string received from a bad source via an array, but with a good sink.
     * @param dataLinkedList An array of strings, which might contain null values.
     */
    public goodB2GSink(dataLinkedList: Array<string | null>): void {
        const data: string | null = dataLinkedList.splice(2, 1)[0];

        /* FIX: Validates that 'data' is non-null before attempting to access its properties. */
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__String_73a.ts
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-73a.tmpl.ts
 */
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 73 Data flow: data passed in an array from one method to another in different source files in the same logical grouping.
 *
 */

export class CWE476_NULL_Pointer_Dereference__String_73a extends AbstractTestCase {

    /**
     * Defines the "bad" scenario where a null value propagates and causes a dereference.
     */
    public bad(): void {
        let data: string | null;

        /* POTENTIAL FLAW: 'data' is explicitly set to null. */
        data = null;

        // In ArkTS, a standard Array can be used to simulate Java's LinkedList for this specific behavior.
        // We use 'string | null' to explicitly allow null values, replicating the Java behavior.
        const dataLinkedList: Array<string | null> = new Array<string | null>();
        // Array.splice(index, 0, element) inserts an element at a specific index without removing any existing elements.
        dataLinkedList.splice(0, 0, data); // Insert 'data' at index 0
        dataLinkedList.splice(1, 0, data); // Insert 'data' at index 1
        dataLinkedList.splice(2, 0, data); // Insert 'data' at index 2

        // Pass the array containing the null value to the badSink method.
        // This will lead to a null pointer dereference in badSink.
        new CWE476_NULL_Pointer_Dereference__String_73b().badSink(dataLinkedList);
    }

    /**
     * Orchestrates the "good" scenarios.
     */
    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /**
     * goodG2B() - uses a good source (non-null data) and a bad sink (no null check).
     */
    private goodG2B(): void {
        let data: string | null;

        /* FIX: 'data' is initialized with a non-null string. */
        data = "This is not null";

        const dataLinkedList: Array<string | null> = new Array<string | null>();
        dataLinkedList.splice(0, 0, data);
        dataLinkedList.splice(1, 0, data);
        dataLinkedList.splice(2, 0, data);

        new CWE476_NULL_Pointer_Dereference__String_73b().goodG2BSink(dataLinkedList);
    }

    /**
     * goodB2G() - uses a bad source (null data) but a good sink (with a null check).
     */
    private goodB2G(): void {
        let data: string | null;

        /* POTENTIAL FLAW: 'data' is explicitly set to null. */
        data = null;

        const dataLinkedList: Array<string | null> = new Array<string | null>();
        dataLinkedList.splice(0, 0, data);
        dataLinkedList.splice(1, 0, data);
        dataLinkedList.splice(2, 0, data);

        new CWE476_NULL_Pointer_Dereference__String_73b().goodB2GSink(dataLinkedList);
    }

    /**
     * The main entry point for running this test case in isolation.
     * This is typically used for specific testing and not when compiling
     * all test cases as part of a larger application.
     * @param args Command line arguments, passed to the parent test case handler.
     */
    public static main(args: string[]): void {
        // Calls the main function from the AbstractTestCaseBase to handle execution.
        AbstractTestCaseBase.mainFromParent(args);
    }
}