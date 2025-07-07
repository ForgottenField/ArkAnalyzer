import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_45.java
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

// In ArkTS, this class extends AbstractTestCase, similar to Java.
export class CWE476_NULL_Pointer_Dereference__Integer_45 extends AbstractTestCase {

    // Member variables are declared with type annotations, allowing for null values
    // to replicate Java's Integer wrapper class behavior.
    private dataBad: number | null;
    private dataGoodG2B: number | null;
    private dataGoodB2G: number | null;

    // The 'throws Throwable' clause from Java is omitted as ArkTS does not have checked exceptions.
    // Runtime errors like null dereference will still occur as expected, replicating the original bug.
    private badSink(): void {
        const data: number | null = this.dataBad;

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // In ArkTS, calling methods on a null 'number' variable will result in a runtime TypeError,
        // faithfully replicating the Java NullPointerException.
        IO.writeLine("" + data.toString());
    }

    public bad(): void {
        let data: number | null;

        /* POTENTIAL FLAW: data is null */
        // In ArkTS, 'null' is explicitly assigned to the variable to simulate the original flaw.
        data = null;

        this.dataBad = data;
        this.badSink();
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // Similar to badSink, 'throws Throwable' is omitted.
    private goodG2BSink(): void {
        const data: number | null = this.dataGoodG2B;

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // This sink also replicates the potential null dereference, similar to badSink,
        // to demonstrate the flaw even when originating from a 'good' source type.
        IO.writeLine("" + data.toString());
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: number | null;

        /* FIX: hardcode data to non-null */
        // In ArkTS, Java's Integer.valueOf(5) is directly represented by a number literal.
        data = 5;

        this.dataGoodG2B = data;
        this.goodG2BSink();
    }

    // Similar to other sinks, 'throws Throwable' is omitted.
    private goodB2GSink(): void {
        const data: number | null = this.dataGoodB2G;

        /* FIX: validate that data is non-null */
        // ArkTS uses 'if (data != null)' for null checks, similar to Java.
        if (data != null) {
            IO.writeLine("" + data.toString());
        } else {
            // This path handles the null case gracefully in ArkTS.
            IO.writeLine("data is null");
        }
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: number | null;

        /* POTENTIAL FLAW: data is null */
        // In ArkTS, 'null' is explicitly assigned to the variable.
        data = null;

        this.dataGoodB2G = data;
        this.goodB2GSink();
    }

    /*
     * This static main method is provided for testing the ArkTS code in isolation,
     * similar to how the Java main method is used for standalone test case execution.
     * It is not part of a typical ArkTS application's entry point but serves to demonstrate
     * the class behavior for analysis tools or individual debugging.
     */
    public static main(args: string[]): void {
        // Calls a static method from the parent AbstractTestCase class to execute the test logic.
        AbstractTestCase.mainFromParent(args);
    }
}