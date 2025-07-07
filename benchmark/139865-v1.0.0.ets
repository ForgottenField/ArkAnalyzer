// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_71b.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-71b.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 71 Data flow: data passed as an Object reference argument from one method to another in different classes in the same package

import { IO } from './testcasesupport'; // Importing IO from the specified path

export class CWE476_NULL_Pointer_Dereference__Integer_71b {
    // This method demonstrates a potential null pointer dereference.
    // It accepts an 'any' type to simulate the Object reference from Java.
    public badSink(dataObject: any): void {
        // In the original Java code, dataObject was cast to Integer.
        // Here, we simulate this by casting to 'number | null' as 'Integer' in Java
        // could represent a number that is either present or null.
        let data: number | null = dataObject as (number | null);

        // POTENTIAL FLAW: If 'data' is null, accessing 'data.toString()' will cause a runtime error.
        // This replicates the null pointer dereference from the original Java code.
        IO.writeLine("" + data!.toString()); // Using '!' to force access, simulating the Java unchecked access

    }

    // goodG2B() - uses a good source and a bad sink.
    // This method demonstrates a potential null pointer dereference, similar to badSink.
    public goodG2BSink(dataObject: any): void {
        // In the original Java code, dataObject was cast to Integer.
        // Here, we simulate this by casting to 'number | null'.
        let data: number | null = dataObject as (number | null);

        // POTENTIAL FLAW: If 'data' is null, accessing 'data.toString()' will cause a runtime error.
        // This replicates the null pointer dereference from the original Java code.
        IO.writeLine("" + data!.toString()); // Using '!' to force access, simulating the Java unchecked access
    }

    // goodB2G() - uses a bad source and a good sink.
    // This method includes a null check to prevent dereferencing a null value.
    public goodB2GSink(dataObject: any): void {
        // In the original Java code, dataObject was cast to Integer.
        // Here, we simulate this by casting to 'number | null'.
        let data: number | null = dataObject as (number | null);

        // FIX: Validating that 'data' is non-null before attempting to access its properties.
        if (data != null)
        {
            IO.writeLine("" + data.toString());
        }
        else
        {
            IO.writeLine("data is null");
        }

    }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_71a.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-71a.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 71 Data flow: data passed as an Object reference argument from one method to another in different classes in the same package

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport'; // Importing necessary classes from the specified path

export class CWE476_NULL_Pointer_Dereference__Integer_71a extends AbstractTestCase {

    public bad(): void {
        // Declaring 'data' which can be a number or null, simulating Java's Integer object.
        let data: number | null;

        // POTENTIAL FLAW: 'data' is intentionally set to null to demonstrate the vulnerability.
        data = null;

        // Passing the potentially null 'data' to badSink in the other class.
        // The cast to 'any' replicates passing an Object reference in Java.
        (new CWE476_NULL_Pointer_Dereference__Integer_71b()).badSink(data as any);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - uses a good source and a bad sink.
    private goodG2B(): void {
        // Declaring 'data' which can be a number or null.
        let data: number | null;

        // FIX: 'data' is assigned a non-null value to avoid the null pointer dereference.
        // This simulates Integer.valueOf(5) from Java.
        data = 5;

        // Passing the non-null 'data' to goodG2BSink.
        (new CWE476_NULL_Pointer_Dereference__Integer_71b()).goodG2BSink(data as any);
    }

    // goodB2G() - uses a bad source and a good sink.
    private goodB2G(): void {
        // Declaring 'data' which can be a number or null.
        let data: number | null;

        // POTENTIAL FLAW: 'data' is intentionally set to null to demonstrate the vulnerability.
        data = null;

        // Passing the potentially null 'data' to goodB2GSink, which includes a null check.
        (new CWE476_NULL_Pointer_Dereference__Integer_71b()).goodB2GSink(data as any);
    }

    // Below is the main() equivalent. It is only used when building this testcase on
    // its own for testing or for building a binary to use in testing binary
    // analysis tools. It is not used when compiling all the testcases as one
    // application, which is how source code analysis tools are tested.
    public static main(args: string[]): void {
        // This calls the main execution logic from the parent test case class,
        // similar to Java's static mainFromParent.
        AbstractTestCase.mainFromParent(args);
    }
}