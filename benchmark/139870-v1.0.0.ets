/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_81_base.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81_base.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:   Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 * GoodSink: add check to prevent possibility of null dereference
 * BadSink : possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export abstract class CWE476_NULL_Pointer_Dereference__Integer_81_base {
    public abstract action(data: Number | null): void; // ArkTS methods do not have checked exceptions like Java's 'throws Throwable'
}

---

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_81_bad.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81_bad.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:   Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 * GoodSink: add check to prevent possibility of null dereference
 * BadSink : possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 *
 * */

export class CWE476_NULL_Pointer_Dereference__Integer_81_bad extends CWE476_NULL_Pointer_Dereference__Integer_81_base {
    public action(data: Number | null): void {
        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // In ArkTS/TypeScript, accessing properties/methods of a 'null' or 'undefined' value will also result in a runtime error.
        // The non-null assertion operator '!' is used here to allow compilation while replicating the Java runtime error for a null 'data'.
        IO.writeLine("" + data!.toString());
    }
}

---

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_81a.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81a.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:   Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 * GoodSink: add check to prevent possibility of null dereference
 * BadSink : possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 *
 * */

import { AbstractTestCase } from './testcasesupport'; // Added import for AbstractTestCase

export class CWE476_NULL_Pointer_Dereference__Integer_81a extends AbstractTestCase {
    public bad(): void { // ArkTS methods do not have checked exceptions like Java's 'throws Throwable'
        let data: Number | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        let baseObject: CWE476_NULL_Pointer_Dereference__Integer_81_base = new CWE476_NULL_Pointer_Dereference__Integer_81_bad();
        baseObject.action(data);
    }

    public good(): void { // ArkTS methods do not have checked exceptions like Java's 'throws Throwable'
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use GoodSource and BadSink */
    private goodG2B(): void { // ArkTS methods do not have checked exceptions like Java's 'throws Throwable'
        let data: Number | null;

        /* FIX: Assigning a numeric value, ensuring data is non-null */
        data = 5; // In ArkTS/TypeScript, 'Integer.valueOf(5)' is directly represented as a number.

        let baseObject: CWE476_NULL_Pointer_Dereference__Integer_81_base = new CWE476_NULL_Pointer_Dereference__Integer_81_goodG2B();
        baseObject.action(data);
    }

    /* goodB2G() - use BadSource and GoodSink */
    private goodB2G(): void { // ArkTS methods do not have checked exceptions like Java's 'throws Throwable'
        let data: Number | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        let baseObject: CWE476_NULL_Pointer_Dereference__Integer_81_base = new CWE476_NULL_Pointer_Dereference__Integer_81_goodB2G();
        baseObject.action(data);
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        // ArkTS/TypeScript does not have checked exceptions like Java's 'throws ClassNotFoundException, InstantiationException, IllegalAccessException'
        AbstractTestCase.mainFromParent(args);
    }
}

---

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_81_goodB2G.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81_goodB2G.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:   Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 * GoodSink: add check to prevent possibility of null dereference
 * BadSink : possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 *
 * */

export class CWE476_NULL_Pointer_Dereference__Integer_81_goodB2G extends CWE476_NULL_Pointer_Dereference__Integer_81_base {
    public action(data: Number | null): void {
        /* FIX: validate that data is non-null */
        if (data != null) {
            IO.writeLine("" + data.toString());
        } else {
            IO.writeLine("data is null");
        }
    }
}

---

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_81_goodG2B.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81_goodG2B.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:   Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 * GoodSink: add check to prevent possibility of null dereference
 * BadSink : possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 *
 * */

export class CWE476_NULL_Pointer_Dereference__Integer_81_goodG2B extends CWE476_NULL_Pointer_Dereference__Integer_81_base {
    public action(data: Number | null): void {
        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // In ArkTS/TypeScript, accessing properties/methods of a 'null' or 'undefined' value will also result in a runtime error.
        // The non-null assertion operator '!' is used here to allow compilation while replicating the Java runtime error for a null 'data'.
        IO.writeLine("" + data!.toString());
    }
}