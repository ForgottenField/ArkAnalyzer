import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_02 extends AbstractTestCase {
    public bad(): void {
        let data: number[] | null;
        if (true) {
            /* POTENTIAL FLAW: 'data' is assigned 'null' */
            data = null;
        } else {
            /* This code path is unreachable due to the 'if (true)' condition,
             * but it's included to replicate the original control flow and ensure
             * 'data' is initialized before the sink, avoiding compile-time errors. */
            data = null;
        }

        if (true) {
            /* POTENTIAL FLAW: A null pointer dereference will occur if 'data' is null,
             * as its 'length' property is accessed directly. */
            IO.writeLine("" + data.length);
        }
    }

    /* goodG2B1() - uses a good source and a bad sink by changing the first 'true' to 'false' */
    private goodG2B1(): void {
        let data: number[] | null;
        if (false) {
            /* This code path is unreachable due to the 'if (false)' condition,
             * but it's included to replicate the original control flow and ensure
             * 'data' is initialized before the sink, avoiding compile-time errors. */
            data = null;
        } else {
            /* FIX: Initialize 'data' to a non-null array. */
            data = new Array<number>(5);
        }

        if (true) {
            /* POTENTIAL FLAW: A null pointer dereference would occur if 'data' were null,
             * as its 'length' property is accessed directly. In this specific goodG2B1 case,
             * 'data' is not null, so this operation is safe. */
            IO.writeLine("" + data.length);
        }
    }

    /* goodG2B2() - uses a good source and a bad sink by reversing statements in the first 'if' */
    private goodG2B2(): void {
        let data: number[] | null;
        if (true) {
            /* FIX: Initialize 'data' to a non-null array. */
            data = new Array<number>(5);
        } else {
            /* This code path is unreachable due to the 'if (true)' condition,
             * but it's included to replicate the original control flow and ensure
             * 'data' is initialized before the sink, avoiding compile-time errors. */
            data = null;
        }

        if (true) {
            /* POTENTIAL FLAW: A null pointer dereference would occur if 'data' were null,
             * as its 'length' property is accessed directly. In this specific goodG2B2 case,
             * 'data' is not null, so this operation is safe. */
            IO.writeLine("" + data.length);
        }
    }

    /* goodB2G1() - uses a bad source and a good sink by changing the second 'true' to 'false' */
    private goodB2G1(): void {
        let data: number[] | null;
        if (true) {
            /* POTENTIAL FLAW: 'data' is assigned 'null' */
            data = null;
        } else {
            /* This code path is unreachable due to the 'if (true)' condition,
             * but it's included to replicate the original control flow and ensure
             * 'data' is initialized before the sink, avoiding compile-time errors. */
            data = null;
        }

        if (false) {
            /* This code path is unreachable due to the 'if (false)' condition. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: Validate that 'data' is non-null before attempting to access its 'length' property. */
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - uses a bad source and a good sink by reversing statements in the second 'if' */
    private goodB2G2(): void {
        let data: number[] | null;
        if (true) {
            /* POTENTIAL FLAW: 'data' is assigned 'null' */
            data = null;
        } else {
            /* This code path is unreachable due to the 'if (true)' condition,
             * but it's included to replicate the original control flow and ensure
             * 'data' is initialized before the sink, avoiding compile-time errors. */
            data = null;
        }

        if (true) {
            /* FIX: Validate that 'data' is non-null before attempting to access its 'length' property. */
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    public good(): void {
        this.goodG2B1();
        this.goodG2B2();
        this.goodB2G1();
        this.goodB2G2();
    }

    /* This 'main' method is typically used for standalone testing or for building a binary
     * to use in testing binary analysis tools. It is not used when compiling all the testcases
     * as one application, which is how source code analysis tools are often tested. */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
