/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_09.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-09.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Assigns 'null' to the variable.
* GoodSource: Assigns a non-null value to the variable.
* Sinks:
*    GoodSink: Includes a check to prevent a null dereference.
*    BadSink : Allows for a potential null dereference.
* Flow Variant: 09 Control flow: if(IO.STATIC_FINAL_TRUE) and if(IO.STATIC_FINAL_FALSE)
*
* */

// A minimal StringBuilder class is defined here to replicate Java's StringBuilder behavior,
// specifically to ensure the 'length()' method call for accurate bug replication.
class StringBuilder {
  private _value: string;

  constructor(initialValue: string = "") {
    this._value = initialValue;
  }

  // This method returns the length of the internal string, replicating the behavior of Java's StringBuilder.length().
  length(): number {
    return this._value.length;
  }

  // This method provides the string representation, replicating Java's StringBuilder.toString().
  toString(): string {
    return this._value;
  }
}

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_09 extends AbstractTestCase {

  public bad(): void {
    let data: StringBuilder | null; // Declares 'data' as a variable that can hold a StringBuilder instance or 'null'.
    if (IO.STATIC_FINAL_TRUE) {
      // POTENTIAL FLAW: 'data' is assigned 'null'.
      data = null;
    } else {
      // INCIDENTAL: CWE 561 Dead Code. This code path will never be executed,
      // but is included to ensure 'data' is initialized before its use, preventing compile-time errors.
      data = null;
    }

    if (IO.STATIC_FINAL_TRUE) {
      // POTENTIAL FLAW: A null dereference will occur here if 'data' is 'null' when length() is called.
      // An explicit cast to 'any' is used to bypass TypeScript's null safety checks,
      // thereby replicating the original Java vulnerability.
      IO.writeLine("" + (data as any).length());
    }
  }

  /* goodG2B1() - uses a good source and a bad sink by changing the first IO.STATIC_FINAL_TRUE to IO.STATIC_FINAL_FALSE */
  private goodG2B1(): void {
    let data: StringBuilder | null;
    if (IO.STATIC_FINAL_FALSE) {
      // INCIDENTAL: CWE 561 Dead Code. This code path will never be executed,
      // but is included to ensure 'data' is initialized before its use, preventing compile-time errors.
      data = null;
    } else {
      // FIX: 'data' is explicitly initialized to a non-null instance.
      data = new StringBuilder();
    }

    if (IO.STATIC_FINAL_TRUE) {
      // POTENTIAL FLAW: A null dereference will occur here if 'data' is 'null' when length() is called.
      // An explicit cast to 'any' is used to bypass TypeScript's null safety checks,
      // thereby replicating the original Java vulnerability.
      IO.writeLine("" + (data as any).length());
    }
  }

  /* goodG2B2() - uses a good source and a bad sink by reversing statements in the first if */
  private goodG2B2(): void {
    let data: StringBuilder | null;
    if (IO.STATIC_FINAL_TRUE) {
      // FIX: 'data' is explicitly initialized to a non-null instance.
      data = new StringBuilder();
    } else {
      // INCIDENTAL: CWE 561 Dead Code. This code path will never be executed,
      // but is included to ensure 'data' is initialized before its use, preventing compile-time errors.
      data = null;
    }

    if (IO.STATIC_FINAL_TRUE) {
      // POTENTIAL FLAW: A null dereference will occur here if 'data' is 'null' when length() is called.
      // An explicit cast to 'any' is used to bypass TypeScript's null safety checks,
      // thereby replicating the original Java vulnerability.
      IO.writeLine("" + (data as any).length());
    }
  }

  /* goodB2G1() - uses a bad source and a good sink by changing the second IO.STATIC_FINAL_TRUE to IO.STATIC_FINAL_FALSE */
  private goodB2G1(): void {
    let data: StringBuilder | null;
    if (IO.STATIC_FINAL_TRUE) {
      // POTENTIAL FLAW: 'data' is assigned 'null'.
      data = null;
    } else {
      // INCIDENTAL: CWE 561 Dead Code. This code path will never be executed,
      // but is included to ensure 'data' is initialized before its use, preventing compile-time errors.
      data = null;
    }

    if (IO.STATIC_FINAL_FALSE) {
      // INCIDENTAL: CWE 561 Dead Code. This code path will never be executed.
      IO.writeLine("Benign, fixed string");
    } else {
      // FIX: Validates that 'data' is not 'null' before attempting to use it.
      if (data != null) {
        IO.writeLine("" + data.length());
      } else {
        IO.writeLine("data is null");
      }
    }
  }

  /* goodB2G2() - uses a bad source and a good sink by reversing statements in the second if */
  private goodB2G2(): void {
    let data: StringBuilder | null;
    if (IO.STATIC_FINAL_TRUE) {
      // POTENTIAL FLAW: 'data' is assigned 'null'.
      data = null;
    } else {
      // INCIDENTAL: CWE 561 Dead Code. This code path will never be executed,
      // but is included to ensure 'data' is initialized before its use, preventing compile-time errors.
      data = null;
    }

    if (IO.STATIC_FINAL_TRUE) {
      // FIX: Validates that 'data' is not 'null' before attempting to use it.
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

  /* Below is the main(). It is only used when building this testcase on
   * its own for testing or for building a binary to use in testing binary
   * analysis tools. It is not used when compiling all the testcases as one
   * application, which is how source code analysis tools are tested.
   */
  public static mainFromParent(args: string[]): void {
    // In ArkTS, the execution entry point typically differs from Java's static main.
    // This method is maintained for structure fidelity within the test harness context.
    // It is intended for use when building this test case independently or for binary analysis,
    // and not when compiling all test cases as a single application.
    AbstractTestCase.mainFromParent(args);
  }
}