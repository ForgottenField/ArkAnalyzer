/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 72 Data flow: data passed in an Array from one method to another within the same module
 *
 * */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_72b {
    public badSink(dataVector: Array<number | null>) {
        // In ArkTS/TypeScript, checked exceptions are not used. The runtime behavior for a null dereference
        // will occur naturally if 'data' is null.
        let data: number | null = dataVector.splice(2, 1)[0];

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // Calling toString() on a potentially null 'data' variable.
        // This line will cause a runtime error if 'data' is null.
        IO.writeLine("" + data!.toString());
    }

    /* goodG2B() - use GoodSource and BadSink */
    public goodG2BSink(dataVector: Array<number | null>) {
        // In ArkTS/TypeScript, checked exceptions are not used. The runtime behavior for a null dereference
        // will occur naturally if 'data' is null.
        let data: number | null = dataVector.splice(2, 1)[0];

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // Calling toString() on a potentially null 'data' variable.
        // This line will cause a runtime error if 'data' is null.
        IO.writeLine("" + data!.toString());
    }

    /* goodB2G() - use BadSource and GoodSink */
    public goodB2GSink(dataVector: Array<number | null>) {
        // In ArkTS/TypeScript, checked exceptions are not used.
        let data: number | null = dataVector.splice(2, 1)[0];

        /* FIX: validate that data is non-null */
        // Checking if 'data' is not null before using it to prevent a runtime error.
        if (data != null) {
            IO.writeLine("" + data.toString());
        } else {
            IO.writeLine("data is null");
        }
    }
}

export class CWE476_NULL_Pointer_Dereference__Integer_72a extends AbstractTestCase {
    public bad() {
        // In ArkTS/TypeScript, checked exceptions are not used. The runtime behavior for a null dereference
        // will occur naturally if 'data' is null.
        let data: number | null;

        /* POTENTIAL FLAW: data is null */
        // Setting 'data' explicitly to null to simulate the vulnerable condition.
        data = null;

        // In ArkTS, Array<T> is used similarly to Java's Vector for this context. We create an empty array.
        let dataVector: Array<number | null> = new Array<number | null>();
        // To replicate the original logic, elements are added sequentially.
        dataVector.push(data);
        dataVector.push(data);
        dataVector.push(data);

        // Calling the badSink method of CWE476_NULL_Pointer_Dereference__Integer_72b.
        (new CWE476_NULL_Pointer_Dereference__Integer_72b()).badSink(dataVector);
    }

    public good() {
        // In ArkTS/TypeScript, checked exceptions are not used.
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use GoodSource and BadSink */
    private goodG2B() {
        // In ArkTS/TypeScript, checked exceptions are not used.
        let data: number;

        /* FIX: hardcode data to non-null */
        // Setting 'data' to a non-null number, equivalent to Integer.valueOf(5) in Java.
        data = 5;

        // Creating and populating the array with non-null data.
        let dataVector: Array<number | null> = new Array<number | null>();
        dataVector.push(data);
        dataVector.push(data);
        dataVector.push(data);

        // Calling the goodG2BSink method.
        (new CWE476_NULL_Pointer_Dereference__Integer_72b()).goodG2BSink(dataVector);
    }

    /* goodB2G() - use BadSource and GoodSink */
    private goodB2G() {
        // In ArkTS/TypeScript, checked exceptions are not used.
        let data: number | null;

        /* POTENTIAL FLAW: data is null */
        // Setting 'data' explicitly to null to simulate the vulnerable condition.
        data = null;

        // Creating and populating the array with null data.
        let dataVector: Array<number | null> = new Array<number | null>();
        dataVector.push(data);
        dataVector.push(data);
        dataVector.push(data);

        // Calling the goodB2GSink method.
        (new CWE476_NULL_Pointer_Dereference__Integer_72b()).goodB2GSink(dataVector);
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]) {
        // Calling the mainFromParent method, similar to the original Java logic.
        AbstractTestCase.mainFromParent(args);
    }
}
