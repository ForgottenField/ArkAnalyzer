class StringBuilder {
    private _value: string;

    constructor(initialValue: string = '') {
        this._value = initialValue;
    }

    append(str: string): StringBuilder {
        this._value += str;
        return this;
    }

    length(): number {
        return this._value.length;
    }

    toString(): string {
        return this._value;
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_22a.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-22a.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 22 Control flow: Flow controlled by value of a public static variable. Sink functions are in a separate file from sources.
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_22a extends AbstractTestCase {
    // This public static variable controls the flow in the sink function,
    // similar to a global flag in some programming paradigms.
    static badPublicStatic: boolean = false;

    bad(): void {
        // To replicate the original logic, we simulate a scenario where this value could be null.
        let data: StringBuilder | null = null;

        /* POTENTIAL FLAW: data is null */
        data = null; // Explicitly setting to null for the flaw demonstration.

        CWE476_NULL_Pointer_Dereference__StringBuilder_22a.badPublicStatic = true;
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_22b()).badSink(data);
    }

    // These public static variables control the flow in the sink functions,
    // similar to global flags.
    static goodB2G1PublicStatic: boolean = false;
    static goodB2G2PublicStatic: boolean = false;
    static goodG2BPublicStatic: boolean = false;

    good(): void {
        this.goodB2G1();
        this.goodB2G2();
        this.goodG2B();
    }

    /* goodB2G1() - uses a bad source and a good sink by setting the static variable to false instead of true */
    private goodB2G1(): void {
        // To replicate the original logic, we simulate a scenario where this value could be null.
        let data: StringBuilder | null = null;

        /* POTENTIAL FLAW: data is null */
        data = null; // Explicitly setting to null for the flaw demonstration.

        CWE476_NULL_Pointer_Dereference__StringBuilder_22a.goodB2G1PublicStatic = false;
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_22b()).goodB2G1Sink(data);
    }

    /* goodB2G2() - uses a bad source and a good sink by reversing the blocks in the if statement in the sink function */
    private goodB2G2(): void {
        // To replicate the original logic, we simulate a scenario where this value could be null.
        let data: StringBuilder | null = null;

        /* POTENTIAL FLAW: data is null */
        data = null; // Explicitly setting to null for the flaw demonstration.

        CWE476_NULL_Pointer_Dereference__StringBuilder_22a.goodB2G2PublicStatic = true;
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_22b()).goodB2G2Sink(data);
    }

    /* goodG2B() - uses a good source and a bad sink */
    private goodG2B(): void {
        let data: StringBuilder | null = null;

        /* FIX: hardcode data to a non-null value */
        data = new StringBuilder(); // Initializes data to a non-null StringBuilder instance.

        CWE476_NULL_Pointer_Dereference__StringBuilder_22a.goodG2BPublicStatic = true;
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_22b()).goodG2BSink(data);
    }

    /* Below is the main() function. It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_22b.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-22b.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 22 Control flow: Flow controlled by value of a public static variable. Sink functions are in a separate file from sources.
 *
 * */

export class CWE476_NULL_Pointer_Dereference__StringBuilder_22b {
    badSink(data: StringBuilder | null): void {
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_22a.badPublicStatic) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS/TypeScript, accessing a property or method on 'null' will throw a runtime error.
            IO.writeLine("" + data!.length()); // Using '!' for non-null assertion to replicate the Java NPE.
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This code will never run under the defined conditions.
             * It's included to ensure 'data' is assigned a value for compiler checks in the original Java code. */
            data = null;
        }
    }

    /* goodB2G1() - uses a bad source and a good sink by setting the static variable to false instead of true */
    goodB2G1Sink(data: StringBuilder | null): void {
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_22a.goodB2G1PublicStatic) {
            /* INCIDENTAL: CWE 561 Dead Code. This code will never run under the defined conditions.
             * It's included to ensure 'data' is assigned a value for compiler checks in the original Java code. */
            data = null;
        } else {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - uses a bad source and a good sink by reversing the blocks in the if statement in the sink function */
    goodB2G2Sink(data: StringBuilder | null): void {
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_22a.goodB2G2PublicStatic) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length());
            } else {
                IO.writeLine("data is null");
            }
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This code will never run under the defined conditions.
             * It's included to ensure 'data' is assigned a value for compiler checks in the original Java code. */
            data = null;
        }
    }

    /* goodG2B() - uses a good source and a bad sink */
    goodG2BSink(data: StringBuilder | null): void {
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_22a.goodG2BPublicStatic) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // In ArkTS/TypeScript, accessing a property or method on 'null' will throw a runtime error.
            IO.writeLine("" + data!.length()); // Using '!' for non-null assertion to replicate the Java NPE.
        } else {
            /* INCIDENTAL: CWE 561 Dead Code. This code will never run under the defined conditions.
             * It's included to ensure 'data' is assigned a value for compiler checks in the original Java code. */
            data = null;
        }
    }
}