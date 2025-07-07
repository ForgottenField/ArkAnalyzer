// General imports for the whole translated code
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';
import HashMap from '@ohos.util.HashMap';

// Define a simple StringBuilder class to emulate Java's for precise replication of method calls.
class StringBuilder {
  private _value: string = "";

  constructor(initialValue: string = "") {
    this._value = initialValue;
  }

  /**
   * Returns the length of the string in this builder.
   * To replicate the original behavior, this method can be called on a null instance.
   * @returns The length of the sequence of characters.
   */
  public length(): number {
    return this._value.length;
  }

  /**
   * Converts the builder's content to a string.
   * @returns The string representation of the builder's content.
   */
  public toString(): string {
    return this._value;
  }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_74b.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-74b.tmpl.ts
*/
// This file is part of a test case for CWE-476 Null Pointer Dereference.
// The bad source sets data to null, while the good source sets it to a non-null value.
// Sinks include a bad sink that allows null dereference and a good sink that checks for null.
// This variant uses a HashMap to pass data between methods in different files.

// The class name and path reflect the original Java package structure.
// In a combined ArkTS file, this class is directly accessible by other classes in the same file.
class CWE476_NULL_Pointer_Dereference__StringBuilder_74b {
  public badSink(dataHashMap: HashMap<number, StringBuilder | null>): void {
    let data: StringBuilder | null = dataHashMap.get(2);

    // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
    // We explicitly cast to 'any' to bypass TypeScript's null-checking and replicate the Java NPE behavior.
    IO.writeLine("" + (data as any).length());
  }

  public goodG2BSink(dataHashMap: HashMap<number, StringBuilder | null>): void {
    let data: StringBuilder | null = dataHashMap.get(2);

    // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
    // We explicitly cast to 'any' to bypass TypeScript's null-checking and replicate the Java NPE behavior.
    IO.writeLine("" + (data as any).length());
  }

  public goodB2GSink(dataHashMap: HashMap<number, StringBuilder | null>): void {
    let data: StringBuilder | null = dataHashMap.get(2);

    // FIX: Validate that 'data' is not null.
    if (data != null) {
      IO.writeLine("" + data.length());
    } else {
      IO.writeLine("data is null");
    }
  }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_74a.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-74a.tmpl.ts
*/
// This file is part of a test case for CWE-476 Null Pointer Dereference.
// The bad source sets data to null, while the good source sets it to a non-null value.
// Sinks include a bad sink that allows null dereference and a good sink that checks for null.
// This variant uses a HashMap to pass data between methods in different files.

// The class name and path reflect the original Java package structure.
// In a combined ArkTS file, this class extends AbstractTestCase and can access CWE476_NULL_Pointer_Dereference__StringBuilder_74b directly.
export class CWE476_NULL_Pointer_Dereference__StringBuilder_74a extends AbstractTestCase {
  public bad(): void {
    let data: StringBuilder | null;

    // POTENTIAL FLAW: 'data' is intentionally set to null here to replicate the original vulnerability.
    data = null;

    let dataHashMap: HashMap<number, StringBuilder | null> = new HashMap<number, StringBuilder | null>();
    dataHashMap.set(0, data);
    dataHashMap.set(1, data);
    dataHashMap.set(2, data);
    // Instantiate the other class directly as it's in the same logical file.
    (new CWE476_NULL_Pointer_Dereference__StringBuilder_74b()).badSink(dataHashMap);
  }

  public good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  // goodG2B() - use GoodSource and BadSink
  private goodG2B(): void {
    let data: StringBuilder | null;

    // FIX: 'data' is initialized to a non-null value.
    data = new StringBuilder();

    let dataHashMap: HashMap<number, StringBuilder | null> = new HashMap<number, StringBuilder | null>();
    dataHashMap.set(0, data);
    dataHashMap.set(1, data);
    dataHashMap.set(2, data);
    (new CWE476_NULL_Pointer_Dereference__StringBuilder_74b()).goodG2BSink(dataHashMap);
  }

  // goodB2G() - use BadSource and GoodSink
  private goodB2G(): void {
    let data: StringBuilder | null;

    // POTENTIAL FLAW: 'data' is intentionally set to null here to replicate the original vulnerability.
    data = null;

    let dataHashMap: HashMap<number, StringBuilder | null> = new HashMap<number, StringBuilder | null>();
    dataHashMap.set(0, data);
    dataHashMap.set(1, data);
    dataHashMap.set(2, data);
    (new CWE476_NULL_Pointer_Dereference__StringBuilder_74b()).goodB2GSink(dataHashMap);
  }

  /* Below is the main(). It is only used when building this testcase on
   * its own for testing or for building a binary to use in testing binary
   * analysis tools. It is not used when compiling all the testcases as one
   * application, which is how source code analysis tools are tested.
   */
  public static main(args: string[]): void {
    AbstractTestCaseBase.mainFromParent(args);
  }
}