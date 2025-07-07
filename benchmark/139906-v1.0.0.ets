import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// This class simulates the behavior of the original Java class, handling potentially null string data.
// It uses direct parameter passing to mimic the 'deserialization' process, ensuring the nullability
// is preserved for demonstrating the vulnerability.
export class CWE476_NULL_Pointer_Dereference__StringBuilder_75b {

  // This method demonstrates a bad sink where a null pointer dereference can occur.
  public badSink(data: string | null): void {
    // In ArkTS, we directly receive the potentially null string value,
    // simulating the deserialization of a StringBuilder.

    /* POTENTIAL FLAW: null dereference will occur if data is null */
    // The '!' operator is used here to intentionally bypass null checks,
    // replicating the original Java behavior where a NullPointerException would occur.
    IO.writeLine("" + data!.length);
  }

  // This method uses a good source (non-null data) but still passes it to a bad sink.
  public goodG2BSink(data: string | null): void {
    // In ArkTS, we directly receive the potentially null string value.

    /* POTENTIAL FLAW: null dereference will occur if data is null */
    // The '!' operator is used here to intentionally bypass null checks,
    // replicating the original Java behavior where a NullPointerException would occur.
    IO.writeLine("" + data!.length);
  }

  // This method uses a bad source (null data) but handles it with a good sink (null check).
  public goodB2GSink(data: string | null): void {
    // In ArkTS, we directly receive the potentially null string value.

    /* FIX: validate that data is non-null */
    if (data != null) {
      IO.writeLine("" + data.length);
    } else {
      IO.writeLine("data is null");
    }
  }
}

// This class simulates the behavior of the original Java class, acting as the source for
// potentially null string data passed to other methods.
export class CWE476_NULL_Pointer_Dereference__StringBuilder_75a extends AbstractTestCase {

  // This method sets a string variable to null and then "serializes" it (passes it directly)
  // to a method that will dereference it without a null check, causing a flaw.
  public bad(): void {
    let data: string | null;

    /* POTENTIAL FLAW: data is null */
    // We assign null to the variable to simulate the bad source.
    data = null;

    // In ArkTS, we simulate serialization by directly passing the 'data' value.
    // The original Java code used Java-specific serialization streams, which are not
    // directly translatable to ArkTS in a standard way for this scenario.
    // The critical aspect to preserve is the transfer of a potentially null value.
    (new CWE476_NULL_Pointer_Dereference__StringBuilder_75b()).badSink(data);
  }

  // This method serves as a wrapper to call both good test cases.
  public good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  // This method provides a non-null string value as a good source, then passes it
  // to a method that does not perform a null check (bad sink).
  private goodG2B(): void {
    let data: string | null;

    /* FIX: hardcode data to non-null */
    // We assign an empty string to simulate a non-null StringBuilder.
    data = "";

    // In ArkTS, we simulate serialization by directly passing the 'data' value.
    (new CWE476_NULL_Pointer_Dereference__StringBuilder_75b()).goodG2BSink(data);
  }

  // This method provides a null string value as a bad source, but then passes it
  // to a method that correctly handles null values (good sink).
  private goodB2G(): void {
    let data: string | null;

    /* POTENTIAL FLAW: data is null */
    // We assign null to the variable to simulate the bad source.
    data = null;

    // In ArkTS, we simulate serialization by directly passing the 'data' value.
    (new CWE476_NULL_Pointer_Dereference__StringBuilder_75b()).goodB2GSink(data);
  }

  /* Below is the main(). It is only used when building this testcase on
   * its own for testing or for building a binary to use in testing binary
   * analysis tools. It is not used when compiling all the testcases as one
   * application, which is how source code analysis tools are tested.
   */
  public static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}