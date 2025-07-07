import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_54e.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-54e.tmpl.java
*/
// The following comments describe the original Java context and mapping to ArkTS:
// CWE: 476 Null Pointer Dereference
// BadSource: Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
// GoodSink: add check to prevent possibility of null dereference
// BadSink : possibility of null dereference
// Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package

export class CWE476_NULL_Pointer_Dereference__String_54e {
  // Method to demonstrate a bad sink where a null pointer dereference can occur.
  // The 'data' parameter might be null, leading to a runtime error.
  public badSink(data: string | null): void {
    /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its 'length' property. */
    IO.writeLine("" + data.length); // In ArkTS, accessing 'length' on a 'null' string will throw an error.
  }

  // Method illustrating a good source and a bad sink.
  // The 'data' parameter might be null, leading to a runtime error.
  public goodG2BSink(data: string | null): void {
    /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its 'length' property. */
    IO.writeLine("" + data.length); // In ArkTS, accessing 'length' on a 'null' string will throw an error.
  }

  // Method illustrating a bad source and a good sink.
  // This sink includes a check to prevent a null pointer dereference.
  public goodB2GSink(data: string | null): void {
    /* FIX: Validate that 'data' is non-null before attempting to use it. */
    if (data !== null) {
      IO.writeLine("" + data.length);
    } else {
      IO.writeLine("data is null");
    }
  }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_54d.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-54d.tmpl.java
*/
// The following comments describe the original Java context and mapping to ArkTS:
// CWE: 476 Null Pointer Dereference
// BadSource: Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
// GoodSink: add check to prevent possibility of null dereference
// BadSink : possibility of null dereference
// Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package

export class CWE476_NULL_Pointer_Dereference__String_54d {
  // Passes potentially null data to the next stage in the data flow (CWE476_NULL_Pointer_Dereference__String_54e).
  public badSink(data: string | null): void {
    (new CWE476_NULL_Pointer_Dereference__String_54e()).badSink(data);
  }

  // Passes potentially null data from a good source to the next stage in the data flow.
  public goodG2BSink(data: string | null): void {
    (new CWE476_NULL_Pointer_Dereference__String_54e()).goodG2BSink(data);
  }

  // Passes potentially null data from a bad source to the next stage, which includes a good sink.
  public goodB2GSink(data: string | null): void {
    (new CWE476_NULL_Pointer_Dereference__String_54e()).goodB2GSink(data);
  }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_54c.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-54c.tmpl.java
*/
// The following comments describe the original Java context and mapping to ArkTS:
// CWE: 476 Null Pointer Dereference
// BadSource: Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
// GoodSink: add check to prevent possibility of null dereference
// BadSink : possibility of null dereference
// Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package

export class CWE476_NULL_Pointer_Dereference__String_54c {
  // Passes potentially null data to the next stage in the data flow (CWE476_NULL_Pointer_Dereference__String_54d).
  public badSink(data: string | null): void {
    (new CWE476_NULL_Pointer_Dereference__String_54d()).badSink(data);
  }

  // Passes potentially null data from a good source to the next stage in the data flow.
  public goodG2BSink(data: string | null): void {
    (new CWE476_NULL_Pointer_Dereference__String_54d()).goodG2BSink(data);
  }

  // Passes potentially null data from a bad source to the next stage, which includes a good sink.
  public goodB2GSink(data: string | null): void {
    (new CWE476_NULL_Pointer_Dereference__String_54d()).goodB2GSink(data);
  }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_54b.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-54b.tmpl.java
*/
// The following comments describe the original Java context and mapping to ArkTS:
// CWE: 476 Null Pointer Dereference
// BadSource: Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
// GoodSink: add check to prevent possibility of null dereference
// BadSink : possibility of null dereference
// Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package

export class CWE476_NULL_Pointer_Dereference__String_54b {
  // Passes potentially null data to the next stage in the data flow (CWE476_NULL_Pointer_Dereference__String_54c).
  public badSink(data: string | null): void {
    (new CWE476_NULL_Pointer_Dereference__String_54c()).badSink(data);
  }

  // Passes potentially null data from a good source to the next stage in the data flow.
  public goodG2BSink(data: string | null): void {
    (new CWE476_NULL_Pointer_Dereference__String_54c()).goodG2BSink(data);
  }

  // Passes potentially null data from a bad source to the next stage, which includes a good sink.
  public goodB2GSink(data: string | null): void {
    (new CWE476_NULL_Pointer_Dereference__String_54c()).goodB2GSink(data);
  }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_54a.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-54a.tmpl.java
*/
// The following comments describe the original Java context and mapping to ArkTS:
// CWE: 476 Null Pointer Dereference
// BadSource: Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
// GoodSink: add check to prevent possibility of null dereference
// BadSink : possibility of null dereference
// Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package

export class CWE476_NULL_Pointer_Dereference__String_54a extends AbstractTestCase {
  // The 'bad' method demonstrates a scenario where a null value is introduced,
  // which can lead to a null pointer dereference later in the execution flow.
  public bad(): void {
    let data: string | null;

    /* POTENTIAL FLAW: 'data' is intentionally set to null here, mimicking a scenario
     * where a value might be unexpectedly null from a source. */
    data = null;

    // The null 'data' is then passed through a chain of methods to a sink that does not handle null.
    (new CWE476_NULL_Pointer_Dereference__String_54b()).badSink(data);
  }

  // The 'good' method contains safe execution paths to prevent null pointer dereferences.
  public good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  // This method uses a good source (non-null data) and passes it to a bad sink.
  // Although the sink is "bad" (no null check), the data itself is guaranteed non-null here.
  private goodG2B(): void {
    let data: string; // Declared as 'string' because it's guaranteed non-null.

    /* FIX: 'data' is explicitly set to a non-null value. */
    data = "This is not null";

    // The non-null 'data' is passed through the chain to a sink.
    (new CWE476_NULL_Pointer_Dereference__String_54b()).goodG2BSink(data);
  }

  // This method uses a bad source (null data) but passes it to a good sink,
  // which includes a null check.
  private goodB2G(): void {
    let data: string | null; // Declared as 'string | null' as it's set to null.

    /* POTENTIAL FLAW: 'data' is intentionally set to null here, mimicking a scenario
     * where a value might be unexpectedly null from a source. */
    data = null;

    // The null 'data' is passed through the chain to a sink that properly handles null.
    (new CWE476_NULL_Pointer_Dereference__String_54b()).goodB2GSink(data);
  }

  /* Below is the main method. It is only used when building this testcase on
   * its own for testing or for building a binary to use in testing binary
   * analysis tools. It is not used when compiling all the testcases as one
   * application, which is how source code analysis tools are tested.
   */
  public static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}