/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_68b.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-68b.tmpl.java
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

export class CWE476_NULL_Pointer_Dereference__String_68b {
    badSink(): void {
        // Accessing static data from CWE476_NULL_Pointer_Dereference__String_68a.
        // This simulates data being passed as a member variable, mirroring the original logic.
        let data: string | null = CWE476_NULL_Pointer_Dereference__String_68a.data;

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        IO.writeLine("" + data.length());
    }

    /* goodG2B() - use goodsource and badsink */
    goodG2BSink(): void {
        // Accessing static data from CWE476_NULL_Pointer_Dereference__String_68a.
        // This simulates data being passed as a member variable, mirroring the original logic.
        let data: string | null = CWE476_NULL_Pointer_Dereference__String_68a.data;

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        IO.writeLine("" + data.length());
    }

    /* goodB2G() - use badsource and goodsink */
    goodB2GSink(): void {
        // Accessing static data from CWE476_NULL_Pointer_Dereference__String_68a.
        // This simulates data being passed as a member variable, mirroring the original logic.
        let data: string | null = CWE476_NULL_Pointer_Dereference__String_68a.data;

        /* FIX: validate that data is non-null */
        if (data !== null) {
            IO.writeLine("" + data.length());
        } else {
            IO.writeLine("data is null");
        }
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_68a.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-68a.tmpl.java
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

export class CWE476_NULL_Pointer_Dereference__String_68a extends AbstractTestCase {
    static data: string | null;

    bad(): void {
        /* POTENTIAL FLAW: data is null */
        CWE476_NULL_Pointer_Dereference__String_68a.data = null;

        new CWE476_NULL_Pointer_Dereference__String_68b().badSink();
    }

    good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        /* FIX: hardcode data to non-null */
        CWE476_NULL_Pointer_Dereference__String_68a.data = "This is not null";

        new CWE476_NULL_Pointer_Dereference__String_68b().goodG2BSink();
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        /* POTENTIAL FLAW: data is null */
        CWE476_NULL_Pointer_Dereference__String_68a.data = null;

        new CWE476_NULL_Pointer_Dereference__String_68b().goodB2GSink();
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
