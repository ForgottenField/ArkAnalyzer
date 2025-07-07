/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_02.java
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

// Assuming testcasesupport provides IO and AbstractTestCase
import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_02 extends AbstractTestCase {

    bad(): void {
        let data: string | null;
        if (true) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, this block will never execute,
             * but it's included to ensure 'data' is initialized before its use, mirroring the original Java structure. */
            data = null;
        }

        if (true) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS/TypeScript, 'length' is a property, not a method.
            // Using '!' to assert non-null type for compilation, but at runtime, if 'data' is null,
            // this will still result in a runtime error, replicating the original Java flaw.
            IO.writeLine('' + data!.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first true to false */
    private goodG2B1(): void {
        let data: string | null;
        if (false) {
            /* INCIDENTAL: CWE 561 Dead Code, this block will never execute,
             * but it's included to ensure 'data' is initialized before its use, mirroring the original Java structure. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        }

        if (true) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // Replicating the flaw: 'data' is expected to be non-null here due to the 'good' source,
            // but the sink itself is still 'bad' (does not check for null).
            IO.writeLine('' + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: string | null;
        if (true) {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, this block will never execute,
             * but it's included to ensure 'data' is initialized before its use, mirroring the original Java structure. */
            data = null;
        }

        if (true) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // Replicating the flaw: 'data' is expected to be non-null here due to the 'good' source,
            // but the sink itself is still 'bad' (does not check for null).
            IO.writeLine('' + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second true to false */
    private goodB2G1(): void {
        let data: string | null;
        if (true) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, this block will never execute,
             * but it's included to ensure 'data' is initialized before its use, mirroring the original Java structure. */
            data = null;
        }

        if (false) {
            /* INCIDENTAL: CWE 561 Dead Code, this block will never execute. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that data is non-null */
            if (data !== null) {
                IO.writeLine('' + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: string | null;
        if (true) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, this block will never execute,
             * but it's included to ensure 'data' is initialized before its use, mirroring the original Java structure. */
            data = null;
        }

        if (true) {
            /* FIX: validate that data is non-null */
            if (data !== null) {
                IO.writeLine('' + data.length);
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

    /* The following 'main' method is used for standalone execution of this test case,
     * for example, during local testing or binary analysis. It is typically not invoked
     * when all test cases are compiled and run as a single application, which is how
     * static analysis tools are usually employed.
     */
    static main(args: string[]): void {
        // In ArkTS/TypeScript, static methods of the base class can be called directly
        // via the class name or 'super' (in specific contexts) if inherited.
        // We assume mainFromParent is a static method available via AbstractTestCase.
        AbstractTestCase.mainFromParent(args);
    }
}