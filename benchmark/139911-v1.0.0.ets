/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_04.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-04.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 04 Control flow: if(PRIVATE_STATIC_FINAL_TRUE) and if(PRIVATE_STATIC_FINAL_FALSE)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_04 extends AbstractTestCase {
    /* The two variables below are declared "readonly", so a tool should
     * be able to identify that reads of these will always return their
     * initialized values.
     */
    private static readonly PRIVATE_STATIC_FINAL_TRUE: boolean = true;
    private static readonly PRIVATE_STATIC_FINAL_FALSE: boolean = false;

    public bad(): void {
        let data: string | null;
        if (CWE476_NULL_Pointer_Dereference__String_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. The code below will never run,
             * but it ensures 'data' is initialized before its use to prevent compiler errors. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__String_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java behavior where a NullPointerException would occur,
            // we use the non-null assertion operator (!) to bypass TypeScript's null checks.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first PRIVATE_STATIC_FINAL_TRUE to PRIVATE_STATIC_FINAL_FALSE */
    private goodG2B1(): void {
        let data: string | null;
        if (CWE476_NULL_Pointer_Dereference__String_04.PRIVATE_STATIC_FINAL_FALSE) {
            /* INCIDENTAL: CWE 561 Dead Code. The code below will never run,
             * but it ensures 'data' is initialized before its use to prevent compiler errors. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        }

        if (CWE476_NULL_Pointer_Dereference__String_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: string | null;
        if (CWE476_NULL_Pointer_Dereference__String_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. The code below will never run,
             * but it ensures 'data' is initialized before its use to prevent compiler errors. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__String_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second PRIVATE_STATIC_FINAL_TRUE to PRIVATE_STATIC_FINAL_FALSE */
    private goodB2G1(): void {
        let data: string | null;
        if (CWE476_NULL_Pointer_Dereference__String_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. The code below will never run,
             * but it ensures 'data' is initialized before its use to prevent compiler errors. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__String_04.PRIVATE_STATIC_FINAL_FALSE) {
            /* INCIDENTAL: CWE 561 Dead Code. The code below will never run. */
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
        if (CWE476_NULL_Pointer_Dereference__String_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. The code below will never run,
             * but it ensures 'data' is initialized before its use to prevent compiler errors. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__String_04.PRIVATE_STATIC_FINAL_TRUE) {
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
