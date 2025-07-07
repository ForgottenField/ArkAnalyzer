// Define a simple class to simulate StringBuilder behavior for this test case,
// allowing a 'length()' method call for accurate null dereference type replication.
class MyStringBuilder {
  private _value: string = '';

  constructor(initialValue: string = '') {
    this._value = initialValue;
  }

  /**
   * Returns the length of the string content.
   * @returns The length of the string.
   */
  length(): number {
    return this._value.length;
  }

  /**
   * Appends a string representation of the argument to the sequence.
   * @param str The string to append.
   * @returns This MyStringBuilder instance.
   */
  append(str: string): MyStringBuilder {
    this._value += str;
    return this;
  }

  /**
   * Converts the contents of the MyStringBuilder to a String.
   * @returns The string representation.
   */
  toString(): string {
    return this._value;
  }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_02.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-02.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 02 Control flow: if(true) and if(false)

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_02 extends AbstractTestCase {

  // This method simulates Java's 'throws Throwable' by potentially causing a runtime error.
  bad(): void {
    let data: MyStringBuilder | null;
    if (true) {
      // POTENTIAL FLAW: 'data' is assigned null.
      data = null;
    } else {
      // INCIDENTAL: This code is unreachable due to the 'if (true)' condition.
      // (In original Java, this ensures 'data' is initialized before the Sink to avoid compiler errors. In ArkTS, explicit initialization or union types handle this.)
      data = null;
    }

    if (true) {
      // POTENTIAL FLAW: A null dereference will occur if 'data' is null when attempting to call 'length()'.
      IO.writeLine("" + data.length());
    }
  }

  // goodG2B1() - use goodsource and badsink by changing first true to false
  private goodG2B1(): void {
    let data: MyStringBuilder | null;
    if (false) {
      // INCIDENTAL: This code is unreachable due to the 'if (false)' condition.
      // (In original Java, this ensures 'data' is initialized before the Sink to avoid compiler errors. In ArkTS, explicit initialization or union types handle this.)
      data = null;
    } else {
      // FIX: 'data' is assigned a non-null value.
      data = new MyStringBuilder();
    }

    if (true) {
      // POTENTIAL FLAW: A null dereference will occur if 'data' is null when attempting to call 'length()'.
      IO.writeLine("" + data.length());
    }
  }

  // goodG2B2() - use goodsource and badsink by reversing statements in first if
  private goodG2B2(): void {
    let data: MyStringBuilder | null;
    if (true) {
      // FIX: 'data' is assigned a non-null value.
      data = new MyStringBuilder();
    } else {
      // INCIDENTAL: This code is unreachable due to the 'if (false)' condition.
      // (In original Java, this ensures 'data' is initialized before the Sink to avoid compiler errors. In ArkTS, explicit initialization or union types handle this.)
      data = null;
    }

    if (true) {
      // POTENTIAL FLAW: A null dereference will occur if 'data' is null when attempting to call 'length()'.
      IO.writeLine("" + data.length());
    }
  }

  // goodB2G1() - use badsource and goodsink by changing second true to false
  private goodB2G1(): void {
    let data: MyStringBuilder | null;
    if (true) {
      // POTENTIAL FLAW: 'data' is assigned null.
      data = null;
    } else {
      // INCIDENTAL: This code is unreachable due to the 'if (true)' condition.
      // (In original Java, this ensures 'data' is initialized before the Sink to avoid compiler errors. In ArkTS, explicit initialization or union types handle this.)
      data = null;
    }

    if (false) {
      // INCIDENTAL: This code is unreachable due to the 'if (false)' condition.
      IO.writeLine("Benign, fixed string");
    } else {
      // FIX: Validates that 'data' is not null before use.
      if (data != null) {
        IO.writeLine("" + data.length());
      } else {
        IO.writeLine("data is null");
      }
    }
  }

  // goodB2G2() - use badsource and goodsink by reversing statements in second if
  private goodB2G2(): void {
    let data: MyStringBuilder | null;
    if (true) {
      // POTENTIAL FLAW: 'data' is assigned null.
      data = null;
    } else {
      // INCIDENTAL: This code is unreachable due to the 'if (true)' condition.
      // (In original Java, this ensures 'data' is initialized before the Sink to avoid compiler errors. In ArkTS, explicit initialization or union types handle this.)
      data = null;
    }

    if (true) {
      // FIX: Validates that 'data' is not null before use.
      if (data != null) {
        IO.writeLine("" + data.length());
      }
      else {
        IO.writeLine("data is null");
      }
    }
  }

  good(): void {
    this.goodG2B1();
    this.goodG2B2();
    this.goodB2G1();
    this.goodB2G2();
  }

  // Below is the main(). It is only used when building this testcase on
  // its own for testing or for building a binary to use in testing binary
  // analysis tools. It is not used when compiling all the testcases as one
  // application, which is how source code analysis tools are tested.
  // In ArkTS, 'throws ClassNotFoundException, InstantiationException, IllegalAccessException' are Java-specific checked exceptions
  // and are not directly translated. 'mainFromParent' would handle the test harness setup.
  static main(args: string[]): void {
    AbstractTestCaseBase.mainFromParent(args);
  }
}