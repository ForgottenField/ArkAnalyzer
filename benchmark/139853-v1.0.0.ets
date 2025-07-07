import { IO, AbstractTestCase } from './testcasesupport';

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_31.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-31.tmpl.java
//
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 31 Data flow: make a copy of data within the same method
//
export class CWE476_NULL_Pointer_Dereference__Integer_31 extends AbstractTestCase {

  public bad(): void {
    let dataCopy: number | null;
    {
      let data: number | null;

      // Potential flaw: 'data' is assigned null.
      data = null;

      dataCopy = data;
    }
    {
      let data: number | null = dataCopy;

      // Potential flaw: A null dereference will occur if 'data' is null when 'toString()' is called.
      // In ArkTS/TypeScript, calling methods on a 'null' value at runtime will throw an error.
      IO.writeLine("" + data.toString());
    }
  }

  public good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  // goodG2B() - use goodsource and badsink
  private goodG2B(): void {
    let dataCopy: number | null;
    {
      let data: number | null;

      // Fix: 'data' is assigned a non-null value.
      data = 5; // Equivalent to Integer.valueOf(5)

      dataCopy = data;
    }
    {
      let data: number | null = dataCopy;

      // Potential flaw: A null dereference will occur if 'data' is null when 'toString()' is called.
      // In ArkTS/TypeScript, calling methods on a 'null' value at runtime will throw an error.
      IO.writeLine("" + data.toString());
    }
  }

  // goodB2G() - use badsource and goodsink
  private goodB2G(): void {
    let dataCopy: number | null;
    {
      let data: number | null;

      // Potential flaw: 'data' is assigned null.
      data = null;

      dataCopy = data;
    }
    {
      let data: number | null = dataCopy;

      // Fix: Validate that 'data' is non-null before use.
      if (data !== null) {
        IO.writeLine("" + data.toString());
      } else {
        IO.writeLine("data is null");
      }
    }
  }

  // The 'main' method below is for standalone testing of this test case.
  // It is not used when compiling all the test cases as one application,
  // which is how source code analysis tools are tested.
  public static main(args: string[]): void {
    // Assuming mainFromParent is a static method inherited or available globally
    // for test case execution.
    // The original Java method declared specific exceptions, which are not directly translated here.
    // Instead, potential runtime errors would be handled by try-catch or other ArkTS mechanisms.
    (AbstractTestCase as any).mainFromParent(args);
  }
}