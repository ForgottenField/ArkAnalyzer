import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// This class handles various sinks (operations on data) for the CWE476 vulnerability.
export class CWE476_NULL_Pointer_Dereference__String_72b {

  // This method demonstrates a bad sink where a null pointer dereference can occur.
  badSink(dataVector: (string | null)[]): void {
    // Get the element at index 2 and remove it from the array to simulate Java's Vector.remove(index) behavior.
    let data: string | null = dataVector[2];
    dataVector.splice(2, 1); // This line replicates the removal behavior from the original Java Vector.remove.

    // POTENTIAL FLAW: a null dereference will occur if 'data' is null here.
    // The original logic attempts to access the 'length' property of a potentially null 'data' variable.
    IO.writeLine("" + data.length);
  }

  // This method demonstrates a good source leading to a bad sink.
  goodG2BSink(dataVector: (string | null)[]): void {
    // Get the element at index 2 and remove it from the array to simulate Java's Vector.remove(index) behavior.
    let data: string | null = dataVector[2];
    dataVector.splice(2, 1);

    // POTENTIAL FLAW: a null dereference will occur if 'data' is null here.
    // The original logic attempts to access the 'length' property of a potentially null 'data' variable.
    IO.writeLine("" + data.length);
  }

  // This method demonstrates a bad source leading to a good sink where the null pointer is handled.
  goodB2GSink(dataVector: (string | null)[]): void {
    // Get the element at index 2 and remove it from the array to simulate Java's Vector.remove(index) behavior.
    let data: string | null = dataVector[2];
    dataVector.splice(2, 1);

    // FIX: Check if 'data' is null before dereferencing.
    if (data != null) {
      // If data is not null, safely access its length.
      IO.writeLine("" + data.length);
    } else {
      // If data is null, provide an appropriate message.
      IO.writeLine("data is null");
    }
  }
}

// This class is a test case for CWE-476, Null Pointer Dereference.
// It inherits from AbstractTestCase to provide testing infrastructure.
export class CWE476_NULL_Pointer_Dereference__String_72a extends AbstractTestCase {

  // This method represents the 'bad' scenario, where a null pointer dereference will occur.
  bad(): void {
    let data: string | null;

    // To replicate the original logic, this variable is intentionally set to null.
    data = null;

    // An array is used to simulate Java's Vector, passing the data between methods.
    let dataVector: (string | null)[] = []; // Explicitly allow null in array
    dataVector[0] = data; // Assign null to index 0
    dataVector[1] = data; // Assign null to index 1
    dataVector[2] = data; // Assign null to index 2

    // Instantiate and call the badSink method from the related class (72b).
    (new CWE476_NULL_Pointer_Dereference__String_72b()).badSink(dataVector);
  }

  // This method orchestrates the 'good' scenarios by calling goodG2B and goodB2G.
  good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  // This method represents a 'good source' (non-null data) leading to a 'bad sink' (potential dereference, but data is non-null).
  private goodG2B(): void {
    let data: string | null;

    // FIX: 'data' is explicitly set to a non-null value.
    data = "This is not null";

    // An array is used to simulate Java's Vector, passing the data between methods.
    let dataVector: (string | null)[] = [];
    dataVector[0] = data;
    dataVector[1] = data;
    dataVector[2] = data;

    // Instantiate and call the goodG2BSink method from the related class (72b).
    (new CWE476_NULL_Pointer_Dereference__String_72b()).goodG2BSink(dataVector);
  }

  // This method represents a 'bad source' (null data) leading to a 'good sink' (null pointer handled).
  private goodB2G(): void {
    let data: string | null;

    // To replicate the original logic, this variable is intentionally set to null.
    data = null;

    // An array is used to simulate Java's Vector, passing the data between methods.
    let dataVector: (string | null)[] = [];
    dataVector[0] = data;
    dataVector[1] = data;
    dataVector[2] = data;

    // Instantiate and call the goodB2GSink method from the related class (72b).
    (new CWE476_NULL_Pointer_Dereference__String_72b()).goodB2GSink(dataVector);
  }

  // This 'main' method is for testing purposes only and might not be used in the final application bundle.
  public static main(args: string[]): void {
    // Call the parent's mainFromParent method to run the test cases.
    AbstractTestCase.mainFromParent(args);
  }
}