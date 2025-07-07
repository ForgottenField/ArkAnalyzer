/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_73a.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-73a.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 73 Data flow: data passed in an Array (simulating LinkedList) from one method to another in different source files in the same package
 *
 * */

import { AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_73a extends AbstractTestCase {

    bad(): void {
        let data: number[] | null; // Declare 'data' as an array of numbers that can also be null.

        /* POTENTIAL FLAW: 'data' is null */
        data = null; // Assign null to 'data'.

        // To replicate the original logic, we use a standard ArkTS Array to simulate Java's LinkedList behavior.
        // This array is typed to hold arrays of numbers, which themselves can be null.
        let dataList: Array<number[] | null> = new Array<number[] | null>();
        dataList.splice(0, 0, data); // Adds 'data' (which is null) at index 0.
        dataList.splice(1, 0, data); // Adds 'data' (which is null) at index 1.
        dataList.splice(2, 0, data); // Adds 'data' (which is null) at index 2.

        // Instantiate and call the badSink method of CWE476_NULL_Pointer_Dereference__int_array_73b,
        // passing the list containing the potentially null array.
        new CWE476_NULL_Pointer_Dereference__int_array_73b().badSink(dataList);
    }

    good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use GoodSource and BadSink */
    private goodG2B(): void {
        let data: number[] | null;

        /* FIX: hardcode 'data' to a non-null value */
        data = new Array<number>(5); // Initialize 'data' as a non-null array with 5 elements.

        let dataList: Array<number[] | null> = new Array<number[] | null>();
        dataList.splice(0, 0, data);
        dataList.splice(1, 0, data);
        dataList.splice(2, 0, data);

        new CWE476_NULL_Pointer_Dereference__int_array_73b().goodG2BSink(dataList);
    }

    /* goodB2G() - use BadSource and GoodSink */
    private goodB2G(): void {
        let data: number[] | null;

        /* POTENTIAL FLAW: 'data' is null */
        data = null; // Assign null to 'data'.

        let dataList: Array<number[] | null> = new Array<number[] | null>();
        dataList.splice(0, 0, data);
        dataList.splice(1, 0, data);
        dataList.splice(2, 0, data);

        new CWE476_NULL_Pointer_Dereference__int_array_73b().goodB2GSink(dataList);
    }

    /* Below is the main() equivalent. It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}

// ====================================================================================================
// The following code block represents the content of CWE476_NULL_Pointer_Dereference__int_array_73b.ets
// ====================================================================================================

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_73b.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-73b.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 73 Data flow: data passed in an Array (simulating LinkedList) from one method to another in different source files in the same package
 *
 * */

import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_73b {

    // The 'dataList' parameter is typed to reflect that it contains elements that could be null.
    badSink(dataList: Array<number[] | null>): void {
        // To replicate the original logic, we remove the element at index 2 from the list.
        // Array.splice(startIndex, deleteCount) removes elements and returns an array of the removed elements.
        // The Java LinkedList's 'remove(2)' behavior is effectively simulated by taking the first element
        // from the array of removed elements.
        let data: number[] | null = dataList.splice(2, 1)[0];

        /* POTENTIAL FLAW: null dereference will occur if 'data' is null */
        // ArkTS, by default, enforces strict null checks. To replicate the original flaw where a null
        // pointer dereference happens, we use the non-null assertion operator '!' to bypass the null check.
        // This will result in a runtime error if 'data' is null.
        IO.writeLine("" + data!.length);
    }

    /* goodG2B() - use GoodSource and BadSink */
    goodG2BSink(dataList: Array<number[] | null>): void {
        let data: number[] | null = dataList.splice(2, 1)[0];

        /* POTENTIAL FLAW: null dereference will occur if 'data' is null */
        IO.writeLine("" + data!.length);
    }

    /* goodB2G() - use BadSource and GoodSink */
    goodB2GSink(dataList: Array<number[] | null>): void {
        let data: number[] | null = dataList.splice(2, 1)[0];

        /* FIX: validate that 'data' is non-null */
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }
}