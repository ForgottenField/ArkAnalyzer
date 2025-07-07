// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_52a.ts (primary file for this test case)
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-52a.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 52 Data flow: data passed as an argument from one method to another to another in three different classes in the same package

import { IO, AbstractTestCase } from './testcasesupport'; // Import common utility classes

// Class: CWE476_NULL_Pointer_Dereference__int_array_52c
// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_52c.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-52c.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 52 Data flow: data passed as an argument from one method to another to another in three different classes in the same package

export class CWE476_NULL_Pointer_Dereference__int_array_52c {

    public badSink(data: number[] | null): void {
        // Potential flaw: A null dereference will occur if 'data' is null when its length is accessed.
        // This replicates the original bug by accessing 'length' on a potentially null 'data'.
        IO.writeLine("" + data!.length);
    }

    // goodG2B() - use goodsource and badsink
    public goodG2BSink(data: number[] | null): void {
        // Potential flaw: A null dereference will occur if 'data' is null when its length is accessed.
        // This replicates the original bug by accessing 'length' on a potentially null 'data'.
        IO.writeLine("" + data!.length);
    }

    // goodB2G() - use badsource and goodsink
    public goodB2GSink(data: number[] | null): void {
        // Fix: 'data' is validated to be non-null before use.
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }
}

// Class: CWE476_NULL_Pointer_Dereference__int_array_52b
// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_52b.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-52b.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 52 Data flow: data passed as an argument from one method to another to another in three different classes in the same package

export class CWE476_NULL_Pointer_Dereference__int_array_52b {

    public badSink(data: number[] | null): void {
        (new CWE476_NULL_Pointer_Dereference__int_array_52c()).badSink(data);
    }

    // goodG2B() - use goodsource and badsink
    public goodG2BSink(data: number[] | null): void {
        (new CWE476_NULL_Pointer_Dereference__int_array_52c()).goodG2BSink(data);
    }

    // goodB2G() - use badsource and goodsink
    public goodB2GSink(data: number[] | null): void {
        (new CWE476_NULL_Pointer_Dereference__int_array_52c()).goodB2GSink(data);
    }
}

// Class: CWE476_NULL_Pointer_Dereference__int_array_52a
// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_52a.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-52a.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 52 Data flow: data passed as an argument from one method to another to another in three different classes in the same package

export class CWE476_NULL_Pointer_Dereference__int_array_52a extends AbstractTestCase {

    public bad(): void {
        let data: number[] | null;

        // Potential flaw: 'data' is intentionally set to null.
        data = null;

        (new CWE476_NULL_Pointer_Dereference__int_array_52b()).badSink(data);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - use goodsource and badsink
    private goodG2B(): void {
        let data: number[] | null;

        // Fix: 'data' is initialized to a non-null array.
        data = new Array<number>(5);

        (new CWE476_NULL_Pointer_Dereference__int_array_52b()).goodG2BSink(data);
    }

    // goodB2G() - use badsource and goodsink
    private goodB2G(): void {
        let data: number[] | null;

        // Potential flaw: 'data' is intentionally set to null.
        data = null;

        (new CWE476_NULL_Pointer_Dereference__int_array_52b()).goodB2GSink(data);
    }

    // This is the entry point for testing the test case.
    // It's used when building this test case on its own or for binary analysis tools.
    // It is not used when compiling all test cases as a single application, which is how source code analysis tools are tested.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}