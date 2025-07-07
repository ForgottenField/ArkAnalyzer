/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_08.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-08.tmpl.ts
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

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_08 extends AbstractTestCase {
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
        let data: string | null;
        if (this.privateReturnsTrue()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensure data is initialized before the Sink to avoid compiler errors */
            data = null;
        }

        if (this.privateReturnsTrue()) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java null pointer dereference, we use the '!' non-null assertion operator here.
            // This bypasses TypeScript's null safety checks, causing a runtime error if 'data' is null, mirroring the original flaw.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first privateReturnsTrue() to privateReturnsFalse() */
    private goodG2B1(): void {
        let data: string | null;
        if (this.privateReturnsFalse()) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensure data is initialized before the Sink to avoid compiler errors */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        }

        if (this.privateReturnsTrue()) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java null pointer dereference, we use the '!' non-null assertion operator here.
            // This bypasses TypeScript's null safety checks, causing a runtime error if 'data' is null, mirroring the original flaw.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: string | null;
        if (this.privateReturnsTrue()) {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensure data is initialized before the Sink to avoid compiler errors */
            data = null;
        }

        if (this.privateReturnsTrue()) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java null pointer dereference, we use the '!' non-null assertion operator here.
            // This bypasses TypeScript's null safety checks, causing a runtime error if 'data' is null, mirroring the original flaw.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second privateReturnsTrue() to privateReturnsFalse() */
    private goodB2G1(): void {
        let data: string | null;
        if (this.privateReturnsTrue()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensure data is initialized before the Sink to avoid compiler errors */
            data = null;
        }

        if (this.privateReturnsFalse()) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: string | null;
        if (this.privateReturnsTrue()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run
             * but ensure data is initialized before the Sink to avoid compiler errors */
            data = null;
        }

        if (this.privateReturnsTrue()) {
            /* FIX: validate that data is non-null */
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

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}