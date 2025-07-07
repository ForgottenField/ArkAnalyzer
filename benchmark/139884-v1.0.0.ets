import { IO, AbstractTestCase } from './testcasesupport';

// A custom class to simulate Java's StringBuilder and its length() method.
// This helps replicate the original method call type of null pointer dereference.
class MyStringBuilder {
    private value: string = '';
    constructor(initialValue: string = '') {
        this.value = initialValue;
    }
    length(): number {
        return this.value.length;
    }
    append(str: string): void {
        this.value += str;
    }
    toString(): string {
        return this.value;
    }
}

export class CWE476_NULL_Pointer_Dereference__StringBuilder_14 extends AbstractTestCase {

    bad(): void {
        let data: MyStringBuilder | null;

        if (IO.staticFive === 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This section of code will not execute under normal conditions due to the control flow,
             * but is included to replicate the original structure and ensure variable initialization. */
            data = null;
        }

        if (IO.staticFive === 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null.
             * The '!' operator is used here to replicate the original Java behavior where
             * a null pointer dereference would lead to a runtime error. */
            IO.writeLine("" + data!.length());
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first IO.staticFive===5 to IO.staticFive!==5 */
    private goodG2B1(): void {
        let data: MyStringBuilder | null;
        if (IO.staticFive !== 5) {
            /* This section of code will not execute under normal conditions due to the control flow,
             * but is included to replicate the original structure and ensure variable initialization. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = new MyStringBuilder();
        }

        if (IO.staticFive === 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null.
             * The '!' operator is used here to replicate the original Java behavior where
             * a null pointer dereference would lead to a runtime error. */
            IO.writeLine("" + data!.length());
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: MyStringBuilder | null;
        if (IO.staticFive === 5) {
            /* FIX: hardcode data to non-null */
            data = new MyStringBuilder();
        } else {
            /* This section of code will not execute under normal conditions due to the control flow,
             * but is included to replicate the original structure and ensure variable initialization. */
            data = null;
        }

        if (IO.staticFive === 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null.
             * The '!' operator is used here to replicate the original Java behavior where
             * a null pointer dereference would lead to a runtime error. */
            IO.writeLine("" + data!.length());
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second IO.staticFive===5 to IO.staticFive!==5 */
    private goodB2G1(): void {
        let data: MyStringBuilder | null;
        if (IO.staticFive === 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This section of code will not execute under normal conditions due to the control flow,
             * but is included to replicate the original structure and ensure variable initialization. */
             data = null;
        }

        if (IO.staticFive !== 5) {
            /* This section of code will not execute under normal conditions due to the control flow. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that data is non-null */
            if (data !== null) {
                IO.writeLine("" + data.length());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: MyStringBuilder | null;
        if (IO.staticFive === 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This section of code will not execute under normal conditions due to the control flow,
             * but is included to replicate the original structure and ensure variable initialization. */
            data = null;
        }

        if (IO.staticFive === 5) {
            /* FIX: validate that data is non-null */
            if (data !== null) {
                IO.writeLine("" + data.length());
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

    /* The main function is not typically used in ArkTS application entry points.
     * It is included here to mirror the original structure for testing purposes,
     * such as when building this test case in isolation or for analysis.
     * This approach is often used in security testing frameworks.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}