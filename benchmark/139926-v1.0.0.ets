/**
 * TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__String_22a.java
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-22a.tmpl.java
 */

/**
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 22 Control flow: Flow controlled by value of a public static variable. Sink functions are in a separate file from sources.
 */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_22a extends AbstractTestCase {
  /**
   * This static variable controls program flow in the sink function, simulating a global state.
   */
  static badPublicStatic: boolean = false;

  bad(): void {
    let data: string | null = null;

    // POTENTIAL FLAW: data is null
    data = null;

    CWE476_NULL_Pointer_Dereference__String_22a.badPublicStatic = true;
    (new CWE476_NULL_Pointer_Dereference__String_22b()).badSink(data);
  }

  /**
   * These static variables control program flow in the sink functions, simulating global state.
   */
  static goodB2G1PublicStatic: boolean = false;
  static goodB2G2PublicStatic: boolean = false;
  static goodG2BPublicStatic: boolean = false;

  good(): void {
    this.goodB2G1();
    this.goodB2G2();
    this.goodG2B();
  }

  /**
   * goodB2G1() - use badsource and goodsink by setting the static variable to false instead of true
   */
  private goodB2G1(): void {
    let data: string | null = null;

    // POTENTIAL FLAW: data is null
    data = null;

    CWE476_NULL_Pointer_Dereference__String_22a.goodB2G1PublicStatic = false;
    (new CWE476_NULL_Pointer_Dereference__String_22b()).goodB2G1Sink(data);
  }

  /**
   * goodB2G2() - use badsource and goodsink by reversing the blocks in the if in the sink function
   */
  private goodB2G2(): void {
    let data: string | null = null;

    // POTENTIAL FLAW: data is null
    data = null;

    CWE476_NULL_Pointer_Dereference__String_22a.goodB2G2PublicStatic = true;
    (new CWE476_NULL_Pointer_Dereference__String_22b()).goodB2G2Sink(data);
  }

  /**
   * goodG2B() - use goodsource and badsink
   */
  private goodG2B(): void {
    let data: string | null = null;

    // FIX: hardcode data to non-null
    data = "This is not null";

    CWE476_NULL_Pointer_Dereference__String_22a.goodG2BPublicStatic = true;
    (new CWE476_NULL_Pointer_Dereference__String_22b()).goodG2BSink(data);
  }

  /**
   * This is the main method, used for standalone testing or building binaries for analysis tools.
   * It is not used when compiling all test cases as one application.
   */
  static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}

/**
 * TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__String_22b.java
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-22b.tmpl.java
 */

/**
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 22 Control flow: Flow controlled by value of a public static variable. Sink functions are in a separate file from sources.
 */

import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_22b {
  badSink(data: string | null): void {
    if (CWE476_NULL_Pointer_Dereference__String_22a.badPublicStatic) {
      // POTENTIAL FLAW: null dereference will occur if data is null
      IO.writeLine("" + data.length); // String length is a property in ArkTS/TS, not a method
    } else {
      /**
       * This code path is unreachable, but it's kept to maintain the original structure and satisfy type checks.
       */
      data = null;
    }
  }

  /**
   * goodB2G1() - use badsource and goodsink by setting the static variable to false instead of true
   */
  goodB2G1Sink(data: string | null): void {
    if (CWE476_NULL_Pointer_Dereference__String_22a.goodB2G1PublicStatic) {
      /**
       * This code path is unreachable, but it's kept to maintain the original structure and satisfy type checks.
       */
      data = null;
    }
    else {
      // FIX: validate that data is non-null
      if (data !== null) {
        IO.writeLine("" + data.length);
      } else {
        IO.writeLine("data is null");
      }
    }
  }

  /**
   * goodB2G2() - use badsource and goodsink by reversing the blocks in the if in the sink function
   */
  goodB2G2Sink(data: string | null): void {
    if (CWE476_NULL_Pointer_Dereference__String_22a.goodB2G2PublicStatic) {
      // FIX: validate that data is non-null
      if (data !== null) {
        IO.writeLine("" + data.length);
      } else {
        IO.writeLine("data is null");
      }
    }
    else {
      /**
       * This code path is unreachable, but it's kept to maintain the original structure and satisfy type checks.
       */
      data = null;
    }
  }

  /**
   * goodG2B() - use goodsource and badsink
   */
  goodG2BSink(data: string | null): void {
    if (CWE476_NULL_Pointer_Dereference__String_22a.goodG2BPublicStatic) {
      // POTENTIAL FLAW: null dereference will occur if data is null
      IO.writeLine("" + data.length);
    }
    else {
      /**
       * This code path is unreachable, but it's kept to maintain the original structure and satisfy type checks.
       */
      data = null;
    }
  }
}