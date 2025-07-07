// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_73b.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-73b.tmpl.java

// Description:
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 73 Data flow: data passed in an Array (simulating LinkedList) from one method to another in different classes/modules

// Import necessary modules from the testcasesupport package.
// We include all specified components as per the directive, even if only some are used in a particular class.
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// Defines the class corresponding to CWE476_NULL_Pointer_Dereference__Integer_73b
export class CWE476_NULL_Pointer_Dereference__Integer_73b {
  /**
   * Defines the 'bad sink' behavior.
   * This method will attempt to dereference a potentially null 'data' object.
   * @param dataLinkedList An array simulating a LinkedList, containing numerical data, potentially including nulls.
   */
  badSink(dataLinkedList: Array<number | null>): void {
    // Retrieve the element at index 2. This element might be null.
    // 'splice(2, 1)' removes one element at index 2 and returns an array of the removed elements.
    // We take the first element from this array.
    let data: number | null = dataLinkedList.splice(2, 1)[0];

    // POTENTIAL FLAW: a null dereference will occur if 'data' is null here.
    // To faithfully replicate the original Java bug, we use the non-null assertion operator '!'
    // to simulate the runtime error that would occur if 'data' is null and 'toString()' is called.
    IO.writeLine("" + data!.toString());
  }

  /**
   * Defines the 'good source to bad sink' behavior.
   * This method uses a good source (non-null data) but still passes it to a bad sink.
   * @param dataLinkedList An array simulating a LinkedList, containing numerical data.
   */
  goodG2BSink(dataLinkedList: Array<number | null>): void {
    // Retrieve the element at index 2. This element should be non-null based on the source.
    let data: number | null = dataLinkedList.splice(2, 1)[0];

    // POTENTIAL FLAW: a null dereference will occur if 'data' is null. 
    // This particular call should not fail if 'goodG2B' method is used as a source,
    // but the sink itself lacks a null check.
    // To faithfully replicate the original Java bug, we use the non-null assertion operator '!'.
    IO.writeLine("" + data!.toString());
  }

  /**
   * Defines the 'bad source to good sink' behavior.
   * This method uses a bad source (null data) but then employs a good sink (with null check).
   * @param dataLinkedList An array simulating a LinkedList, containing numerical data, potentially including nulls.
   */
  goodB2GSink(dataLinkedList: Array<number | null>): void {
    // Retrieve the element at index 2. This element might be null.
    let data: number | null = dataLinkedList.splice(2, 1)[0];

    // FIX: validate that 'data' is non-null before dereferencing it.
    if (data != null) {
      IO.writeLine("" + data.toString());
    } else {
      IO.writeLine("data is null");
    }
  }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_73a.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-73a.tmpl.java

// Description:
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 73 Data flow: data passed in an Array (simulating LinkedList) from one method to another in different classes/modules

// Import necessary modules from the testcasesupport package.
// We include all specified components as per the directive.
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// Defines the class corresponding to CWE476_NULL_Pointer_Dereference__Integer_73a
export class CWE476_NULL_Pointer_Dereference__Integer_73a extends AbstractTestCase {
  /**
   * Defines the 'bad' execution path where a null pointer dereference occurs.
   */
  bad(): void {
    let data: number | null;

    // POTENTIAL FLAW: 'data' is assigned null.
    data = null;

    // Create a new array to simulate Java's LinkedList for data transfer.
    // Populate the array with the potentially null 'data'.
    // Java's LinkedList.add(index, element) shifts elements. When adding to an empty list 
    // at consecutive indices (0, 1, 2), it results in [data, data, data].
    let dataLinkedList: Array<number | null> = [];
    dataLinkedList.push(data); // Index 0
    dataLinkedList.push(data); // Index 1
    dataLinkedList.push(data); // Index 2

    // Pass the list containing null data to the 'badSink' method in the other class,
    // which will then cause a null dereference.
    new CWE476_NULL_Pointer_Dereference__Integer_73b().badSink(dataLinkedList);
  }

  /**
   * Executes both good variants of the test case.
   */
  good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  /**
   * Defines the 'good source to bad sink' path.
   * Data is initialized to a non-null value, then passed to the bad sink.
   * This path should not result in a null dereference despite using a 'bad' sink.
   */
  private goodG2B(): void {
    let data: number | null;

    // FIX: 'data' is assigned a non-null value (number primitive).
    data = 5;

    // Create a new array to simulate Java's LinkedList for data transfer.
    // Populate the array with the non-null 'data'.
    let dataLinkedList: Array<number | null> = [];
    dataLinkedList.push(data);
    dataLinkedList.push(data);
    dataLinkedList.push(data);

    // Pass the list with non-null data to the 'goodG2BSink' method.
    new CWE476_NULL_Pointer_Dereference__Integer_73b().goodG2BSink(dataLinkedList);
  }

  /**
   * Defines the 'bad source to good sink' path.
   * Data is initialized to null, but passed to a good sink that handles nulls.
   * This path should not result in a null dereference.
   */
  private goodB2G(): void {
    let data: number | null;

    // POTENTIAL FLAW: 'data' is assigned null.
    data = null;

    // Create a new array to simulate Java's LinkedList for data transfer.
    // Populate the array with the potentially null 'data'.
    let dataLinkedList: Array<number | null> = [];
    dataLinkedList.push(data);
    dataLinkedList.push(data);
    dataLinkedList.push(data);

    // Pass the list containing null data to the 'goodB2GSink' method,
    // which includes a null check.
    new CWE476_NULL_Pointer_Dereference__Integer_73b().goodB2GSink(dataLinkedList);
  }

  /**
   * This 'main' method is used for local testing or binary analysis tools.
   * It's not used when all test cases are compiled together.
   * @param args Command line arguments.
   */
  static main(args: string[]): void {
    // No direct equivalent for 'throws' in TypeScript. Error handling is typically via try-catch or explicit checks.
    // Assuming 'mainFromParent' is a static method in AbstractTestCase.
    AbstractTestCase.mainFromParent(args);
  }
}
