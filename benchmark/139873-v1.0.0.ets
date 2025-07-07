import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// To replicate the original logic, we create a simple class that can be null
// and has a 'length' method, similar to Java's StringBuilder.
class StringBuilder {
    private _value: string = "";

    constructor(initialValue: string = "") {
        this._value = initialValue;
    }

    // Simulates Java's StringBuilder.length() method
    length(): number {
        return this._value.length;
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_03.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-03.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 03 Control flow: if(5==5) and if(5!=5)
*
* */
export class CWE476_NULL_Pointer_Dereference__StringBuilder_03 extends AbstractTestCase {

    bad(): void {
        let data: StringBuilder | null;
        if (5 == 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, this code will never execute.
             * It's present to ensure the variable is assigned a value,
             * clarifying its state before potential use. */
            data = null;
        }

        if (5 == 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null.
             * In ArkTS (TypeScript), this would typically cause a runtime error
             * if not guarded by an optional chaining operator or a null check.
             * To replicate the original bug, we bypass type checks by asserting
             * 'data' is not null, which will lead to a runtime error when 'data' is null. */
            IO.writeLine("" + (data as StringBuilder).length());
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first 5==5 to 5!=5 */
    private goodG2B1(): void {
        let data: StringBuilder | null;
        if (5 != 5) {
            /* INCIDENTAL: CWE 561 Dead Code, this code will never execute.
             * It's present to ensure the variable is assigned a value,
             * clarifying its state before potential use. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = new StringBuilder();
        }

        if (5 == 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null.
             * In ArkTS (TypeScript), this would typically cause a runtime error
             * if not guarded by an optional chaining operator or a null check.
             * To replicate the original bug, we bypass type checks by asserting
             * 'data' is not null, which will lead to a runtime error when 'data' is null. */
            IO.writeLine("" + (data as StringBuilder).length());
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: StringBuilder | null;
        if (5 == 5) {
            /* FIX: hardcode data to non-null */
            data = new StringBuilder();
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, this code will never execute.
             * It's present to ensure the variable is assigned a value,
             * clarifying its state before potential use. */
            data = null;
        }

        if (5 == 5) {
            /* POTENTIAL FLAW: null dereference will occur if data is null.
             * In ArkTS (TypeScript), this would typically cause a runtime error
             * if not guarded by an optional chaining operator or a null check.
             * To replicate the original bug, we bypass type checks by asserting
             * 'data' is not null, which will lead to a runtime error when 'data' is null. */
            IO.writeLine("" + (data as StringBuilder).length());
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second 5==5 to 5!=5 */
    private goodB2G1(): void {
        let data: StringBuilder | null;
        if (5 == 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, this code will never execute.
             * It's present to ensure the variable is assigned a value,
             * clarifying its state before potential use. */
            data = null;
        }

        if (5 != 5) {
            /* INCIDENTAL: CWE 561 Dead Code, this code will never execute. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: StringBuilder | null;
        if (5 == 5) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code, this code will never execute.
             * It's present to ensure the variable is assigned a value,
             * clarifying its state before potential use. */
            data = null;
        }

        if (5 == 5) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length());
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

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
