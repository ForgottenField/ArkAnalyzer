import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_54d.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-54d.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package
 *
 * */

export class CWE476_NULL_Pointer_Dereference__StringBuilder_54d {
    public badSink(data: string | null): void {
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_54e()).badSink(data);
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(data: string | null): void {
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_54e()).goodG2BSink(data);
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(data: string | null): void {
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_54e()).goodB2GSink(data);
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_54e.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-54e.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package
 *
 * */

export class CWE476_NULL_Pointer_Dereference__StringBuilder_54e {
    public badSink(data: string | null): void {

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // To replicate the original logic, we simulate a scenario where accessing the length property on a potentially null value might lead to an error.
        IO.writeLine("" + data!.length);

    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(data: string | null): void {

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // To replicate the original logic, we simulate a scenario where accessing the length property on a potentially null value might lead to an error.
        IO.writeLine("" + data!.length);

    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(data: string | null): void {

        /* FIX: validate that data is non-null */
        if (data != null)
        {
            IO.writeLine("" + data.length);
        }
        else
        {
            IO.writeLine("data is null");
        }

    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_54b.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-54b.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package
 *
 * */

export class CWE476_NULL_Pointer_Dereference__StringBuilder_54b {
    public badSink(data: string | null): void {
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_54c()).badSink(data);
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(data: string | null): void {
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_54c()).goodG2BSink(data);
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(data: string | null): void {
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_54c()).goodB2GSink(data);
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_54c.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-54c.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package
 *
 * */

export class CWE476_NULL_Pointer_Dereference__StringBuilder_54c {
    public badSink(data: string | null): void {
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_54d()).badSink(data);
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(data: string | null): void {
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_54d()).goodG2BSink(data);
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(data: string | null): void {
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_54d()).goodB2GSink(data);
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_54a.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-54a.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package
 *
 * */

export class CWE476_NULL_Pointer_Dereference__StringBuilder_54a extends AbstractTestCase {
    public bad(): void {
        let data: string | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        (new CWE476_NULL_Pointer_Dereference__StringBuilder_54b()).badSink(data);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: string | null;

        /* FIX: hardcode data to non-null */
        data = ""; // Empty string equivalent to empty StringBuilder

        (new CWE476_NULL_Pointer_Dereference__StringBuilder_54b()).goodG2BSink(data);
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: string | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        (new CWE476_NULL_Pointer_Dereference__StringBuilder_54b()).goodB2GSink(data);
    }

    /*
     * This is the main entry point for running the test case independently.
     * It's typically used for direct testing or for generating binaries for analysis tools.
     * When integrated as part of a larger test suite, this method might not be used,
     * as source code analysis tools usually process the entire application.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}