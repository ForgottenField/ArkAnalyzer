/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_16.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-16.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 16 Control flow: while(true)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_16 extends AbstractTestCase {

    bad(): void {
        let data: string | null; // Declare data as a string that can also be null

        while (true) {
            /* POTENTIAL FLAW: data is null */
            data = null;
            break;
        }

        while (true) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS, accessing the 'length' property on a null string will throw a runtime error,
            // replicating the Java NullPointerException. The '!' operator is used to bypass TypeScript's
            // compile-time null checks, ensuring the runtime error is preserved as per the original bug.
            IO.writeLine("" + data!.length);
            break;
        }
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: string | null;

        while (true) {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
            break;
        }

        while (true) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS, accessing the 'length' property on a null string will throw a runtime error,
            // replicating the Java NullPointerException. The '!' operator is used to bypass TypeScript's
            // compile-time null checks. In this 'goodG2B' case, 'data' is intentionally non-null before this line.
            IO.writeLine("" + data!.length);
            break;
        }
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: string | null;

        while (true) {
            /* POTENTIAL FLAW: data is null */
            data = null;
            break;
        }

        while (true) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                // In ArkTS, accessing the 'length' property on a non-null string is safe.
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            发动
            break;
        }
    }

    good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
