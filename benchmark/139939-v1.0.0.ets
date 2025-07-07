// CWE476_NULL_Pointer_Dereference__String_71b.ts
// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__String_71b.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-71b.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 71 Data flow: data passed as an Object reference argument from one method to another across different modules/files.

import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_71b {
    public badSink(dataObject: Object | null): void {
        // To replicate the original logic, we simulate a scenario where this value could be null.
        // In ArkTS, explicit type assertions or `null | undefined` union types are used for nullability.
        let data: string | null = dataObject as string | null;

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // The '!' operator asserts that 'data' is non-null at this point for TypeScript compilation,
        // allowing the runtime error to occur if 'data' is indeed null, faithfully replicating the Java bug.
        IO.writeLine("" + data!.length);
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(dataObject: Object | null): void {
        let data: string | null = dataObject as string | null;

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // The '!' operator asserts that 'data' is non-null at this point for TypeScript compilation,
        // allowing the runtime error to occur if 'data' is indeed null, faithfully replicating the Java bug.
        IO.writeLine("" + data!.length);
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(dataObject: Object | null): void {
        let data: string | null = dataObject as string | null;

        /* FIX: validate that data is non-null */
        if (data !== null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }
}

// CWE476_NULL_Pointer_Dereference__String_71a.ts
// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__String_71a.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-71a.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 71 Data flow: data passed as an Object reference argument from one method to another across different modules/files.

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_71a extends AbstractTestCase {
    public bad(): void {
        let data: string | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        // To replicate the original logic, we pass the potentially null 'data' to the sink method.
        (new CWE476_NULL_Pointer_Dereference__String_71b()).badSink(data);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: string | null;

        /* FIX: hardcode data to non-null */
        data = "This is not null";

        // We pass the non-null 'data' to the sink method.
        (new CWE476_NULL_Pointer_Dereference__String_71b()).goodG2BSink(data);
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: string | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        // To replicate the original logic, we pass the potentially null 'data' to the sink method.
        (new CWE476_NULL_Pointer_Dereference__String_71b()).goodB2GSink(data);
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        // This simulates the Java static method call behavior for testing.
        AbstractTestCase.mainFromParent(args);
    }
}