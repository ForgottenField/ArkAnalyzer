/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_07.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-07.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 07 Control flow: if(privateFive==5) and if(privateFive!=5)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_07 extends AbstractTestCase {
    /* Although not explicitly marked as 'readonly', this variable's value remains constant throughout its lifecycle, allowing static analysis tools to infer its unchanging nature. */
    private privateFive: number = 5;

    public bad(): void {
        let data: string | null;
        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This code block is intentionally unreachable, mirroring the original logic. It ensures the variable is declared and initialized, even though this specific path will not execute. */
            data = null;
        }

        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine('' + data!.length); // Using '!' to replicate the runtime null dereference flaw.
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first privateFive==5 to privateFive!=5 */
    private goodG2B1(): void {
        let data: string | null;
        if (this.privateFive !== 5) {
            /* This code block is intentionally unreachable, mirroring the original logic. It ensures the variable is declared and initialized, even though this specific path will not execute. */
            data = null;
        } else {

            /* FIX: hardcode data to non-null */
            data = "This is not null";

        }

        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine('' + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: string | null;
        if (this.privateFive === 5) {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        } else {
            /* This code block is intentionally unreachable, mirroring the original logic. It ensures the variable is declared and initialized, even though this specific path will not execute. */
            data = null;
        }

        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine('' + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second privateFive==5 to privateFive!=5 */
    private goodB2G1(): void {
        let data: string | null;
        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This code block is intentionally unreachable, mirroring the original logic. It ensures the variable is declared and initialized, even though this specific path will not execute. */
            data = null;
        }

        if (this.privateFive !== 5) {
            /* This code block is intentionally unreachable, mirroring the original logic. */
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
        if (this.privateFive === 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This code block is intentionally unreachable, mirroring the original logic. It ensures the variable is declared and initialized, even though this specific path will not execute. */
            data = null;
        }

        if (this.privateFive === 5) {
            /* FIX: validate that data is non-null */
            if (data !== null) {
                IO.writeLine('' + data.length);
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

    /* This 'main' function is intended for standalone testing or for generating binaries for analysis tools. It is not used when compiling all test cases as part of a larger application, which is typical for source code analysis. */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}