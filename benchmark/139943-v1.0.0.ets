import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_75b {
  /**
   * This method simulates the deserialization process and demonstrates a null pointer dereference.
   *
   * @param data The string data, which could potentially be null.
   */
  public badSink(data: string | null): void {
    // In this ArkTS simulation, the 'data' parameter directly represents the deserialized object.
    // The original Java code would deserialize a byte array to get this 'data'.

    try {
      /* POTENTIAL FLAW: A null pointer dereference will occur if data is null.
       * The 'length' property is accessed on 'data' without a null check. */
      IO.writeLine("" + data!.length); // Use '!' to assert non-null to replicate the Java NPE
    } catch (error: any) {
      // In ArkTS, we catch generic errors, simulating various potential issues during data processing.
      IO.logger.log(`Error during data processing: ${error.message}`);
    } finally {
      // This finally block simulates resource cleanup logic,
      // analogous to closing input streams in the original Java code.
      // Since data is directly passed in this ArkTS simulation, there are no streams to close,
      // but the structure is kept to preserve the original control flow.
    }
  }

  /**
   * This method uses a good source (non-null data) and a bad sink.
   * It demonstrates the sink behavior where a null pointer dereference could occur
   * if the input 'data' were null, even though in this specific flow, it won't be.
   *
   * @param data The string data, which will be non-null in this specific good flow.
   */
  public goodG2BSink(data: string | null): void {
    // In this ArkTS simulation, the 'data' parameter directly represents the deserialized object.
    // The original Java code would deserialize a byte array to get this 'data'.

    try {
      /* POTENTIAL FLAW: A null pointer dereference will occur if data is null.
       * The 'length' property is accessed on 'data' without a null check. */
      IO.writeLine("" + data!.length); // Use '!' to assert non-null to replicate the Java NPE
    } catch (error: any) {
      // In ArkTS, we catch generic errors, simulating various potential issues during data processing.
      IO.logger.log(`Error during data processing: ${error.message}`);
    } finally {
      // This finally block simulates resource cleanup logic,
      // analogous to closing input streams in the original Java code.
      // Since data is directly passed in this ArkTS simulation, there are no streams to close,
      // but the structure is kept to preserve the original control flow.
    }
  }

  /**
   * This method uses a bad source (null data) and a good sink (with null check).
   *
   * @param data The string data, which could potentially be null.
   */
  public goodB2GSink(data: string | null): void {
    // In this ArkTS simulation, the 'data' parameter directly represents the deserialized object.
    // The original Java code would deserialize a byte array to get this 'data'.

    try {
      /* FIX: Validate that data is non-null before dereferencing. */
      if (data !== null) {
        IO.writeLine("" + data.length);
      } else {
        IO.writeLine("data is null");
      }
    } catch (error: any) {
      // In ArkTS, we catch generic errors, simulating various potential issues during data processing.
      IO.logger.log(`Error during data processing: ${error.message}`);
    } finally {
      // This finally block simulates resource cleanup logic,
      // analogous to closing input streams in the original Java code.
      // Since data is directly passed in this ArkTS simulation, there are no streams to close,
      // but the structure is kept to preserve the original control flow.
    }
  }
}


import { AbstractTestCase, IO } from './testcasesupport';

/**
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource: Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 75 Data flow: data passed from one method to another, simulating cross-file data flow.
 *
 */
export class CWE476_NULL_Pointer_Dereference__String_75a extends AbstractTestCase {

  /**
   * This method demonstrates a bad flow where data is set to null,
   * then passed to a sink that does not handle nulls.
   */
  public bad(): void {
    let data: string | null;

    /* POTENTIAL FLAW: Data is explicitly set to null. */
    data = null;

    // In ArkTS, we directly pass the string or null value to simulate the data flow
    // that the original Java code achieved via serialization/deserialization.
    // The original Java code would serialize 'data' to a byte array and then deserialize it.
    try {
      (new CWE476_NULL_Pointer_Dereference__String_75b()).badSink(data);
    } catch (error: any) {
      // In ArkTS, we catch generic errors, simulating potential issues during data transfer or processing.
      IO.logger.log(`Error during data transfer: ${error.message}`);
    } finally {
      // This finally block simulates resource cleanup logic,
      // analogous to closing output streams in the original Java code.
      // Since data is directly passed in this ArkTS simulation, there are no streams to close,
      // but the structure is kept to preserve the original control flow.
    }
  }

  public good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  /**
   * This method uses a good source (non-null data) and a bad sink.
   * Even though the sink is "bad" (no null check), the source ensures data is not null.
   */
  private goodG2B(): void {
    let data: string | null;

    /* FIX: Data is set to a non-null string. */
    data = "This is not null";

    // In ArkTS, we directly pass the string or null value to simulate the data flow
    // that the original Java code achieved via serialization/deserialization.
    try {
      (new CWE476_NULL_Pointer_Dereference__String_75b()).goodG2BSink(data);
    } catch (error: any) {
      // In ArkTS, we catch generic errors, simulating potential issues during data transfer or processing.
      IO.logger.log(`Error during data transfer: ${error.message}`);
    } finally {
      // This finally block simulates resource cleanup logic.
    }
  }

  /**
   * This method uses a bad source (null data) but a good sink (with a null check).
   * This demonstrates how a good sink can prevent null pointer issues.
   */
  private goodB2G(): void {
    let data: string | null;

    /* POTENTIAL FLAW: Data is explicitly set to null. */
    data = null;

    // In ArkTS, we directly pass the string or null value to simulate the data flow
    // that the original Java code achieved via serialization/deserialization.
    try {
      (new CWE476_NULL_Pointer_Dereference__String_75b()).goodB2GSink(data);
    } catch (error: any) {
      // In ArkTS, we catch generic errors, simulating potential issues during data transfer or processing.
      IO.logger.log(`Error during data transfer: ${error.message}`);
    } finally {
      // This finally block simulates resource cleanup logic.
    }
  }

  /**
   * This is the main method for executing the test case.
   * It's typically used for standalone testing or binary analysis tools.
   */
  public static mainFromParent(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}