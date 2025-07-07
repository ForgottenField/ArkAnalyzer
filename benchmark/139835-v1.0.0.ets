import { IO, AbstractTestCase } from './testcasesupport';

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_02.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-02.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 02 Control flow: if(true) and if(false)
*
* */

export class CWE476_NULL_Pointer_Dereference__Integer_02 extends AbstractTestCase {

    public bad(): void {
        let data: Number | null; // Using Number | null to represent a potentially nullable boxed number.
        if (true) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This is dead code and will never be executed.
             * It's present to ensure 'data' is initialized before its use, replicating the original Java structure. */
            data = null;
        }

        if (true) {
            /* POTENTIAL FLAW: a null dereference will occur here if 'data' is null. */
            // Calling 'toString()' on a potentially null 'data' will cause a runtime error.
            IO.writeLine('' + data!.toString()); // Using '!' to explicitly allow null dereference for replication.
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first true to false */
    private goodG2B1(): void {
        let data: Number | null;
        if (false) {
            /* This is dead code and will never be executed.
             * It's present to ensure 'data' is initialized before its use, replicating the original Java structure. */
            data = null;
        } else {
            /* FIX: 'data' is explicitly set to a non-null value. */
            data = new Number(5); // Replicating Integer.valueOf(5) by creating a Number object.
        }

        if (true) {
            /* POTENTIAL FLAW: a null dereference would occur here if 'data' were null.
             * In this specific flow, 'data' is not null, so the issue is averted in the 'bad sink' section. */
            IO.writeLine('' + data!.toString()); // Using '!' to explicitly allow null dereference for replication.
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: Number | null;
        if (true) {
            /* FIX: 'data' is explicitly set to a non-null value. */
            data = new Number(5); // Replicating Integer.valueOf(5) by creating a Number object.
        }
        else {
            /* This is dead code and will never be executed.
             * It's present to ensure 'data' is initialized before its use, replicating the original Java structure. */
            data = null;
        }

        if (true) {
            /* POTENTIAL FLAW: a null dereference would occur here if 'data' were null.
             * In this specific flow, 'data' is not null, so the issue is averted in the 'bad sink' section. */
            IO.writeLine('' + data!.toString()); // Using '!' to explicitly allow null dereference for replication.
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second true to false */
    private goodB2G1(): void {
        let data: Number | null;
        if (true) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        }
        else {
            /* This is dead code and will never be executed.
             * It's present to ensure 'data' is initialized before its use, replicating the original Java structure. */
            data = null;
        }

        if (false) {
            /* This is dead code and will never be executed. */
            IO.writeLine('Benign, fixed string');
        }
        else {

            /* FIX: validate that 'data' is non-null */
            if (data != null) {
                IO.writeLine('' + data.toString());
            }
            else {
                IO.writeLine('data is null');
            }

        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: Number | null;
        if (true) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        }
        else {
            /* This is dead code and will never be executed.
             * It's present to ensure 'data' is initialized before its use, replicating the original Java structure. */
            data = null;
        }

        if (true) {
            /* FIX: validate that 'data' is non-null */
            if (data != null) {
                IO.writeLine('' + data.toString());
            }
            else {
                IO.writeLine('data is null');
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
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
