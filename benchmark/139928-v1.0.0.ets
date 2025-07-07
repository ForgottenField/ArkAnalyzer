/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_41.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-41.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:   Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 * GoodSink: add check to prevent possibility of null dereference
 * BadSink : possibility of null dereference
 * Flow Variant: 41 Data flow: data passed as an argument from one method to another in the same class
 *
 * */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_41 extends AbstractTestCase {

    private badSink(data: string | null): void {
        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // To replicate the original behavior, we use the non-null assertion operator (!)
        // which will cause a runtime error if 'data' is null, similar to a NullPointerException in Java.
        IO.writeLine("" + data!.length);
    }

    public bad(): void {
        let data: string | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        this.badSink(data);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    private goodG2BSink(data: string | null): void {
        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // To replicate the original behavior, we use the non-null assertion operator (!)
        // which will cause a runtime error if 'data' is null, similar to a NullPointerException in Java.
        IO.writeLine("" + data!.length);
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: string;

        /* FIX: hardcode data to non-null */
        data = "This is not null";

        this.goodG2BSink(data);
    }

    private goodB2GSink(data: string | null): void {
        /* FIX: validate that data is non-null */
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: string | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        this.goodB2GSink(data);
    }

    /*
     * This main function is for standalone testing of this class. It's not typically used
     * when compiling test cases as part of a larger application, which is how source code
     * analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}