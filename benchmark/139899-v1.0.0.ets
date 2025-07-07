// Define a simple StringBuilder class to mimic Java's for the test case
// This class provides a 'length' method to replicate the original Java behavior,
// allowing for a null pointer dereference if the instance itself is null.
class StringBuilder {
    private _value: string;
    constructor(initialValue: string = "") {
        this._value = initialValue;
    }
    // To replicate the original logic, we simulate a method call for 'length'
    length(): number {
        return this._value.length;
    }
    append(str: string): StringBuilder {
        this._value += str;
        return this;
    }
    toString(): string {
        return this._value;
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_66a.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-66a.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource: Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 66 Data flow: data passed in an array from one method to another in different source files in the same package
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_66a extends AbstractTestCase {

    public bad(): void {
        let data: StringBuilder | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        // In ArkTS, arrays are typed, so we declare it to hold StringBuilder or null.
        let dataArray: (StringBuilder | null)[] = new Array<StringBuilder | null>(5);
        dataArray[2] = data;
        // The other part of the test case, CWE476_NULL_Pointer_Dereference__StringBuilder_66b, is conceptualized
        // as being in a separate file, similar to the original Java structure.
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_66b()).badSink(dataArray);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: StringBuilder | null;

        /* FIX: hardcode data to non-null */
        data = new StringBuilder();

        // In ArkTS, arrays are typed, so we declare it to hold StringBuilder or null.
        let dataArray: (StringBuilder | null)[] = new Array<StringBuilder | null>(5);
        dataArray[2] = data;
        // The other part of the test case, CWE476_NULL_Pointer_Dereference__StringBuilder_66b, is conceptualized
        // as being in a separate file, similar to the original Java structure.
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_66b()).goodG2BSink(dataArray);
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: StringBuilder | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        // In ArkTS, arrays are typed, so we declare it to hold StringBuilder or null.
        let dataArray: (StringBuilder | null)[] = new Array<StringBuilder | null>(5);
        dataArray[2] = data;
        // The other part of the test case, CWE476_NULL_Pointer_Dereference__StringBuilder_66b, is conceptualized
        // as being in a separate file, similar to the original Java structure.
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_66b()).goodB2GSink(dataArray);
    }

    // The main method below is for standalone testing or for building a binary
    // for analysis tools. It is not used when compiling all test cases as one
    // application, which is how source code analysis tools are typically tested.
    public static main(args: string[]): void {
        // In ArkTS, we use the static mainFromParent method from AbstractTestCase.
        AbstractTestCase.mainFromParent(args);
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_66b.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-66b.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource: Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 66 Data flow: data passed in an array from one method to another in different source files in the same package
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_66b {

    public badSink(dataArray: (StringBuilder | null)[]): void {
        // In ArkTS, we explicitly define the type to allow for null.
        let data: StringBuilder | null = dataArray[2];

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // We replicate the original method call on a potentially null object.
        // This will cause a runtime error if 'data' is null, mirroring the Java NullPointerException.
        IO.writeLine("" + data!.length());
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(dataArray: (StringBuilder | null)[]): void {
        // In ArkTS, we explicitly define the type to allow for null.
        let data: StringBuilder | null = dataArray[2];

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // We replicate the original method call on a potentially null object.
        // This will cause a runtime error if 'data' is null, mirroring the Java NullPointerException.
        IO.writeLine("" + data!.length());
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(dataArray: (StringBuilder | null)[]): void {
        // In ArkTS, we explicitly define the type to allow for null.
        let data: StringBuilder | null = dataArray[2];

        /* FIX: validate that data is non-null */
        if (data != null) {
            // We replicate the original method call on a non-null object.
            IO.writeLine("" + data.length());
        } else {
            IO.writeLine("data is null");
        }
    }
}