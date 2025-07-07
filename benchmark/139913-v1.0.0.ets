/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_06.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-06.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 06 Control flow: if(PRIVATE_STATIC_FINAL_FIVE==5) and if(PRIVATE_STATIC_FINAL_FIVE!=5)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_06 extends AbstractTestCase {

    /* This variable is declared 'readonly' and 'static', indicating its value is constant and fixed upon initialization. */
    private static readonly PRIVATE_STATIC_FINAL_FIVE: number = 5;

    public bad(): void {
        let data: string | null;
        if (CWE476_NULL_Pointer_Dereference__String_06.PRIVATE_STATIC_FINAL_FIVE == 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This is dead code that will not execute, but is included to satisfy type checking and ensure 'data' is initialized before its use. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__String_06.PRIVATE_STATIC_FINAL_FIVE == 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS/TypeScript, 'length' is a property of String. We use the non-null assertion operator '!' to replicate the original Java NullPointerException behavior when 'data' is null.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first PRIVATE_STATIC_FINAL_FIVE==5 to PRIVATE_STATIC_FINAL_FIVE!=5 */
    private goodG2B1(): void {
        let data: string | null;
        if (CWE476_NULL_Pointer_Dereference__String_06.PRIVATE_STATIC_FINAL_FIVE != 5) {
            /* This is dead code that will not execute, but is included to satisfy type checking and ensure 'data' is initialized before its use. */
            data = null;
        } else {

            /* FIX: hardcode data to non-null */
            data = "This is not null";

        }

        if (CWE476_NULL_Pointer_Dereference__String_06.PRIVATE_STATIC_FINAL_FIVE == 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS/TypeScript, 'length' is a property of String. We use the non-null assertion operator '!' to replicate the original Java NullPointerException behavior when 'data' is null.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: string | null;
        if (CWE476_NULL_Pointer_Dereference__String_06.PRIVATE_STATIC_FINAL_FIVE == 5) {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        } else {
            /* This is dead code that will not execute, but is included to satisfy type checking and ensure 'data' is initialized before its use. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__String_06.PRIVATE_STATIC_FINAL_FIVE == 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS/TypeScript, 'length' is a property of String. We use the non-null assertion operator '!' to replicate the original Java NullPointerException behavior when 'data' is null.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second PRIVATE_STATIC_FINAL_FIVE==5 to PRIVATE_STATIC_FINAL_FIVE!=5 */
    private goodB2G1(): void {
        let data: string | null;
        if (CWE476_NULL_Pointer_Dereference__String_06.PRIVATE_STATIC_FINAL_FIVE == 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This is dead code that will not execute, but is included to satisfy type checking and ensure 'data' is initialized before its use. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__String_06.PRIVATE_STATIC_FINAL_FIVE != 5) {
            /* This is dead code that will not execute. */
            IO.writeLine("Benign, fixed string");
        } else {

            /* FIX: validate that data is non-null */
            if (data != null) {
                // In ArkTS/TypeScript, 'length' is a property of String.
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }

        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: string | null;
        if (CWE476_NULL_Pointer_Dereference__String_06.PRIVATE_STATIC_FINAL_FIVE == 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This is dead code that will not execute, but is included to satisfy type checking and ensure 'data' is initialized before its use. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__String_06.PRIVATE_STATIC_FINAL_FIVE == 5) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                // In ArkTS/TypeScript, 'length' is a property of String.
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
