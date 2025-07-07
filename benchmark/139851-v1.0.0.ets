/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_21.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-21.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 21 Control flow: Flow controlled by value of a private variable. All functions contained in one file.
 *
 * */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_21 extends AbstractTestCase {
    /* The variable below is used to drive control flow in the sink function */
    private badPrivate: boolean = false;

    public bad(): void {
        let data: number | null;

        // To replicate the original logic, 'data' is intentionally set to null.
        data = null;

        this.badPrivate = true;
        this.badSink(data);
    }

    private badSink(data: number | null): void {
        if (this.badPrivate) {
            // This line will cause a null pointer dereference if 'data' is null, replicating the original flaw.
            IO.writeLine("" + data.toString());
        }
    }

    /* The variables below are used to drive control flow in the sink functions. */
    private goodB2G1Private: boolean = false;
    private goodB2G2Private: boolean = false;
    private goodG2BPrivate: boolean = false;

    public good(): void {
        this.goodB2G1();
        this.goodB2G2();
        this.goodG2B();
    }

    /* goodB2G1() - use BadSource and GoodSink by setting the variable to false instead of true */
    private goodB2G1(): void {
        let data: number | null;

        // To replicate the original logic, 'data' is intentionally set to null.
        data = null;

        this.goodB2G1Private = false;
        this.goodB2G1Sink(data);
    }

    private goodB2G1Sink(data: number | null): void {
        if (this.goodB2G1Private) {
            // This code block is intentionally unreachable based on the control flow variable.
            IO.writeLine("Benign, fixed string");
        }
        else {

            // This ensures that 'data' is not null before attempting to use it.
            if (data != null) {
                IO.writeLine("" + data.toString());
            }
            else {
                IO.writeLine("data is null");
            }

        }
    }

    /* goodB2G2() - use BadSource and GoodSink by reversing the blocks in the if in the sink function */
    private goodB2G2(): void {
        let data: number | null;

        // To replicate the original logic, 'data' is intentionally set to null.
        data = null;

        this.goodB2G2Private = true;
        this.goodB2G2Sink(data);
    }

    private goodB2G2Sink(data: number | null): void {
        if (this.goodB2G2Private) {
            // This ensures that 'data' is not null before attempting to use it.
            if (data != null) {
                IO.writeLine("" + data.toString());
            }
            else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodG2B() - use GoodSource and BadSink */
    private goodG2B(): void {
        let data: number | null;

        // 'data' is intentionally set to a non-null value here.
        data = 5;

        this.goodG2BPrivate = true;
        this.goodG2BSink(data);
    }

    private goodG2BSink(data: number | null): void {
        if (this.goodG2BPrivate) {
            // This line will cause a null pointer dereference if 'data' were null, replicating the original flaw.
            IO.writeLine("" + data.toString());
        }
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
