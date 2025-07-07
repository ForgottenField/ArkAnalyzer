/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_61a.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-61a.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 61 Data flow: data returned from one method to another in different classes in the same package
 *
 * */

import { IO, AbstractTestCase } from './testcasesupport';

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_61b.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-61b.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 61 Data flow: data returned from one method to another in different classes in the same package
 *
 * */

export class CWE476_NULL_Pointer_Dereference__String_61b {
    public badSource(): string | null {
        let data: string | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        return data;
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSource(): string {
        let data: string;

        /* FIX: hardcode data to non-null */
        data = "This is not null";

        return data;
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSource(): string | null {
        let data: string | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        return data;
    }
}

export class CWE476_NULL_Pointer_Dereference__String_61a extends AbstractTestCase {
    public bad(): void {
        let data: string | null = (new CWE476_NULL_Pointer_Dereference__String_61b()).badSource();

        /* POTENTIAL FLAW: If 'data' is null, accessing its 'length' property will cause a runtime error. */
        IO.writeLine(`${data!.length}`);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: string | null = (new CWE476_NULL_Pointer_Dereference__String_61b()).goodG2BSource();

        /* POTENTIAL FLAW: If 'data' is null, accessing its 'length' property will cause a runtime error. */
        IO.writeLine(`${data!.length}`);
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: string | null = (new CWE476_NULL_Pointer_Dereference__String_61b()).goodB2GSource();

        /* FIX: validate that 'data' is non-null */
        if (data !== null) {
            IO.writeLine(`${data.length}`);
        } else {
            IO.writeLine("data is null");
        }
    }

    /* Below is the main() equivalent. This is typically used when building this
     * test case for standalone testing or binary analysis tools. It is not
     * used when compiling all test cases as one application, which is how
     * source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}