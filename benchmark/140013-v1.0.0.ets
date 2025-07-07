import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// CWE: 476 Null Pointer Dereference
// BadSource: Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: Data flow: data passed from one method to another.
// In ArkTS, this simulates passing data directly instead of via Java serialization.

// Define CWE476_NULL_Pointer_Dereference__int_array_75b first as it's a dependency
class CWE476_NULL_Pointer_Dereference__int_array_75b {
  // This method simulates a 'bad sink' where 'data' could be null.
  public badSink(data: number[] | null): void {
    // In ArkTS, we directly receive the 'data' array or null.
    // The original Java code deserialized data from a byte array.

    // POTENTIAL FLAW: Accessing 'length' on a potentially null 'data' will cause a runtime error.
    // This replicates the Null Pointer Dereference from the original Java code.
    IO.writeLine("" + data!.length); // Use '!' to assert non-null to mimic Java's unchecked access behavior leading to NPE.
  }

  // This method simulates a 'good source' leading to a 'bad sink'.
  public goodG2BSink(data: number[] | null): void {
    // In ArkTS, we directly receive the 'data' array or null.
    // The original Java code deserialized data from a byte array.

    // POTENTIAL FLAW: Accessing 'length' on a potentially null 'data' will cause a runtime error.
    // This replicates the Null Pointer Dereference from the original Java code.
    IO.writeLine("" + data!.length); // Use '!' to assert non-null to mimic Java's unchecked access behavior leading to NPE.
  }

  // This method simulates a 'bad source' leading to a 'good sink'.
  public goodB2GSink(data: number[] | null): void {
    // In ArkTS, we directly receive the 'data' array or null.
    // The original Java code deserialized data from a byte array.

    // FIX: Validate that 'data' is not null before accessing its properties.
    if (data !== null) {
      IO.writeLine("" + data.length);
    } else {
      IO.writeLine("data is null");
    }
  }
}

class CWE476_NULL_Pointer_Dereference__int_array_75a extends AbstractTestCase {
  // The 'bad' method demonstrates a scenario where a null array is created and passed to a sink that dereferences it.
  public bad(): void {
    let data: number[] | null;

    // POTENTIAL FLAW: 'data' is assigned null, which will later lead to a dereference error.
    data = null;

    // To replicate the original Java flow that involved serialization for data transfer,
    // we directly pass the 'data' value (which can be null) to the sink method.
    (new CWE476_NULL_Pointer_Dereference__int_array_75b()).badSink(data);
  }

  // The 'good' method contains corrected or safe paths.
  public good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  // goodG2B() - uses a good source (non-null data) and a bad sink.
  private goodG2B(): void {
    let data: number[] | null;

    // FIX: 'data' is initialized to a non-null array, preventing potential dereference.
    data = new Array<number>(5).fill(0); // Initialize an array of 5 numbers with zeros.

    // To replicate the original Java flow that involved serialization for data transfer,
    // we directly pass the 'data' value to the sink method.
    (new CWE476_NULL_Pointer_Dereference__int_array_75b()).goodG2BSink(data);
  }

  // goodB2G() - uses a bad source (null data) and a good sink.
  private goodB2G(): void {
    let data: number[] | null;

    // POTENTIAL FLAW: 'data' is assigned null. However, the sink will handle this safely.
    data = null;

    // To replicate the original Java flow that involved serialization for data transfer,
    // we directly pass the 'data' value (which can be null) to the sink method,
    // which is designed to handle nulls.
    (new CWE476_NULL_Pointer_Dereference__int_array_75b()).goodB2GSink(data);
  }
}

// Below is the equivalent of the main() method in Java.
// It is used for standalone testing or building a binary for analysis tools.
// It is not typically used when compiling all test cases as one application (how source code analysis tools are tested).
// The `mainFromParent` function is expected to be provided by `AbstractTestCaseBase`.
function main(): void {
  // Assuming 'process.argv' provides command-line arguments similar to Java's main(String[] args).
  AbstractTestCase.mainFromParent(process.argv);
}

// In a real ArkTS application, 'main' would typically be called by the framework or a test runner.
// For the purpose of this translation, we define it but do not explicitly call it at the top level
// to avoid conflicts if this code snippet is part of a larger compilation unit.
// If this were the entry point, 'main();' would be called here.
