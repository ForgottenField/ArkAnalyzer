/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_05.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-05.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 05 Control flow: if(privateTrue) and if(privateFalse)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_05 extends AbstractTestCase {
    /* These variables are not declared as 'readonly' but are not reassigned,
     * allowing a static analysis tool to identify that their reads will
     * always return their initialized values.
     */
    private privateTrue: boolean = true;
    private privateFalse: boolean = false;

    public bad(): void {
        let data: Number | null;
        if (this.privateTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This code will not execute,
             * but it ensures 'data' is initialized before its use to prevent
             * compile-time errors, replicating the original Java logic. */
            data = null;
        }

        if (this.privateTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first privateTrue to privateFalse */
    private goodG2B1(): void {
        let data: Number | null;
        if (this.privateFalse) {
            /* INCIDENTAL: CWE 561 Dead Code. This code will not execute,
             * but it ensures 'data' is initialized before its use to prevent
             * compile-time errors, replicating the original Java logic. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = new Number(5);
        }

        if (this.privateTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: Number | null;
        if (this.privateTrue) {
            /* FIX: hardcode data to non-null */
            data = new Number(5);
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This code will not execute,
             * but it ensures 'data' is initialized before its use to prevent
             * compile-time errors, replicating the original Java logic. */
            data = null;
        }

        if (this.privateTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second privateTrue to privateFalse */
    private goodB2G1(): void {
        let data: Number | null;

        if (this.privateTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This code will not execute,
             * but it ensures 'data' is initialized before its use to prevent
             * compile-time errors, replicating the original Java logic. */
            data = null;
        }

        if (this.privateFalse) {
            /* INCIDENTAL: CWE 561 Dead Code. This code will not execute. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: Number | null;
        if (this.privateTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This code will not execute,
             * but it ensures 'data' is initialized before its use to prevent
             * compile-time errors, replicating the original Java logic. */
            data = null;
        }

        if (this.privateTrue) {
            /* FIX: validate that data is non-null */
            if (data != null) {
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

    /* The 'main' method below is for standalone testing or building a binary
     * for analysis tools. It is not used when compiling all test cases
     * as a single application, which is how source code analysis tools are typically tested.
     */
    public static main(args: string[]): void {
        // Assuming mainFromParent is a static method on AbstractTestCase or a globally available function from testcasesupport
        AbstractTestCase.mainFromParent(args);
    }
}