// CWE476_NULL_Pointer_Dereference__int_array_61b.ets
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/**
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 61 Data flow: data returned from one method to another in different classes in the same package
 *
 */
export class CWE476_NULL_Pointer_Dereference__int_array_61b {
  /**
   * badSource(): Returns an array that is explicitly set to null.
   * This method simulates a scenario where a data source might return a null value.
   *
   * @returns {number[] | null} The array, which will be null in this bad source.
   */
  public badSource(): number[] | null {
    let data: number[] | null;

    // POTENTIAL FLAW: The 'data' variable is intentionally set to null to simulate the vulnerability.
    data = null;

    return data;
  }

  /**
   * goodG2BSource(): Returns a non-null array.
   * This method provides a "good" source of data for testing.
   *
   * @returns {number[]} A newly initialized non-null array.
   */
  public goodG2BSource(): number[] {
    let data: number[];

    // FIX: The 'data' variable is explicitly initialized to a non-null array.
    data = new Array<number>(5).fill(0); // Initialize with default values, similar to Java's new int[5]

    return data;
  }

  /**
   * goodB2GSource(): Returns an array that is explicitly set to null.
   * This method simulates a bad source, but is intended to be used with a good sink.
   *
   * @returns {number[] | null} The array, which will be null.
   */
  public goodB2GSource(): number[] | null {
    let data: number[] | null;

    // POTENTIAL FLAW: The 'data' variable is intentionally set to null to simulate the vulnerability.
    data = null;

    return data;
  }
}

// CWE476_NULL_Pointer_Dereference__int_array_61a.ets
/**
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 61 Data flow: data returned from one method to another in different classes in the same package
 *
 */
export class CWE476_NULL_Pointer_Dereference__int_array_61a extends AbstractTestCase {
  /**
   * bad(): Demonstrates a null pointer dereference.
   * Calls a bad source that returns null, then attempts to access a property of the null object.
   */
  public bad(): void {
    // Acquire data from a source that returns null.
    let data: number[] | null = new CWE476_NULL_Pointer_Dereference__int_array_61b().badSource();

    // POTENTIAL FLAW: Accessing 'length' on a variable that might be null.
    // In ArkTS/TypeScript, the '!' operator is used here to assert that 'data' is non-null,
    // thereby replicating the runtime NullPointerException that would occur in Java.
    IO.writeLine("" + data!.length);
  }

  /**
   * good(): Executes good test cases for null pointer dereference scenarios.
   */
  public good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  /**
   * goodG2B(): Uses a good source and a bad sink.
   * The source provides non-null data, but the sink still attempts a direct dereference.
   */
  private goodG2B(): void {
    // Acquire data from a good source that returns a non-null array.
    let data: number[] | null = new CWE476_NULL_Pointer_Dereference__int_array_61b().goodG2BSource();

    // POTENTIAL FLAW: This sink does not check for null, but the source ensures data is not null.
    // In ArkTS/TypeScript, the '!' operator is used here to assert that 'data' is non-null,
    // replicating the Java behavior where the programmer assumes non-null.
    IO.writeLine("" + data!.length);
  }

  /**
   * goodB2G(): Uses a bad source and a good sink.
   * The source returns null data, but the sink includes a null check to prevent dereference.
   */
  private goodB2G(): void {
    // Acquire data from a source that returns null.
    let data: number[] | null = new CWE476_NULL_Pointer_Dereference__int_array_61b().goodB2GSource();

    // FIX: Validate that 'data' is non-null before attempting to access its properties.
    if (data !== null) {
      IO.writeLine("" + data.length);
    } else {
      IO.writeLine("data is null");
    }
  }

  /**
   * main(): Entry point for running this test case directly.
   * It delegates to the parent class's main method for consistent test execution.
   */
  static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}