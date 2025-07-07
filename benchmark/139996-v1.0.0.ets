/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_21.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-21.tmpl.ts
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

export class CWE476_NULL_Pointer_Dereference__int_array_21 extends AbstractTestCase {
    /* The variable below is used to drive control flow in the sink function */
    private badPrivate: boolean = false;

    public bad(): void {
        let data: number[] | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        this.badPrivate = true;
        this.badSink(data);
    }

    private badSink(data: number[] | null): void {
        if (this.badPrivate) {
            /* POTENTIAL FLAW: null dereference will occur if data is null when accessing its length */
            IO.writeLine("" + data!.length); // Using '!' to replicate the original Java behavior without null checks
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
        let data: number[] | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        this.goodB2G1Private = false;
        this.goodB2G1Sink(data);
    }

    private goodB2G1Sink(data: number[] | null): void {
        if (this.goodB2G1Private) {
            /* INCIDENTAL: This code block will never execute due to the control variable being false. */
            IO.writeLine("Benign, fixed string");
        } else {

            /* FIX: validate that data is non-null before use */
            if (data !== null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }

        }
    }

    /* goodB2G2() - use BadSource and GoodSink by reversing the blocks in the if in the sink function */
    private goodB2G2(): void {
        let data: number[] | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        this.goodB2G2Private = true;
        this.goodB2G2Sink(data);
    }

    private goodB2G2Sink(data: number[] | null): void {
        if (this.goodB2G2Private) {
            /* FIX: validate that data is non-null before use */
            if (data !== null) {
                IO.writeLine("" + data.length);
            }
            else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodG2B() - use GoodSource and BadSink */
    private goodG2B(): void {
        let data: number[] | null;

        /* FIX: hardcode data to a non-null array */
        data = new Array<number>(5);

        this.goodG2BPrivate = true;
        this.goodG2BSink(data);
    }

    private goodG2BSink(data: number[] | null): void {
        if (this.goodG2BPrivate) {
            /* POTENTIAL FLAW: null dereference will occur if data is null when accessing its length */
            IO.writeLine("" + data!.length); // Using '!' to replicate the original Java behavior without null checks
        }
    }

    /* This is the main function. It is used when building this testcase
     * on its own for testing or for building a binary to use in testing
     * binary analysis tools. It is not used when compiling all the testcases
     * as one application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
