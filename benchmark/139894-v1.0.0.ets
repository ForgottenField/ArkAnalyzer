// Define a simple StringBuilder class to simulate Java's for this test case.
// This allows the test case to compile and exhibit the null pointer behavior
// consistent with the original Java logic, as ArkTS does not have a direct
// built-in equivalent for `java.lang.StringBuilder`.
class StringBuilder {
  private _value: string;

  constructor(initialValue: string = "") {
    this._value = initialValue;
  }

  append(s: string): StringBuilder {
    this._value += s;
    return this;
  }

  toString(): string {
    return this._value;
  }

  length(): number {
    return this._value.length;
  }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_51b.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-51b.tmpl.java

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
 */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_51b {
  badSink(data: StringBuilder | null): void {
    // POTENTIAL FLAW: Null dereference will occur if data is null.
    // The '!' non-null assertion is used here to explicitly replicate
    // the original Java's unchecked dereference, ensuring a runtime error
    // if 'data' is null.
    IO.writeLine("" + data!.length());
  }

  // goodG2B() - use goodsource and badsink
  goodG2BSink(data: StringBuilder | null): void {
    // POTENTIAL FLAW: Null dereference will occur if data is null.
    // The '!' non-null assertion is used here to explicitly replicate
    // the original Java's unchecked dereference, ensuring a runtime error
    // if 'data' is null.
    IO.writeLine("" + data!.length());
  }

  // goodB2G() - use badsource and goodsink
  goodB2GSink(data: StringBuilder | null): void {
    // FIX: Validate that data is non-null.
    if (data !== null) {
      IO.writeLine("" + data.length());
    } else {
      IO.writeLine("data is null");
    }
  }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_51a.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-51a.tmpl.java

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
 */


// Re-import 'testcasesupport' as it's needed in this file too for base class and static method calls
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_51a extends AbstractTestCase {
  bad(): void {
    let data: StringBuilder | null;

    // POTENTIAL FLAW: The 'data' variable is explicitly assigned null.
    data = null;

    // Call badSink, passing the null 'data'.
    // This will lead to a null pointer dereference inside badSink.
    new CWE476_NULL_Pointer_Dereference__StringBuilder_51b().badSink(data);
  }

  good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  // goodG2B() - use goodsource and badsink
  private goodG2B(): void {
    let data: StringBuilder;

    // FIX: The 'data' variable is initialized to a non-null StringBuilder instance.
    data = new StringBuilder();

    // Call goodG2BSink, passing the non-null 'data'.
    // This will still lead to a null pointer dereference inside goodG2BSink
    // because goodG2BSink has the 'bad' sink logic.
    new CWE476_NULL_Pointer_Dereference__StringBuilder_51b().goodG2BSink(data);
  }

  // goodB2G() - use badsource and goodsink
  private goodB2G(): void {
    let data: StringBuilder | null;

    // POTENTIAL FLAW: The 'data' variable is explicitly assigned null.
    data = null;

    // Call goodB2GSink, passing the null 'data'.
    // goodB2GSink has a null check, preventing the dereference.
    new CWE476_NULL_Pointer_Dereference__StringBuilder_51b().goodB2GSink(data);
  }

  // Below is the main() method. It is used when building this testcase
  // on its own for testing or for building a binary for analysis tools.
  // It is not used when compiling all testcases as one application.
  static main(args: string[]): void {
    // Calls the mainFromParent method, typically from the AbstractTestCase base class,
    // to handle execution of test cases.
    AbstractTestCase.mainFromParent(args);
  }
}