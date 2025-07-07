// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_08.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-08.tmpl.java

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 08 Control flow: if(privateReturnsTrue()) and if(privateReturnsFalse())

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// To replicate the original logic and ensure the 'Method Call' null pointer type,
// we define a simple StringBuilder-like class as ArkTS does not have a direct
// equivalent with a 'length()' method for a mutable string builder.
class StringBuilder {
  private _value: string = "";

  constructor(initialValue: string = "") {
    this._value = initialValue;
  }

  public append(s: string): StringBuilder {
    this._value += s;
    return this;
  }

  public toString(): string {
    return this._value;
  }

  public length(): number { // This method is crucial to replicate the original 'Method Call' dereference.
    return this._value.length;
  }
}


export class CWE476_NULL_Pointer_Dereference__StringBuilder_08 extends AbstractTestCase {
  // These methods consistently return the same value, enabling static analysis tools to predict their outcomes.
  private privateReturnsTrue(): boolean {
    return true;
  }

  private privateReturnsFalse(): boolean {
    return false;
  }

  public bad(): void {
    // In ArkTS/TypeScript, we use 'null' to explicitly indicate the absence of an object.
    let data: StringBuilder | null;
    if (this.privateReturnsTrue()) {
      /* POTENTIAL FLAW: data is null */
      data = null;
    } else {
      // In ArkTS/TypeScript, variables often need to be initialized. This section, though unreachable, helps ensure 'data' is declared and assigned, similar to how it would prevent compiler errors in Java.
      data = null;
    }

    if (this.privateReturnsTrue()) {
      /* POTENTIAL FLAW: null dereference will occur if data is null */
      // The original bug is preserved. If 'data' is null, accessing 'length()' will cause a runtime error.
      IO.writeLine("" + (data as StringBuilder).length());
    }
  }

  /* goodG2B1() - use goodsource and badsink by changing first privateReturnsTrue() to privateReturnsFalse() */
  private goodG2B1(): void {
    let data: StringBuilder | null;
    if (this.privateReturnsFalse()) {
      // In ArkTS/TypeScript, variables often need to be initialized. This section, though unreachable, helps ensure 'data' is declared and assigned, similar to how it would prevent compiler errors in Java.
      data = null;
    } else {
      /* FIX: hardcode data to non-null */
      data = new StringBuilder();
    }

    if (this.privateReturnsTrue()) {
      /* POTENTIAL FLAW: null dereference will occur if data is null */
      // The original bug is preserved. If 'data' is null, accessing 'length()' will cause a runtime error.
      IO.writeLine("" + (data as StringBuilder).length());
    }
  }

  /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
  private goodG2B2(): void {
    let data: StringBuilder | null;
    if (this.privateReturnsTrue()) {
      /* FIX: hardcode data to non-null */
      data = new StringBuilder();
    } else {
      // In ArkTS/TypeScript, variables often need to be initialized. This section, though unreachable, helps ensure 'data' is declared and assigned, similar to how it would prevent compiler errors in Java.
      data = null;
    }

    if (this.privateReturnsTrue()) {
      /* POTENTIAL FLAW: null dereference will occur if data is null */
      // The original bug is preserved. If 'data' is null, accessing 'length()' will cause a runtime error.
      IO.writeLine("" + (data as StringBuilder).length());
    }
  }

  /* goodB2G1() - use badsource and goodsink by changing second privateReturnsTrue() to privateReturnsFalse() */
  private goodB2G1(): void {
    let data: StringBuilder | null;
    if (this.privateReturnsTrue()) {
      /* POTENTIAL FLAW: data is null */
      data = null;
    } else {
      // In ArkTS/TypeScript, variables often need to be initialized. This section, though unreachable, helps ensure 'data' is declared and assigned, similar to how it would prevent compiler errors in Java.
      data = null;
    }

    if (this.privateReturnsFalse()) {
      // This section represents dead code, which will not execute.
      IO.writeLine("Benign, fixed string");
    } else {
      /* FIX: validate that data is non-null */
      if (data != null) {
        IO.writeLine("" + data.length());
      } else {
        IO.writeLine("data is null");
      }
    }
  }

  /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
  private goodB2G2(): void {
    let data: StringBuilder | null;
    if (this.privateReturnsTrue()) {
      /* POTENTIAL FLAW: data is null */
      data = null;
    } else {
      // In ArkTS/TypeScript, variables often need to be initialized. This section, though unreachable, helps ensure 'data' is declared and assigned, similar to how it would prevent compiler errors in Java.
      data = null;
    }

    if (this.privateReturnsTrue()) {
      /* FIX: validate that data is non-null */
      if (data != null) {
        IO.writeLine("" + data.length());
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

  // The main method serves for isolated testing or generating a standalone executable for binary analysis. It's not utilized when integrating these test cases into a larger application for source code analysis.
  public static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}