/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_04.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-04.tmpl.java
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

export class CWE476_NULL_Pointer_Dereference__Integer_04 extends AbstractTestCase {

    /* The two variables below are declared "readonly" which helps static analysis tools
     * identify that their values are constant.
     */
    private static readonly PRIVATE_STATIC_FINAL_TRUE: boolean = true;
    private static readonly PRIVATE_STATIC_FINAL_FALSE: boolean = false;

    public bad(): void {
        let data: number | null;
        if (CWE476_NULL_Pointer_Dereference__Integer_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run. To replicate the original logic, we initialize 'data' here. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__Integer_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java behavior where `null.toString()` throws an error,
            // we use the non-null assertion operator `!` to bypass TypeScript's null safety,
            // forcing a runtime error if `data` is indeed `null`.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first PRIVATE_STATIC_FINAL_TRUE to PRIVATE_STATIC_FINAL_FALSE */
    private goodG2B1(): void {
        let data: number | null;
        if (CWE476_NULL_Pointer_Dereference__Integer_04.PRIVATE_STATIC_FINAL_FALSE) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run. To replicate the original logic, we initialize 'data' here. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = 5;
        }

        if (CWE476_NULL_Pointer_Dereference__Integer_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java behavior where `null.toString()` throws an error,
            // we use the non-null assertion operator `!` to bypass TypeScript's null safety,
            // forcing a runtime error if `data` is indeed `null`.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: number | null;
        if (CWE476_NULL_Pointer_Dereference__Integer_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* FIX: hardcode data to non-null */
            data = 5;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run. To replicate the original logic, we initialize 'data' here. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__Integer_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java behavior where `null.toString()` throws an error,
            // we use the non-null assertion operator `!` to bypass TypeScript's null safety,
            // forcing a runtime error if `data` is indeed `null`.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second PRIVATE_STATIC_FINAL_TRUE to PRIVATE_STATIC_FINAL_FALSE */
    private goodB2G1(): void {
        let data: number | null;
        if (CWE476_NULL_Pointer_Dereference__Integer_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run. To replicate the original logic, we initialize 'data' here. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__Integer_04.PRIVATE_STATIC_FINAL_FALSE) {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
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
        let data: number | null;
        if (CWE476_NULL_Pointer_Dereference__Integer_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, the code below will never run. To replicate the original logic, we initialize 'data' here. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__Integer_04.PRIVATE_STATIC_FINAL_TRUE) {
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

    /* This 'main' method is used for standalone testing or binary analysis.
     * It is not used when compiling all test cases as one application, which
     * is how source code analysis tools are typically tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
