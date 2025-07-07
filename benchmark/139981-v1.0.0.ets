import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_03 extends AbstractTestCase {
    bad(): void {
        let data: number[] | null;
        if (5 === 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. The code below will never run,
             * but ensures `data` is initialized before its use to prevent compilation errors. */
            data = null;
        }

        if (5 === 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine(`${data.length}`);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first 5===5 to 5!==5 */
    private goodG2B1(): void {
        let data: number[] | null;
        if (5 !== 5) {
            /* INCIDENTAL: CWE 561 Dead Code. The code below will never run,
             * but ensures `data` is initialized before its use to prevent compilation errors. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = new Array<number>(5);
        }

        if (5 === 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine(`${data.length}`);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number[] | null;
        if (5 === 5) {
            /* FIX: hardcode data to non-null */
            data = new Array<number>(5);
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. The code below will never run,
             * but ensures `data` is initialized before its use to prevent compilation errors. */
            data = null;
        }

        if (5 === 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine(`${data.length}`);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second 5===5 to 5!==5 */
    private goodB2G1(): void {
        let data: number[] | null;
        if (5 === 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. The code below will never run,
             * but ensures `data` is initialized before its use to prevent compilation errors. */
            data = null;
        }

        if (5 !== 5) {
            /* INCIDENTAL: CWE 561 Dead Code. The code below will never run */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine(`${data.length}`);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: number[] | null;
        if (5 === 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. The code below will never run,
             * but ensures `data` is initialized before its use to prevent compilation errors. */
            data = null;
        }

        if (5 === 5) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine(`${data.length}`);
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

    /* This is the main entry point, used for running this test case independently or
     * generating a binary for analysis tools. It is not used when compiling all test cases
     * as a single application, which is how source code analysis tools are typically evaluated.
     */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}