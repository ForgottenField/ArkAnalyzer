/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_73b.java
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
 * Flow Variant: 73 Data flow: data passed in a LinkedList from one method to another in different source files in the same package
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// This class replicates CWE476_NULL_Pointer_Dereference__StringBuilder_73b from Java.
export class CWE476_NULL_Pointer_Dereference__StringBuilder_73b {

    public badSink(dataLinkedList: Array<string | null>): void {
        // In ArkTS/TypeScript, Array.splice(index, 1) returns an array of removed elements.
        // We retrieve the element that was at index 2 before removal.
        let data: string | null = dataLinkedList.splice(2, 1)[0];

        /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null. */
        // The '!' non-null assertion operator is used here to replicate the original
        // Java code's unchecked dereference, allowing a runtime error if 'data' is null.
        IO.writeLine("" + data!.length);
    }

    /* goodG2B() - use GoodSource and BadSink */
    public goodG2BSink(dataLinkedList: Array<string | null>): void {
        // In ArkTS/TypeScript, Array.splice(index, 1) returns an array of removed elements.
        // We retrieve the element that was at index 2 before removal.
        let data: string | null = dataLinkedList.splice(2, 1)[0];

        /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null. */
        // The '!' non-null assertion operator is used here to replicate the original
        // Java code's unchecked dereference, allowing a runtime error if 'data' is null.
        IO.writeLine("" + data!.length);
    }

    /* goodB2G() - use BadSource and GoodSink */
    public goodB2GSink(dataLinkedList: Array<string | null>): void {
        // In ArkTS/TypeScript, Array.splice(index, 1) returns an array of removed elements.
        // We retrieve the element that was at index 2 before removal.
        let data: string | null = dataLinkedList.splice(2, 1)[0];

        /* FIX: Validate that 'data' is non-null to prevent dereference issues. */
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_73a.java
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
 * Flow Variant: 73 Data flow: data passed in a LinkedList from one method to another in different source files in the same package
 *
 * */

// This class replicates CWE476_NULL_Pointer_Dereference__StringBuilder_73a from Java.
export class CWE476_NULL_Pointer_Dereference__StringBuilder_73a extends AbstractTestCase {

    public bad(): void {
        let data: string | null;

        /* POTENTIAL FLAW: In this scenario, 'data' is assigned null. */
        data = null;

        // In ArkTS/TypeScript, an Array is commonly used to simulate Java's LinkedList
        // for operations like add(index, element) and remove(index).
        let dataLinkedList: Array<string | null> = [];
        dataLinkedList.splice(0, 0, data); // Adds data at index 0
        dataLinkedList.splice(1, 0, data); // Adds data at index 1
        dataLinkedList.splice(2, 0, data); // Adds data at index 2

        // Instantiate and call the badSink method, passing the list with null data.
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_73b()).badSink(dataLinkedList);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use GoodSource and BadSink */
    private goodG2B(): void {
        let data: string | null;

        /* FIX: 'data' is explicitly initialized to a non-null value. */
        // For StringBuilder, an empty string is a non-null equivalent.
        data = '';

        let dataLinkedList: Array<string | null> = [];
        dataLinkedList.splice(0, 0, data);
        dataLinkedList.splice(1, 0, data);
        dataLinkedList.splice(2, 0, data);
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_73b()).goodG2BSink(dataLinkedList);
    }

    /* goodB2G() - use BadSource and GoodSink */
    private goodB2G(): void {
        let data: string | null;

        /* POTENTIAL FLAW: In this scenario, 'data' is assigned null. */
        data = null;

        let dataLinkedList: Array<string | null> = [];
        dataLinkedList.splice(0, 0, data);
        dataLinkedList.splice(1, 0, data);
        dataLinkedList.splice(2, 0, data);
        (new CWE476_NULL_Pointer_Dereference__StringBuilder_73b()).goodB2GSink(dataLinkedList);
    }

    /* This main function is for standalone testing purposes, not typically used when integrated into larger applications. */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}