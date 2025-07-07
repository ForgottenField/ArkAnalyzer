import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 14 Control flow: if(IO.staticFive===5) and if(IO.staticFive!==5)
 *
 */
export class CWE476_NULL_Pointer_Dereference__String_14 extends AbstractTestCase {

    bad(): void {
        let data: string | null;
        if (IO.staticFive === 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. In ArkTS, as in Java, this code path will not be executed, but it ensures that 'data' is assigned a value before being used to prevent compilation errors. */
            data = null;
        }

        if (IO.staticFive === 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS, String has a 'length' property, not a method.
            // To replicate the original Java bug, the non-null assertion operator '!' is used
            // to bypass TypeScript's strict null checks, causing a runtime error if 'data' is null.
            IO.writeLine("" + (data!).length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first IO.staticFive==5 to IO.staticFive!=5 */
    private goodG2B1(): void {
        let data: string | null;
        if (IO.staticFive !== 5) {
            /* INCIDENTAL: CWE 561 Dead Code. In ArkTS, as in Java, this code path will not be executed, but it ensures that 'data' is assigned a value before being used to prevent compilation errors. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        }

        if (IO.staticFive === 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS, String has a 'length' property, not a method.
            // To replicate the original Java bug, the non-null assertion operator '!' is used
            // to bypass TypeScript's strict null checks, causing a runtime error if 'data' is null.
            IO.writeLine("" + (data!).length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: string | null;
        if (IO.staticFive === 5) {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. In ArkTS, as in Java, this code path will not be executed, but it ensures that 'data' is assigned a value before being used to prevent compilation errors. */
            data = null;
        }

        if (IO.staticFive === 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS, String has a 'length' property, not a method.
            // To replicate the original Java bug, the non-null assertion operator '!' is used
            // to bypass TypeScript's strict null checks, causing a runtime error if 'data' is null.
            IO.writeLine("" + (data!).length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second IO.staticFive==5 to IO.staticFive!=5 */
    private goodB2G1(): void {
        let data: string | null;
        if (IO.staticFive === 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. In ArkTS, as in Java, this code path will not be executed, but it ensures that 'data' is assigned a value before being used to prevent compilation errors. */
            data = null;
        }

        if (IO.staticFive !== 5) {
            /* INCIDENTAL: CWE 561 Dead Code. In ArkTS, this code path will not be executed. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that data is non-null */
            if (data !== null) {
                // In ArkTS, String has a 'length' property, not a method.
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: string | null;
        if (IO.staticFive === 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. In ArkTS, as in Java, this code path will not be executed, but it ensures that 'data' is assigned a value before being used to prevent compilation errors. */
            data = null;
        }

        if (IO.staticFive === 5) {
            /* FIX: validate that data is non-null */
            if (data !== null) {
                // In ArkTS, String has a 'length' property, not a method.
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    good(): void {
        this.goodG2B1();
        this.goodG2B2();
        this.goodB2G1();
        this.goodB2G2();
    }

    /* This 'main' method is provided for independent testing or binary analysis. In a full application, it's typically invoked by a test runner rather than directly. */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}