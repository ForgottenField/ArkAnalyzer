/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_05.java
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

export class CWE476_NULL_Pointer_Dereference__String_05 extends AbstractTestCase {
    /* These variables are initialized once and their values remain constant. */
    private privateTrue: boolean = true;
    private privateFalse: boolean = false;

    public bad(): void {
        let data: string | null; // data can be null to replicate original Java behavior
        if (this.privateTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. To avoid type errors or uninitialized variable issues in ArkTS, the variable is initialized even in unreachable code paths. */
            data = null;
        }

        if (this.privateTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java bug, we bypass type checking for null safety.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first privateTrue to privateFalse */
    private goodG2B1(): void {
        let data: string | null;
        if (this.privateFalse) {
            /* INCIDENTAL: CWE 561 Dead Code. To avoid type errors or uninitialized variable issues in ArkTS, the variable is initialized even in unreachable code paths. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        }

        if (this.privateTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java bug, we bypass type checking for null safety.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: string | null;
        if (this.privateTrue) {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. To avoid type errors or uninitialized variable issues in ArkTS, the variable is initialized even in unreachable code paths. */
            data = null;
        }

        if (this.privateTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java bug, we bypass type checking for null safety.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second privateTrue to privateFalse */
    private goodB2G1(): void {
        let data: string | null;

        if (this.privateTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. To avoid type errors or uninitialized variable issues in ArkTS, the variable is initialized even in unreachable code paths. */
            data = null;
        }

        if (this.privateFalse) {
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
        if (this.privateTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. To avoid type errors or uninitialized variable issues, the variable is initialized even in unreachable code paths. */
            data = null;
        }

        if (this.privateTrue) {
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
        // ClassNotFoundException, InstantiationException, IllegalAccessException are Java-specific exceptions and not directly applicable in ArkTS.
        AbstractTestCase.mainFromParent(args);
    }
}