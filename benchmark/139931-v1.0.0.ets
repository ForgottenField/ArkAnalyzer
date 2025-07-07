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

import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_51b {
  badSink(data: string | null): void {
    // POTENTIAL FLAW: A null dereference will occur if 'data' is null.
    // In ArkTS, accessing a property like 'length' on a null value will cause a runtime error.
    IO.writeLine("" + data!.length);
  }

  // goodG2B() - use good source and bad sink
  goodG2BSink(data: string | null): void {
    // POTENTIAL FLAW: A null dereference will occur if 'data' is null.
    // In ArkTS, accessing a property like 'length' on a null value will cause a runtime error.
    IO.writeLine("" + data!.length);
  }

  // goodB2G() - use bad source and good sink
  goodB2GSink(data: string | null): void {
    // FIX: Validate that 'data' is not null before using it.
    if (data !== null) {
      IO.writeLine("" + data.length);
    } else {
      IO.writeLine("data is null");
    }
  }
}

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

import { AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_51a extends AbstractTestCase {
  bad(): void {
    let data: string | null;

    // POTENTIAL FLAW: The 'data' variable is explicitly set to null.
    // This value is then passed to a method that will dereference it without a null check.
    data = null;

    new CWE476_NULL_Pointer_Dereference__String_51b().badSink(data);
  }

  good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  // goodG2B() - use good source and bad sink
  private goodG2B(): void {
    let data: string | null;

    // FIX: Hardcode 'data' to a non-null string, ensuring no null dereference at the sink.
    data = "This is not null";

    new CWE476_NULL_Pointer_Dereference__String_51b().goodG2BSink(data);
  }

  // goodB2G() - use bad source and good sink
  private goodB2G(): void {
    let data: string | null;

    // POTENTIAL FLAW: The 'data' variable is explicitly set to null.
    // This value is then passed to a method that includes a null check before dereferencing.
    data = null;

    new CWE476_NULL_Pointer_Dereference__String_51b().goodB2GSink(data);
  }

  /*
   * The main function below is included for testing this test case individually.
   * It is not used when compiling all test cases as a single application, which is
   * how source code analysis tools typically operate.
   */
  static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}
