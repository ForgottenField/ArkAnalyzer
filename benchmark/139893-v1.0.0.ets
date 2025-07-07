/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_45.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-45.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 45 Data flow: data passed as a private class member variable from one function to another in the same class
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_45 extends AbstractTestCase {
    private dataBad: string | null;
    private dataGoodG2B: string | null;
    private dataGoodB2G: string | null;

    private badSink(): void {
        let data: string | null = this.dataBad;

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // To replicate the original logic, we simulate a scenario where this value could be null and bypass TypeScript's null safety.
        IO.writeLine("" + (data as string).length);
    }

    public bad(): void {
        let data: string | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        this.dataBad = data;
        this.badSink();
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    private goodG2BSink(): void {
        let data: string | null = this.dataGoodG2B;

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // To replicate the original logic, we simulate a scenario where this value could be null and bypass TypeScript's null safety.
        IO.writeLine("" + (data as string).length);
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: string; // The type is 'string' here because it is immediately assigned a non-null value.

        /* FIX: hardcode data to non-null */
        // In ArkTS, an empty string serves a similar purpose to an empty StringBuilder in this context.
        data = "";

        this.dataGoodG2B = data;
        this.goodG2BSink();
    }

    private goodB2GSink(): void {
        let data: string | null = this.dataGoodB2G;

        /* FIX: validate that data is non-null */
        if (data !== null) {
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

        this.dataGoodB2G = data;
        this.goodB2GSink();
    }

    /*
     * This 'main' method is primarily for standalone testing of this test case.
     * It is generally not used when compiling or integrating into larger applications,
     * which is the common scenario for source code analysis.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}