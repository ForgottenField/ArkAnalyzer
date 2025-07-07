class StringBuilder {
    private _value: string = '';

    constructor(initialValue: string = '') {
        this._value = initialValue;
    }

    public append(str: string): StringBuilder {
        this._value += str;
        return this;
    }

    public toString(): string {
        return this._value;
    }

    // Replicates the length() method from Java's StringBuilder
    public length(): number {
        return this._value.length;
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
* Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_11.java
* Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
* Template File: sources-sinks-11.tmpl.java
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

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_11 extends AbstractTestCase {
    public bad(): void {
        let data: StringBuilder | null;
        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This block will never execute due to the condition,
             * but is included to mirror the original structure and ensure data is assigned
             * before its potential use, preventing a TypeScript compilation error. */
            data = null;
        }

        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: A null pointer dereference will occur if data is null.
             * The '!' non-null assertion is used here to replicate the original Java behavior
             * where the compiler allows the dereference, but it crashes at runtime if null. */
            IO.writeLine("" + data!.length());
        }
    }

    /* goodG2B1() - uses a good source and a bad sink by changing the first IO.staticReturnsTrue() to IO.staticReturnsFalse() */
    private goodG2B1(): void {
        let data: StringBuilder | null;
        if (IO.staticReturnsFalse()) {
            /* INCIDENTAL: CWE 561 Dead Code. This block will never execute due to the condition,
             * but is included to mirror the original structure and ensure data is assigned
             * before its potential use, preventing a TypeScript compilation error. */
            data = null;
        } else {
            /* FIX: hardcode data to a non-null value */
            data = new StringBuilder();
        }

        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: A null pointer dereference will occur if data is null.
             * The '!' non-null assertion is used here to replicate the original Java behavior
             * where the compiler allows the dereference, but it crashes at runtime if null. */
            IO.writeLine("" + data!.length());
        }
    }

    /* goodG2B2() - uses a good source and a bad sink by reversing statements in the first if block */
    private goodG2B2(): void {
        let data: StringBuilder | null;

        if (IO.staticReturnsTrue()) {
            /* FIX: hardcode data to a non-null value */
            data = new StringBuilder();
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This block will never execute due to the condition,
             * but is included to mirror the original structure and ensure data is assigned
             * before its potential use, preventing a TypeScript compilation error. */
            data = null;
        }

        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: A null pointer dereference will occur if data is null.
             * The '!' non-null assertion is used here to replicate the original Java behavior
             * where the compiler allows the dereference, but it crashes at runtime if null. */
            IO.writeLine("" + data!.length());
        }
    }

    /* goodB2G1() - uses a bad source and a good sink by changing the second IO.staticReturnsTrue() to IO.staticReturnsFalse() */
    private goodB2G1(): void {
        let data: StringBuilder | null;
        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This block will never execute due to the condition,
             * but is included to mirror the original structure and ensure data is assigned
             * before its potential use, preventing a TypeScript compilation error. */
            data = null;
        }

        if (IO.staticReturnsFalse()) {
            /* INCIDENTAL: CWE 561 Dead Code. This block will never execute due to the condition. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that data is non-null before dereferencing */
            if (data != null) {
                IO.writeLine("" + data.length());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - uses a bad source and a good sink by reversing statements in the second if block */
    private goodB2G2(): void {
        let data: StringBuilder | null;
        if (IO.staticReturnsTrue()) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This block will never execute due to the condition,
             * but is included to mirror the original structure and ensure data is assigned
             * before its potential use, preventing a TypeScript compilation error. */
            data = null;
        }

        if (IO.staticReturnsTrue()) {
            /* FIX: validate that data is non-null before dereferencing */
            if (data != null) {
                IO.writeLine("" + data.length());
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

    /* Below is the main() method. It is only used when building this testcase
     * on its own for testing or for building a binary to use in testing
     * binary analysis tools. It is not used when compiling all the testcases
     * as one application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        // In ArkTS/TypeScript, we typically don't have a direct equivalent for
        // InstantiationException or IllegalAccessException from Java's reflection.
        // The mainFromParent method likely handles the test case execution setup.
        AbstractTestCase.mainFromParent(args);
    }
}
