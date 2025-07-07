/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_08.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-08.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 08 Control flow: if(privateReturnsTrue()) and if(privateReturnsFalse())
*
* */

// In ArkTS/TypeScript, there is no direct equivalent to Java packages for this context.

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_08 extends AbstractTestCase {
    /* The methods below always return the same value, so a tool
     * should be able to figure out that every call to these
     * methods will return true or return false. */
    private privateReturnsTrue(): boolean {
        return true;
    }

    private privateReturnsFalse(): boolean {
        return false;
    }

    public bad(): void {
        let data: number | null; // In ArkTS, 'number | null' is used to represent a value that can be a number or null.
        if (this.privateReturnsTrue()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, this path will not be taken.
             * It's included to match the original structure and ensure the variable is assigned. */
            data = null;
        }

        if (this.privateReturnsTrue()) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java bug, we intentionally use the non-null assertion operator (!)
            // to call toString() on a potentially null value.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first privateReturnsTrue() to privateReturnsFalse() */
    private goodG2B1(): void {
        let data: number | null;
        if (this.privateReturnsFalse()) {
            /* INCIDENTAL: CWE 561 Dead Code, this path will not be taken.
             * It's included to match the original structure and ensure the variable is assigned. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = 5; // Equivalent to Java's Integer.valueOf(5)
        }

        if (this.privateReturnsTrue()) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java bug, we intentionally use the non-null assertion operator (!)
            // to call toString() on a potentially null value.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number | null;
        if (this.privateReturnsTrue()) {
            /* FIX: hardcode data to non-null */
            data = 5; // Equivalent to Java's Integer.valueOf(5)
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, this path will not be taken.
             * It's included to match the original structure and ensure the variable is assigned. */
            data = null;
        }

        if (this.privateReturnsTrue()) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java bug, we intentionally use the non-null assertion operator (!)
            // to call toString() on a potentially null value.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second privateReturnsTrue() to privateReturnsFalse() */
    private goodB2G1(): void {
        let data: number | null;
        if (this.privateReturnsTrue()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, this path will not be taken.
             * It's included to match the original structure and ensure the variable is assigned. */
            data = null;
        }

        if (this.privateReturnsFalse()) {
            /* INCIDENTAL: CWE 561 Dead Code, this path will not be taken. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that data is non-null */
            if (data !== null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: number | null;
        if (this.privateReturnsTrue()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, this path will not be taken.
             * It's included to match the original structure and ensure the variable is assigned. */
            data = null;
        }

        if (this.privateReturnsTrue()) {
            /* FIX: validate that data is non-null */
            if (data !== null) {
                IO.writeLine("" + data.toString());
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

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}