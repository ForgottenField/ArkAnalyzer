import { IO, AbstractTestCase } from './testcasesupport';

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_16.java
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

export class CWE476_NULL_Pointer_Dereference__Integer_16 extends AbstractTestCase {

    public bad(): void {
        let data: Number | null;

        while (true) {
            // To replicate the original logic, 'data' is set to null.
            data = null;
            break;
        }

        while (true) {
            // POTENTIAL FLAW: A null pointer dereference will occur here if 'data' is null.
            IO.writeLine("" + data.toString());
            break;
        }
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: Number | null;

        while (true) {
            // FIX: 'data' is explicitly set to a non-null value.
            data = new Number(5);
            break;
        }

        while (true) {
            // POTENTIAL FLAW: A null pointer dereference will occur here if 'data' is null.
            // In this specific goodG2B case, data is not null, so this is not a true flaw here.
            // However, the sink itself has the potential for null dereference if the source was bad.
            IO.writeLine("" + data.toString());
            break;
        }
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: Number | null;

        while (true) {
            // To replicate the original logic, 'data' is set to null.
            data = null;
            break;
        }

        while (true) {
            // FIX: Validate that 'data' is not null before use.
            if (data != null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
            break;
        }
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // The 'main' method is used for standalone execution of this test case.
    // It is not typically used when compiling all test cases as a single application,
    // which is how source code analysis tools are often tested.
    public static main(args: string[]): void {
        // The original Java code used a parent's main method.
        // We simulate this behavior for test execution.
        AbstractTestCase.mainFromParent(args);
    }
}