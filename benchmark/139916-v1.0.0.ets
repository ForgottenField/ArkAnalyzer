/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_09.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-09.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 09 Control flow: if(IO.STATIC_FINAL_TRUE) and if(IO.STATIC_FINAL_FALSE)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_09 extends AbstractTestCase {
    public bad(): void {
        let data: string | null;
        if (IO.STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This code path will not be executed, but is included to replicate the original control flow and ensure 'data' is initialized. */
            data = null;
        }

        if (IO.STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine('' + data!.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first IO.STATIC_FINAL_TRUE to IO.STATIC_FINAL_FALSE */
    private goodG2B1(): void {
        let data: string | null;
        if (IO.STATIC_FINAL_FALSE) {
            /* This code path will not be executed, but is included to replicate the original control flow and ensure 'data' is initialized. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = 'This is not null';
        }

        if (IO.STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine('' + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: string | null;
        if (IO.STATIC_FINAL_TRUE) {
            /* FIX: hardcode data to non-null */
            data = 'This is not null';
        } else {
            /* This code path will not be executed, but is included to replicate the original control flow and ensure 'data' is initialized. */
            data = null;
        }

        if (IO.STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine('' + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second IO.STATIC_FINAL_TRUE to IO.STATIC_FINAL_FALSE */
    private goodB2G1(): void {
        let data: string | null;
        if (IO.STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This code path will not be executed, but is included to replicate the original control flow and ensure 'data' is initialized. */
            data = null;
        }

        if (IO.STATIC_FINAL_FALSE) {
            /* This code path will not be executed. */
            IO.writeLine('Benign, fixed string');
        } else {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine('' + data.length);
            } else {
                IO.writeLine('data is null');
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if */
    private goodB2G2(): void {
        let data: string | null;
        if (IO.STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This code path will not be executed, but is included to replicate the original control flow and ensure 'data' is initialized. */
            data = null;
        }

        if (IO.STATIC_FINAL_TRUE) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine('' + data.length);
            } else {
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

    /* This is the main entry point, used for standalone testing. It is not used when compiling all test cases as a single application, which is how static analysis tools typically test. */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
