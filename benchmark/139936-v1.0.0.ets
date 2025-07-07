// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__String_66a.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-66a.tmpl.ts

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 66 Data flow: data passed in an array from one method to another in different source files in the same package
 *
 * */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_66a extends AbstractTestCase {

    bad(): void {
        let data: string | null;

        // POTENTIAL FLAW: The 'data' variable is explicitly set to null.
        data = null;

        let dataArray: (string | null)[] = new Array(5);
        dataArray[2] = data;
        new CWE476_NULL_Pointer_Dereference__String_66b().badSink(dataArray);
    }

    good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - use goodsource and badsink
    private goodG2B(): void {
        let data: string | null;

        // FIX: The 'data' variable is initialized to a non-null string.
        data = "This is not null";

        let dataArray: (string | null)[] = new Array(5);
        dataArray[2] = data;
        new CWE476_NULL_Pointer_Dereference__String_66b().goodG2BSink(dataArray);
    }

    // goodB2G() - use badsource and goodsink
    private goodB2G(): void {
        let data: string | null;

        // POTENTIAL FLAW: The 'data' variable is explicitly set to null.
        data = null;

        let dataArray: (string | null)[] = new Array(5);
        dataArray[2] = data;
        new CWE476_NULL_Pointer_Dereference__String_66b().goodB2GSink(dataArray);
    }

    /* This 'main' method is typically used for standalone testing or for building a binary
     * for analysis tools. It is not generally used when compiling all test cases together
     * as a single application, which is common for source code analysis tool testing.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__String_66b.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-66b.tmpl.ts

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 66 Data flow: data passed in an array from one method to another in different source files in the same package
 *
 * */

import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_66b {

    badSink(dataArray: (string | null)[]): void {
        let data: string | null = dataArray[2];

        /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when its length property is accessed.
         * The '!' operator is intentionally used here to bypass TypeScript's null safety checks and replicate the
         * original Java null pointer exception behavior at runtime.
         */
        IO.writeLine("" + data!.length);
    }

    // goodG2B() - use goodsource and badsink
    goodG2BSink(dataArray: (string | null)[]): void {
        let data: string | null = dataArray[2];

        /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when its length property is accessed.
         * The '!' operator is intentionally used here to bypass TypeScript's null safety checks and replicate the
         * original Java null pointer exception behavior at runtime.
         */
        IO.writeLine("" + data!.length);
    }

    // goodB2G() - use badsource and goodsink
    goodB2GSink(dataArray: (string | null)[]): void {
        let data: string | null = dataArray[2];

        // FIX: Validate that 'data' is non-null before attempting to access its properties.
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }
}
