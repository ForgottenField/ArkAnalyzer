import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_53a extends AbstractTestCase {
  /*
   * @description
   * CWE: 476 Null Pointer Dereference
   * BadSource:  Set data to null
   * GoodSource: Set data to a non-null value
   * Sinks:
   *    GoodSink: add check to prevent possibility of null dereference
   *    BadSink : possibility of null dereference
   * Flow Variant: 53 Data flow: data passed as an argument from one method through two others to a fourth; all four functions are in different classes in the same package
   *
   */

  public bad(): void {
    let data: number[] | null; // Use number[] for int[] and add | null for potential nullability

    /* POTENTIAL FLAW: data is null */
    data = null;

    // To replicate the original logic, we create an instance of CWE476_NULL_Pointer_Dereference__int_array_53b
    // and pass the potentially null 'data' to its badSink method.
    new CWE476_NULL_Pointer_Dereference__int_array_53b().badSink(data);
  }

  public good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  /* goodG2B() - use goodsource and badsink */
  private goodG2B(): void {
    let data: number[] | null;

    /* FIX: initialize data to a non-null array */
    data = new Array<number>(5); // Use Array<number> for int[]

    // To replicate the original logic, we create an instance of CWE476_NULL_Pointer_Dereference__int_array_53b
    // and pass the non-null 'data' to its goodG2BSink method.
    new CWE476_NULL_Pointer_Dereference__int_array_53b().goodG2BSink(data);
  }

  /* goodB2G() - use badsource and goodsink */
  private goodB2G(): void {
    let data: number[] | null;

    /* POTENTIAL FLAW: data is null */
    data = null;

    // To replicate the original logic, we create an instance of CWE476_NULL_Pointer_Dereference__int_array_53b
    // and pass the potentially null 'data' to its goodB2GSink method.
    new CWE476_NULL_Pointer_Dereference__int_array_53b().goodB2GSink(data);
  }

  /* This is the entry point for running this test case when building it independently.
   * It simulates the Java main method for test execution, leveraging the parent test case runner.
   */
  public static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}

// This class is part of a series that demonstrates a data flow path for a null pointer vulnerability.
export class CWE476_NULL_Pointer_Dereference__int_array_53c {
  /*
   * @description
   * CWE: 476 Null Pointer Dereference
   * BadSource:  Set data to null
   * GoodSource: Set data to a non-null value
   * Sinks:
   *    GoodSink: add check to prevent possibility of null dereference
   *    BadSink : possibility of null dereference
   * Flow Variant: 53 Data flow: data passed as an argument from one method through two others to a fourth; all four functions are in different classes in the same package
   *
   */

  public badSink(data: number[] | null): void { // Parameter type changed to number[] | null
    // To replicate the original logic, we pass the data to a method in CWE476_NULL_Pointer_Dereference__int_array_53d.
    new CWE476_NULL_Pointer_Dereference__int_array_53d().badSink(data);
  }

  /* goodG2B() - use goodsource and badsink */
  public goodG2BSink(data: number[] | null): void {
    // To replicate the original logic, we pass the data to a method in CWE476_NULL_Pointer_Dereference__int_array_53d.
    new CWE476_NULL_Pointer_Dereference__int_array_53d().goodG2BSink(data);
  }

  /* goodB2G() - use badsource and goodsink */
  public goodB2GSink(data: number[] | null): void {
    // To replicate the original logic, we pass the data to a method in CWE476_NULL_Pointer_Dereference__int_array_53d.
    new CWE476_NULL_Pointer_Dereference__int_array_53d().goodB2GSink(data);
  }
}

// This class is part of a series that demonstrates a data flow path for a null pointer vulnerability.
export class CWE476_NULL_Pointer_Dereference__int_array_53b {
  /*
   * @description
   * CWE: 476 Null Pointer Dereference
   * BadSource:  Set data to null
   * GoodSource: Set data to a non-null value
   * Sinks:
   *    GoodSink: add check to prevent possibility of null dereference
   *    BadSink : possibility of null dereference
   * Flow Variant: 53 Data flow: data passed as an argument from one method through two others to a fourth; all four functions are in different classes in the same package
   *
   */

  public badSink(data: number[] | null): void {
    // To replicate the original logic, we pass the data to a method in CWE476_NULL_Pointer_Dereference__int_array_53c.
    new CWE476_NULL_Pointer_Dereference__int_array_53c().badSink(data);
  }

  /* goodG2B() - use goodsource and badsink */
  public goodG2BSink(data: number[] | null): void {
    // To replicate the original logic, we pass the data to a method in CWE476_NULL_Pointer_Dereference__int_array_53c.
    new CWE476_NULL_Pointer_Dereference__int_array_53c().goodG2BSink(data);
  }

  /* goodB2G() - use badsource and goodsink */
  public goodB2GSink(data: number[] | null): void {
    // To replicate the original logic, we pass the data to a method in CWE476_NULL_Pointer_Dereference__int_array_53c.
    new CWE476_NULL_Pointer_Dereference__int_array_53c().goodB2GSink(data);
  }
}

// This class is part of a series that demonstrates a data flow path for a null pointer vulnerability.
export class CWE476_NULL_Pointer_Dereference__int_array_53d {
  /*
   * @description
   * CWE: 476 Null Pointer Dereference
   * BadSource:  Set data to null
   * GoodSource: Set data to a non-null value
   * Sinks:
   *    GoodSink: add check to prevent possibility of null dereference
   *    BadSink : possibility of null dereference
   * Flow Variant: 53 Data flow: data passed as an argument from one method through two others to a fourth; all four functions are in different classes in the same package
   *
   */

  public badSink(data: number[] | null): void { // Parameter type changed to number[] | null
    /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its length.
     * This replicates the original Java vulnerability.
     */
    IO.writeLine("" + data.length);
  }

  /* goodG2B() - use goodsource and badsink */
  public goodG2BSink(data: number[] | null): void {
    /* POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its length.
     * This replicates the original Java vulnerability.
     */
    IO.writeLine("" + data.length);
  }

  /* goodB2G() - use badsource and goodsink */
  public goodB2GSink(data: number[] | null): void {
    /* FIX: validate that data is non-null before access */
    if (data != null) {
      IO.writeLine("" + data.length);
    } else {
      IO.writeLine("data is null");
    }
  }
}