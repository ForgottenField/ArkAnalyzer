// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_54a.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-54a.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource: Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
// GoodSink: add check to prevent possibility of null dereference
// BadSink : possibility of null dereference
// Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_54a extends AbstractTestCase {
    public bad(): void {
        let data: number[] | null;

        // POTENTIAL FLAW: data is explicitly set to null, mimicking a scenario where a value might be null
        data = null;

        (new CWE476_NULL_Pointer_Dereference__int_array_54b()).badSink(data);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - use good source and bad sink
    private goodG2B(): void {
        let data: number[] | null;

        // FIX: Initialize data to a non-null array
        data = new Array<number>(5).fill(0);

        (new CWE476_NULL_Pointer_Dereference__int_array_54b()).goodG2BSink(data);
    }

    // goodB2G() - use bad source and good sink
    private goodB2G(): void {
        let data: number[] | null;

        // POTENTIAL FLAW: data is explicitly set to null, mimicking a scenario where a value might be null
        data = null;

        (new CWE476_NULL_Pointer_Dereference__int_array_54b()).goodB2GSink(data);
    }

    // Below is the main(). It is only used when building this testcase on
    // its own for testing or for building a binary to use in testing binary
    // analysis tools. It is not used when compiling all the testcases as one
    // application, which is how source code analysis tools are tested.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}


// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_54d.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-54d.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource: Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
// GoodSink: add check to prevent possibility of null dereference
// BadSink : possibility of null dereference
// Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_54d {
    public badSink(data: number[] | null): void {
        (new CWE476_NULL_Pointer_Dereference__int_array_54e()).badSink(data);
    }

    // goodG2B() - use good source and bad sink
    public goodG2BSink(data: number[] | null): void {
        (new CWE476_NULL_Pointer_Dereference__int_array_54e()).goodG2BSink(data);
    }

    // goodB2G() - use bad source and good sink
    public goodB2GSink(data: number[] | null): void {
        (new CWE476_NULL_Pointer_Dereference__int_array_54e()).goodB2GSink(data);
    }
}


// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_54e.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-54e.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource: Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
// GoodSink: add check to prevent possibility of null dereference
// BadSink : possibility of null dereference
// Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_54e {
    public badSink(data: number[] | null): void {
        // POTENTIAL FLAW: null dereference will occur if data is null.
        // The '!' operator is used here to replicate the original Java behavior
        // where a NullPointerException would occur at runtime if 'data' is null.
        IO.writeLine(String(data!.length));
    }

    // goodG2B() - use good source and bad sink
    public goodG2BSink(data: number[] | null): void {
        // POTENTIAL FLAW: null dereference will occur if data is null.
        // The '!' operator is used here to replicate the original Java behavior
        // where a NullPointerException would occur at runtime if 'data' is null.
        IO.writeLine(String(data!.length));
    }

    // goodB2G() - use bad source and good sink
    public goodB2GSink(data: number[] | null): void {
        // FIX: validate that data is non-null before accessing its properties.
        if (data != null) {
            IO.writeLine(String(data.length));
        } else {
            IO.writeLine("data is null");
        }
    }
}


// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_54b.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-54b.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource: Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
// GoodSink: add check to prevent possibility of null dereference
// BadSink : possibility of null dereference
// Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_54b {
    public badSink(data: number[] | null): void {
        (new CWE476_NULL_Pointer_Dereference__int_array_54c()).badSink(data);
    }

    // goodG2B() - use good source and bad sink
    public goodG2BSink(data: number[] | null): void {
        (new CWE476_NULL_Pointer_Dereference__int_array_54c()).goodG2BSink(data);
    }

    // goodB2G() - use bad source and good sink
    public goodB2GSink(data: number[] | null): void {
        (new CWE476_NULL_Pointer_Dereference__int_array_54c()).goodB2GSink(data);
    }
}


// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_54c.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-54c.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource: Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
// GoodSink: add check to prevent possibility of null dereference
// BadSink : possibility of null dereference
// Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_54c {
    public badSink(data: number[] | null): void {
        (new CWE476_NULL_Pointer_Dereference__int_array_54d()).badSink(data);
    }

    // goodG2B() - use good source and bad sink
    public goodG2BSink(data: number[] | null): void {
        (new CWE476_NULL_Pointer_Dereference__int_array_54d()).goodG2BSink(data);
    }

    // goodB2G() - use bad source and good sink
    public goodB2GSink(data: number[] | null): void {
        (new CWE476_NULL_Pointer_Dereference__int_array_54d()).goodB2GSink(data);
    }
}