// Define a simple StringBuilder class to simulate Java's StringBuilder.
// In ArkTS, string operations are typically performed directly on immutable `string` types.
// This class is provided to accurately replicate the original Java code's use of `StringBuilder`
// and its `length()` method for the null dereference scenario.
class StringBuilder {
    private value: string = "";

    constructor(initialValue: string = "") {
        this.value = initialValue;
    }

    // Appends a string to the current value.
    append(str: string): StringBuilder {
        this.value += str;
        return this;
    }

    // Returns the length of the string.
    length(): number {
        return this.value.length;
    }

    // Returns the string representation.
    toString(): string {
        return this.value;
    }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_72b.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-72b.tmpl.ts

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 72 Data flow: data passed in an Array (simulating Vector) from one method to another in different source files
 *
 * */

import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_72b {
    badSink(dataVector: Array<StringBuilder | null>): void {
        // To replicate the original logic, `remove(2)` from Vector is simulated by `splice(2, 1)[0]` from Array.
        // This removes the element at index 2 and returns it.
        let data: StringBuilder | null = dataVector.splice(2, 1)[0];

        /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null. */
        // The '!' non-null assertion is used here to replicate the original Java code's
        // behavior of not checking for null, leading to a runtime error if 'data' is null.
        IO.writeLine("" + data!.length());
    }

    /* goodG2B() - use GoodSource and BadSink */
    goodG2BSink(dataVector: Array<StringBuilder | null>): void {
        // To replicate the original logic, `remove(2)` from Vector is simulated by `splice(2, 1)[0]` from Array.
        // This removes the element at index 2 and returns it.
        let data: StringBuilder | null = dataVector.splice(2, 1)[0];

        /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null. */
        // The '!' non-null assertion is used here to replicate the original Java code's
        // behavior of not checking for null, leading to a runtime error if 'data' is null.
        IO.writeLine("" + data!.length());
    }

    /* goodB2G() - use BadSource and GoodSink */
    goodB2GSink(dataVector: Array<StringBuilder | null>): void {
        // To replicate the original logic, `remove(2)` from Vector is simulated by `splice(2, 1)[0]` from Array.
        // This removes the element at index 2 and returns it.
        let data: StringBuilder | null = dataVector.splice(2, 1)[0];

        /* FIX: Validate that 'data' is non-null before dereferencing it. */
        if (data != null) {
            IO.writeLine("" + data.length());
        } else {
            IO.writeLine("data is null");
        }
    }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_72a.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-72a.tmpl.ts

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 72 Data flow: data passed in an Array (simulating Vector) from one method to another in different source files
 *
 * */

import { AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_72a extends AbstractTestCase {
    bad(): void {
        let data: StringBuilder | null;

        /* POTENTIAL FLAW: 'data' is intentionally set to null. */
        data = null;

        // In Java, `java.util.Vector` is a synchronized dynamic array.
        // In ArkTS/TypeScript, `Array` is commonly used to replicate dynamic list behavior.
        // The `add(index, element)` behavior of Java's Vector is replicated using `splice`.
        let dataVector: Array<StringBuilder | null> = [];
        dataVector.splice(0, 0, data); // Adds at index 0
        dataVector.splice(1, 0, data); // Adds at index 1
        dataVector.splice(2, 0, data); // Adds at index 2

        // Instantiate and call the badSink method from the other class.
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_72b()).badSink(dataVector);
    }

    good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use GoodSource and BadSink */
    private goodG2B(): void {
        let data: StringBuilder | null;

        /* FIX: 'data' is explicitly set to a non-null instance. */
        data = new StringBuilder();

        // In Java, `java.util.Vector` is a synchronized dynamic array.
        // In ArkTS/TypeScript, `Array` is commonly used to replicate dynamic list behavior.
        // The `add(index, element)` behavior of Java's Vector is replicated using `splice`.
        let dataVector: Array<StringBuilder | null> = [];
        dataVector.splice(0, 0, data); // Adds at index 0
        dataVector.splice(1, 0, data); // Adds at index 1
        dataVector.splice(2, 0, data); // Adds at index 2

        // Instantiate and call the goodG2BSink method from the other class.
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_72b()).goodG2BSink(dataVector);
    }

    /* goodB2G() - use BadSource and GoodSink */
    private goodB2G(): void {
        let data: StringBuilder | null;

        /* POTENTIAL FLAW: 'data' is intentionally set to null. */
        data = null;

        // In Java, `java.util.Vector` is a synchronized dynamic array.
        // In ArkTS/TypeScript, `Array` is commonly used to replicate dynamic list behavior.
        // The `add(index, element)` behavior of Java's Vector is replicated using `splice`.
        let dataVector: Array<StringBuilder | null> = [];
        dataVector.splice(0, 0, data); // Adds at index 0
        dataVector.splice(1, 0, data); // Adds at index 1
        dataVector.splice(2, 0, data); // Adds at index 2

        // Instantiate and call the goodB2GSink method from the other class.
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_72b()).goodB2GSink(dataVector);
    }

    /*
     * This is the entry point for running the test case.
     * It's typically used for local testing or for building a binary for analysis tools.
     * In a larger application with many test cases, a shared test runner usually orchestrates execution.
     */
    static main(args: string[]): void {
        // Calls the mainFromParent method, typically provided by the AbstractTestCase base class
        // for centralized test case execution.
        AbstractTestCase.mainFromParent(args);
    }
}