/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_22a.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-22a.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 22 Control flow: Flow controlled by value of a public static variable. Sink functions are in a separate file from sources.
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_22a extends AbstractTestCase {
    /* The public static variable below is used to drive control flow in the sink function.
     * This static variable mimics a global variable in other programming language families. */
    static badPublicStatic: boolean = false;

    public bad(): void {
        let data: number | null = null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        CWE476_NULL_Pointer_Dereference__Integer_22a.badPublicStatic = true;
        (new CWE476_NULL_Pointer_Dereference__Integer_22b()).badSink(data);
    }

    /* The public static variables below are used to drive control flow in the sink functions.
     * These static variables mimic global variables in other programming language families. */
    static goodB2G1PublicStatic: boolean = false;
    static goodB2G2PublicStatic: boolean = false;
    static goodG2BPublicStatic: boolean = false;

    public good(): void {
        this.goodB2G1();
        this.goodB2G2();
        this.goodG2B();
    }

    /* goodB2G1() - use badsource and goodsink by setting the static variable to false instead of true */
    private goodB2G1(): void {
        let data: number | null = null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        CWE476_NULL_Pointer_Dereference__Integer_22a.goodB2G1PublicStatic = false;
        (new CWE476_NULL_Pointer_Dereference__Integer_22b()).goodB2G1Sink(data);
    }

    /* goodB2G2() - use badsource and goodsink by reversing the blocks in the if in the sink function */
    private goodB2G2(): void {
        let data: number | null = null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        CWE476_NULL_Pointer_Dereference__Integer_22a.goodB2G2PublicStatic = true;
        (new CWE476_NULL_Pointer_Dereference__Integer_22b()).goodB2G2Sink(data);
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: number | null = null;

        /* FIX: hardcode data to non-null */
        data = 5; // In ArkTS, 'number' is used for integer values.

        CWE476_NULL_Pointer_Dereference__Integer_22a.goodG2BPublicStatic = true;
        (new CWE476_NULL_Pointer_Dereference__Integer_22b()).goodG2BSink(data);
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_22b.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-22b.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 22 Control flow: Flow controlled by value of a public static variable. Sink functions are in a separate file from sources.
 *
 * */
export class CWE476_NULL_Pointer_Dereference__Integer_22b {
    public badSink(data: number | null): void {
        if (CWE476_NULL_Pointer_Dereference__Integer_22a.badPublicStatic) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // Calling toString() on a null 'data' will result in a runtime error, replicating the Java NPE.
            IO.writeLine("" + data!.toString()); // Use ! for non-null assertion to replicate the potential runtime error and suppress TS compile error
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensures data is initialized before the Sink to avoid compiler errors */
            data = null;
        }
    }

    /* goodB2G1() - use badsource and goodsink by setting the static variable to false instead of true */
    public goodB2G1Sink(data: number | null): void {
        if (CWE476_NULL_Pointer_Dereference__Integer_22a.goodB2G1PublicStatic) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensures data is initialized before the Sink to avoid compiler errors */
            data = null;
        } else {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing the blocks in the if in the sink function */
    public goodB2G2Sink(data: number | null): void {
        if (CWE476_NULL_Pointer_Dereference__Integer_22a.goodB2G2PublicStatic) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
        else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensures data is initialized before the Sink to avoid compiler errors */
            data = null;
        }
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(data: number | null): void {
        if (CWE476_NULL_Pointer_Dereference__Integer_22a.goodG2BPublicStatic) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // Calling toString() on a null 'data' will result in a runtime error, replicating the Java NPE.
            IO.writeLine("" + data!.toString()); // Use ! for non-null assertion to replicate the potential runtime error and suppress TS compile error
        }
        else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensures data is initialized before the Sink to avoid compiler errors */
            data = null;
        }
    }
}