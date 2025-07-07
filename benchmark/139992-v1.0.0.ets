/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_14.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-14.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 14 Control flow: if(IO.staticFive==5) and if(IO.staticFive!=5)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_14 extends AbstractTestCase {

  bad(): void {
    let data: number[] | null; // Declare 'data' as an array of numbers or null.
    if (IO.staticFive === 5) {
      /* POTENTIAL FLAW: data is null */
      data = null;
    } else {
      // This code path will not be executed in the current flow variant.
      // It is included to ensure the 'data' variable is always initialized
      // before its use, even if with a null value, for consistency with the original logic.
      data = null;
    }

    if (IO.staticFive === 5) {
      /* POTENTIAL FLAW: null dereference will occur if data is null */
      // Accessing 'data.length' when 'data' is null will cause a runtime error.
      IO.writeLine("" + data!.length); // Use non-null assertion '!' to replicate the original Java behavior where a null dereference is possible without a compile-time error.
    }
  }

  /* goodG2B1() - use goodsource and badsink by changing first IO.staticFive==5 to IO.staticFive!=5 */
  private goodG2B1(): void {
    let data: number[] | null; // Declare 'data' as an array of numbers or null.
    if (IO.staticFive !== 5) {
      // This code path will not be executed in the current flow variant.
      // It is included to ensure the 'data' variable is always initialized
      // before its use, even if with a null value, for consistency with the original logic.
      data = null;
    } else {
      /* FIX: hardcode data to non-null */
      // Initializes a new array of 5 numbers. In ArkTS/TS, these elements will be 'undefined' by default.
      data = new Array<number>(5);
    }

    if (IO.staticFive === 5) {
      /* POTENTIAL FLAW: null dereference will occur if data is null */
      // Accessing 'data.length' when 'data' is null will cause a runtime error.
      IO.writeLine("" + data!.length); // Use non-null assertion '!' to replicate the original Java behavior where a null dereference is possible without a compile-time error.
    }
  }

  /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
  private goodG2B2(): void {
    let data: number[] | null; // Declare 'data' as an array of numbers or null.
    if (IO.staticFive === 5) {
      /* FIX: hardcode data to non-null */
      // Initializes a new array of 5 numbers. In ArkTS/TS, these elements will be 'undefined' by default.
      data = new Array<number>(5);
    } else {
      // This code path will not be executed in the current flow variant.
      // It is included to ensure the 'data' variable is always initialized
      // before its use, even if with a null value, for consistency with the original logic.
      data = null;
    }

    if (IO.staticFive === 5) {
      /* POTENTIAL FLAW: null dereference will occur if data is null */
      // Accessing 'data.length' when 'data' is null will cause a runtime error.
      IO.writeLine("" + data!.length); // Use non-null assertion '!' to replicate the original Java behavior where a null dereference is possible without a compile-time error.
    }
  }

  /* goodB2G1() - use badsource and goodsink by changing second IO.staticFive==5 to IO.staticFive!=5 */
  private goodB2G1(): void {
    let data: number[] | null; // Declare 'data' as an array of numbers or null.
    if (IO.staticFive === 5) {
      /* POTENTIAL FLAW: data is null */
      data = null;
    } else {
      // This code path will not be executed in the current flow variant.
      // It is included to ensure the 'data' variable is always initialized
      // before its use, even if with a null value, for consistency with the original logic.
      data = null;
    }

    if (IO.staticFive !== 5) {
      // This code path will not be executed in the current flow variant.
      IO.writeLine("Benign, fixed string");
    } else {
      /* FIX: validate that data is non-null */
      if (data !== null) {
        IO.writeLine("" + data.length);
      } else {
        IO.writeLine("data is null");
      }
    }
  }

  /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
  private goodB2G2(): void {
    let data: number[] | null; // Declare 'data' as an array of numbers or null.
    if (IO.staticFive === 5) {
      /* POTENTIAL FLAW: data is null */
      data = null;
    } else {
      // This code path will not be executed in the current flow variant.
      // It is included to ensure the 'data' variable is always initialized
      // before its use, even if with a null value, for consistency with the original logic.
      data = null;
    }

    if (IO.staticFive === 5) {
      /* FIX: validate that data is non-null */
      if (data !== null) {
        IO.writeLine("" + data.length);
      } else {
        IO.writeLine("data is null");
      }
    }
  }

  public good(): void {
    this.goodG2B1();
    this.goodG2B2();
    this.goodB2G1();
    this.goodB2G2();
  }

  /* This 'main' method is typically used for standalone testing or building
   * executable binaries for analysis tools. In a multi-file ArkTS/TS application,
   * this would not be the primary entry point for compilation and execution,
   * aligning with how source code analysis tools test applications.
   */
  static main(args: string[]): void {
    // In ArkTS/TS, command-line arguments are typically handled differently.
    // This call simulates the original logic of delegating to a parent class's static method.
    AbstractTestCase.mainFromParent(args);
  }
}