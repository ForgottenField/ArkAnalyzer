/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 72 Data flow: data passed in an array from one method to another in different source files in the same package
 *
 * */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_72a extends AbstractTestCase {

    public bad(): void {
        let data: number[] | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        // In ArkTS, an Array can be used to simulate the behavior of a Vector for passing data.
        // We explicitly allow null elements to replicate the original logic.
        let dataArray: Array<number[] | null> = new Array<number[] | null>(5);
        dataArray[0] = data;
        dataArray[1] = data;
        dataArray[2] = data;
        // In ArkTS, class instantiation and method calls are similar to Java.
        (new CWE476_NULL_Pointer_Dereference__int_array_72b()).badSink(dataArray);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use GoodSource and BadSink */
    private goodG2B(): void {
        let data: number[] | null;

        /* FIX: hardcode data to non-null */
        data = new Array<number>(5); // In ArkTS, use Array<number> for an integer array.

        // In ArkTS, an Array can be used to simulate the behavior of a Vector for passing data.
        // We explicitly allow null elements to replicate the original logic.
        let dataArray: Array<number[] | null> = new Array<number[] | null>(5);
        dataArray[0] = data;
        dataArray[1] = data;
        dataArray[2] = data;
        // In ArkTS, class instantiation and method calls are similar to Java.
        (new CWE476_NULL_Pointer_Dereference__int_array_72b()).goodG2BSink(dataArray);
    }

    /* goodB2G() - use BadSource and GoodSink */
    private goodB2G(): void {
        let data: number[] | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        // In ArkTS, an Array can be used to simulate the behavior of a Vector for passing data.
        // We explicitly allow null elements to replicate the original logic.
        let dataArray: Array<number[] | null> = new Array<number[] | null>(5);
        dataArray[0] = data;
        dataArray[1] = data;
        dataArray[2] = data;
        // In ArkTS, class instantiation and method calls are similar to Java.
        (new CWE476_NULL_Pointer_Dereference__int_array_72b()).goodB2GSink(dataArray);
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        // In ArkTS, 'mainFromParent' would typically trigger the test execution
        // provided by the 'AbstractTestCase' parent.
        AbstractTestCase.mainFromParent(args);
    }
}

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 72 Data flow: data passed in an array from one method to another in different source files in the same package
 *
 * */

import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_72b {

    public badSink(dataArray: Array<number[] | null>): void {
        // To replicate the behavior of Java's Vector.remove(index),
        // which removes and returns the element at the specified index.
        let data: number[] | null = dataArray.splice(2, 1)[0];

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // In ArkTS, attempting to access '.length' on a 'null' value will result in a runtime error,
        // mirroring the Java NullPointerException. The '!' non-null assertion is used
        // to explicitly replicate the unchecked dereference from the original Java code.
        IO.writeLine("" + data!.length);
    }

    /* goodG2B() - use GoodSource and BadSink */
    public goodG2BSink(dataArray: Array<number[] | null>): void {
        // To replicate the behavior of Java's Vector.remove(index),
        // which removes and returns the element at the specified index.
        let data: number[] | null = dataArray.splice(2, 1)[0];

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // In ArkTS, attempting to access '.length' on a 'null' value will result in a runtime error,
        // mirroring the Java NullPointerException. The '!' non-null assertion is used
        // to explicitly replicate the unchecked dereference from the original Java code.
        IO.writeLine("" + data!.length);
    }

    /* goodB2G() - use BadSource and GoodSink */
    public goodB2GSink(dataArray: Array<number[] | null>): void {
        // To replicate the behavior of Java's Vector.remove(index),
        // which removes and returns the element at the specified index.
        let data: number[] | null = dataArray.splice(2, 1)[0];

        /* FIX: validate that data is non-null */
        if (data != null) {
            // In ArkTS, accessing '.length' on a non-null array is safe.
            IO.writeLine("" + data.length);
        } else {
            // In ArkTS, logging a message when the value is null.
            IO.writeLine("data is null");
        }
    }
}