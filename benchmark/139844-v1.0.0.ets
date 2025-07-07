/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_11.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-11.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 11 Control flow: if(IO.staticReturnsTrue()) and if(IO.staticReturnsFalse())
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_11 extends AbstractTestCase {
    bad(): void {
        let data: number | null;
        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: 'data' is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This code path will not be executed, but is included to ensure 'data' is initialized before its use to avoid compilation errors. */
            data = null;
        }

        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null. */
            // To replicate the original Java bug, we use the non-null assertion operator '!'
            // This tells the TypeScript compiler that 'data' will not be null at runtime,
            // which allows the compilation to pass but will result in a runtime error if 'data' is indeed null.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first IO.staticReturnsTrue() to IO.staticReturnsFalse() */
    private goodG2B1(): void {
        let data: number | null;
        if (IO.staticReturnsFalse()) {
            /* INCIDENTAL: CWE 561 Dead Code. This code path will not be executed, but is included to ensure 'data' is initialized before its use to avoid compilation errors. */
            data = null;
        } else {
            /* FIX: Assign a non-null value to 'data'. */
            data = 5;
        }

        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null. */
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number | null;

        if (IO.staticReturnsTrue()) {
            /* FIX: Assign a non-null value to 'data'. */
            data = 5;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This code path will not be executed, but is included to ensure 'data' is initialized before its use to avoid compilation errors. */
            data = null;
        }

        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null. */
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second IO.staticReturnsTrue() to IO.staticReturnsFalse() */
    private goodB2G1(): void {
        let data: number | null;
        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: 'data' is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This code path will not be executed, but is included to ensure 'data' is initialized before its use to avoid compilation errors. */
            data = null;
        }

        if (IO.staticReturnsFalse()) {
            /* INCIDENTAL: CWE 561 Dead Code. This code path will not be executed. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: Validate that 'data' is not null before use. */
            if (data != null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: number | null;
        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: 'data' is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This code path will not be executed, but is included to ensure 'data' is initialized before its use to avoid compilation errors. */
            data = null;
        }

        if (IO.staticReturnsTrue()) {
            /* FIX: Validate that 'data' is not null before use. */
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

    /* This 'main' function is included for standalone testing or for building a test binary. In typical ArkTS application builds, it may not be directly used as the primary entry point, as source code analysis tools test against the entire application. */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}