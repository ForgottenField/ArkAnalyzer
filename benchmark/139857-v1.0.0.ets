import { IO, AbstractTestCase } from './testcasesupport';

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_51b.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-51b.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 51 Data flow: data passed as an argument from one function to another in different classes in the same package
 *
 * */

export class CWE476_NULL_Pointer_Dereference__Integer_51b {
  public badSink(data: number | null): void {
    /* POTENTIAL FLAW: Null dereference will occur if data is null when attempting to call its toString method.
     * The '!' operator is used here to assert that 'data' is non-null, replicating the original Java code's
     * unchecked access that would lead to a NullPointerException if 'data' were null. */
    IO.writeLine('' + data!.toString());
  }

  /* goodG2B() - use goodsource and badsink */
  public goodG2BSink(data: number | null): void {
    /* POTENTIAL FLAW: Null dereference will occur if data is null when attempting to call its toString method.
     * The '!' operator is used here to assert that 'data' is non-null, replicating the original Java code's
     * unchecked access that would lead to a NullPointerException if 'data' were null. */
    IO.writeLine('' + data!.toString());
  }

  /* goodB2G() - use badsource and goodsink */
  public goodB2GSink(data: number | null): void {
    /* FIX: Validate that data is non-null before proceeding to use it. */
    if (data !== null) {
      IO.writeLine('' + data.toString());
    } else {
      IO.writeLine('data is null');
    }
  }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_51a.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-51a.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 51 Data flow: data passed as an argument from one function to another in different classes in the same package
 *
 * */

export class CWE476_NULL_Pointer_Dereference__Integer_51a extends AbstractTestCase {
  public bad(): void {
    let data: number | null;

    /* POTENTIAL FLAW: data is explicitly set to null. This value is then passed to a function
     * that does not perform a null check, leading to a dereference error. */
    data = null;

    // An instance of CWE476_NULL_Pointer_Dereference__Integer_51b is created to call its badSink method,
    // passing the potentially null 'data' value.
    (new CWE476_NULL_Pointer_Dereference__Integer_51b()).badSink(data);
  }

  public good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  /* goodG2B() - use goodsource and badsink */
  private goodG2B(): void {
    let data: number | null;

    /* FIX: data is assigned a non-null value. This prevents a null dereference
     * when it's later used in the sink that doesn't perform a null check. */
    data = 5; // In ArkTS, directly assign a number for its valueOf equivalent.

    // An instance of CWE476_NULL_Pointer_Dereference__Integer_51b is created to call its goodG2BSink method,
    // passing the non-null 'data' value.
    (new CWE476_NULL_Pointer_Dereference__Integer_51b()).goodG2BSink(data);
  }

  /* goodB2G() - use badsource and goodsink */
  private goodB2G(): void {
    let data: number | null;

    /* POTENTIAL FLAW: data is explicitly set to null. However, the subsequent sink method
     * is designed to handle null values gracefully, preventing a dereference error. */
    data = null;

    // An instance of CWE476_NULL_Pointer_Dereference__Integer_51b is created to call its goodB2GSink method.
    // This sink includes a null check.
    (new CWE476_NULL_Pointer_Dereference__Integer_51b()).goodB2GSink(data);
  }

  /* Below is the main() method. It is only used when building this testcase
   * independently for testing or for creating a binary to use with binary
   * analysis tools. It is not utilized when compiling all test cases as a
   * single application, which is the approach for testing source code
   * analysis tools. */
  public static main(args: string[]): void {
    // Delegates to the parent test case framework's main entry point.
    AbstractTestCase.mainFromParent(args);
  }
}
