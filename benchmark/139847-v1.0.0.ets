import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_14.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-14.tmpl.java

/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 14 Control flow: if(IO.staticFive==5) and if(IO.staticFive!=5)
*
* */

export class CWE476_NULL_Pointer_Dereference__Integer_14 extends AbstractTestCase {

    public bad(): void {
        let data: number | null; // Equivalent to Java's Integer, allowing null
        if (IO.staticFive == 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        }
        else {
            // To ensure type compatibility and replicate the original behavior,
            // this branch is included even though it's typically dead code
            // in the original logic.
            data = null;
        }

        if (IO.staticFive == 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java null pointer dereference,
            // the non-null assertion operator (!) is used here to bypass
            // TypeScript's null safety checks at compile time.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first IO.staticFive==5 to IO.staticFive!=5 */
    private goodG2B1(): void {
        let data: number | null;
        if (IO.staticFive != 5) {
            // To ensure type compatibility and replicate the original behavior,
            // this branch is included even though it's typically dead code
            // in the original logic.
            data = null;
        }
        else {

            /* FIX: hardcode data to non-null */
            data = 5; // Equivalent to Integer.valueOf(5)

        }

        if (IO.staticFive == 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java null pointer dereference,
            // the non-null assertion operator (!) is used here to bypass
            // TypeScript's null safety checks at compile time.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number | null;
        if (IO.staticFive == 5) {
            /* FIX: hardcode data to non-null */
            data = 5; // Equivalent to Integer.valueOf(5)
        }
        else {
            // To ensure type compatibility and replicate the original behavior,
            // this branch is included even though it's typically dead code
            // in the original logic.
            data = null;
        }

        if (IO.staticFive == 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java null pointer dereference,
            // the non-null assertion operator (!) is used here to bypass
            // TypeScript's null safety checks at compile time.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second IO.staticFive==5 to IO.staticFive!=5 */
    private goodB2G1(): void {
        let data: number | null;
        if (IO.staticFive == 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        }
        else {
            // To ensure type compatibility and replicate the original behavior,
            // this branch is included even though it's typically dead code
            // in the original logic.
            data = null;
        }

        if (IO.staticFive != 5) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
        }
        else {

            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.toString());
            }
            else {
                IO.writeLine("data is null");
            }

        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: number | null;
        if (IO.staticFive == 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        }
        else {
            // To ensure type compatibility and replicate the original behavior,
            // this branch is included even though it's typically dead code
            // in the original logic.
            data = null;
        }

        if (IO.staticFive == 5) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.toString());
            }
            else {
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

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
