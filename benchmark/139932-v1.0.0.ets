import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_52c.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-52c.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 52 Data flow: data passed as an argument from one method to another to another in three different classes in the same package
 *
 * */

export class CWE476_NULL_Pointer_Dereference__String_52c {
    public badSink(data: string | null): void {

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // To replicate the original logic where data is expected to be a string, we use the non-null assertion operator.
        IO.writeLine("" + data!.length);

    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(data: string | null): void {

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // To replicate the original logic where data is expected to be a string, we use the non-null assertion operator.
        IO.writeLine("" + data!.length);

    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(data: string | null): void {

        /* FIX: validate that data is non-null */
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }

    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_52b.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-52b.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 52 Data flow: data passed as an argument from one method to another to another in three different classes in the same package
 *
 * */

export class CWE476_NULL_Pointer_Dereference__String_52b {
    public badSink(data: string | null): void {
        new CWE476_NULL_Pointer_Dereference__String_52c().badSink(data);
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(data: string | null): void {
        new CWE476_NULL_Pointer_Dereference__String_52c().goodG2BSink(data);
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(data: string | null): void {
        new CWE476_NULL_Pointer_Dereference__String_52c().goodB2GSink(data);
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_52a.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-52a.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 52 Data flow: data passed as an argument from one method to another to another in three different classes in the same package
 *
 * */

export class CWE476_NULL_Pointer_Dereference__String_52a extends AbstractTestCase {
    public bad(): void {
        let data: string | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        new CWE476_NULL_Pointer_Dereference__String_52b().badSink(data);
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

        new CWE476_NULL_Pointer_Dereference__String_52b().goodG2BSink(data);
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: string | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        new CWE476_NULL_Pointer_Dereference__String_52b().goodB2GSink(data);
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    // The main method is omitted as it's part of the Java test harness and not directly relevant to the ArkTS vulnerability replication.
}