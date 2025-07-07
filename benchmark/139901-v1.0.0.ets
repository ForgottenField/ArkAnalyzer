/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_68b.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-68b.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 68 Data flow: data passed as a member variable in the "a" class, which is used by a method in another class in the same package
 *
 * */

import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_68b {

    public badSink(): void {
        // In ArkTS, 'string | null' is used to indicate that 'data' might be null.
        // We retrieve the static 'data' property from the 'CWE476_NULL_Pointer_Dereference__StringBuilder_68a' class.
        let data: string | null = CWE476_NULL_Pointer_Dereference__StringBuilder_68a.data;

        /* POTENTIAL FLAW: null dereference will occur if data is null.
         * The '!' non-null assertion is used here to replicate the original Java
         * behavior of attempting to access a member on a potentially null object,
         * bypassing TypeScript's compile-time null checks. This will lead to a runtime error if data is null. */
        IO.writeLine('' + data!.length);
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(): void {
        let data: string | null = CWE476_NULL_Pointer_Dereference__StringBuilder_68a.data;

        /* POTENTIAL FLAW: null dereference will occur if data is null.
         * The '!' non-null assertion is used here to replicate the original Java
         * behavior of attempting to access a member on a potentially null object,
         * bypassing TypeScript's compile-time null checks. This will lead to a runtime error if data is null. */
        IO.writeLine('' + data!.length);
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(): void {
        let data: string | null = CWE476_NULL_Pointer_Dereference__StringBuilder_68a.data;

        /* FIX: validate that data is non-null before attempting to access its properties */
        if (data != null) {
            IO.writeLine('' + data.length);
        } else {
            IO.writeLine('data is null');
        }
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_68a.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-68a.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 68 Data flow: data passed as a member variable in the "a" class, which is used by a method in another class in the same package
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_68a extends AbstractTestCase {
    // In ArkTS, 'string | null' is used to explicitly declare that 'data' can be either a string or null.
    // This replicates the behavior where a StringBuilder in Java could be null.
    public static data: string | null;

    public bad(): void {
        /* POTENTIAL FLAW: data is null */
        CWE476_NULL_Pointer_Dereference__StringBuilder_68a.data = null;

        (new CWE476_NULL_Pointer_Dereference__StringBuilder_68b()).badSink();
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        /* FIX: hardcode data to a non-null string value */
        CWE476_NULL_Pointer_Dereference__StringBuilder_68a.data = ''; // Represents an empty StringBuilder

        (new CWE476_NULL_Pointer_Dereference__StringBuilder_68b()).goodG2BSink();
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        /* POTENTIAL FLAW: data is null */
        CWE476_NULL_Pointer_Dereference__StringBuilder_68a.data = null;

        (new CWE476_NULL_Pointer_Dereference__StringBuilder_68b()).goodB2GSink();
    }

    /* In ArkTS, this main method serves a similar purpose to its Java counterpart.
     * It is typically used for standalone testing or building a binary for analysis tools,
     * rather than being part of a larger application compilation.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
