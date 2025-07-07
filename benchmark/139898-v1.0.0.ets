// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_61b.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-61b.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 61 Data flow: data returned from one method to another in different classes in the same package

// Note: In ArkTS, `StringBuilder` is not a built-in class. We represent it here as `string | null` to simulate the original
// Java class's behavior and nullability for the purpose of demonstrating the vulnerability.

export class CWE476_NULL_Pointer_Dereference__StringBuilder_61b {

    public badSource(): string | null { // Returns a string that might be null
        let data: string | null;

        // POTENTIAL FLAW: data is set to null, replicating the original Java behavior
        data = null;

        return data;
    }

    // goodG2B() - use goodsource and badsink
    public goodG2BSource(): string | null { // Returns a non-null string
        let data: string | null;

        // FIX: Initializes data to a non-null string, replicating the original Java behavior
        data = ''; // Equivalent to new StringBuilder() in Java for length() operation

        return data;
    }

    // goodB2G() - use badsource and goodsink
    public goodB2GSource(): string | null { // Returns a string that might be null
        let data: string | null;

        // POTENTIAL FLAW: data is set to null, replicating the original Java behavior
        data = null;

        return data;
    }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_61a.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-61a.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 61 Data flow: data returned from one method to another in different classes in the same package

import { IO, AbstractTestCase } from './testcasesupport';
// CWE476_NULL_Pointer_Dereference__StringBuilder_61b is defined in the same file, so no explicit import needed here.

export class CWE476_NULL_Pointer_Dereference__StringBuilder_61a extends AbstractTestCase {

    public bad(): void {
        // To replicate the original Java logic, we simulate a scenario where this value could be null.
        // In ArkTS, `StringBuilder` is not a built-in class. We use `string | null` to represent the nullable string type.
        let data: string | null = (new CWE476_NULL_Pointer_Dereference__StringBuilder_61b()).badSource();

        // POTENTIAL FLAW: null dereference will occur if data is null.
        // In ArkTS, accessing a property like `length` on a `null` variable will result in a runtime error,
        // mirroring the Java NullPointerException.
        IO.writeLine("" + data!.length); // Using '!' to assert non-null to replicate the direct dereference and the bug.

    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - use goodsource and badsink
    private goodG2B(): void {
        // To replicate the original Java logic, we simulate a scenario where this value could be null.
        let data: string | null = (new CWE476_NULL_Pointer_Dereference__StringBuilder_61b()).goodG2BSource();

        // POTENTIAL FLAW: null dereference will occur if data is null.
        // In ArkTS, accessing a property like `length` on a `null` variable will result in a runtime error,
        // mirroring the Java NullPointerException.
        IO.writeLine("" + data!.length); // Using '!' to assert non-null to replicate the direct dereference and the bug.
    }

    // goodB2G() - use badsource and goodsink
    private goodB2G(): void {
        // To replicate the original Java logic, we simulate a scenario where this value could be null.
        let data: string | null = (new CWE476_NULL_Pointer_Dereference__StringBuilder_61b()).goodB2GSource();

        // FIX: validates that data is non-null before dereferencing it.
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }

    /*
     * This is the entry point for running the test case independently.
     * In a full ArkTS application, this would typically be handled by the application's lifecycle.
     * This method ensures `mainFromParent` is called to execute the test logic.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
