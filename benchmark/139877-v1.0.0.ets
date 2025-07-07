/* TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_07.java
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-07.tmpl.java
 */
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 07 Control flow: if(privateFive==5) and if(privateFive!=5)
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_07 extends AbstractTestCase {
  /* This variable is not declared 'readonly', but its value remains constant
   * after initialization, which a static analysis tool could identify. */
  private privateFive: number = 5;

  public bad(): void {
    let data: string | null;
    if (this.privateFive === 5) {
      /* POTENTIAL FLAW: data is null */
      data = null;
    } else {
      /* INCIDENTAL: CWE 561 Dead Code, the code below will never run,
       * but it ensures data is initialized to satisfy type checks and prevent
       * potential runtime issues related to uninitialized variables. */
      data = null;
    }

    if (this.privateFive === 5) {
      /* POTENTIAL FLAW: null dereference will occur if data is null */
      IO.writeLine("" + data!.length);
    }
  }

  /* goodG2B1() - use goodsource and badsink by changing first privateFive==5 to privateFive!=5 */
  private goodG2B1(): void {
    let data: string | null;
    if (this.privateFive !== 5) {
      /* INCIDENTAL: CWE 561 Dead Code, the code below will never run,
       * but it ensures data is initialized to satisfy type checks and prevent
       * potential runtime issues related to uninitialized variables. */
      data = null;
    } else {
      /* FIX: hardcode data to non-null */
      data = "";
    }

    if (this.privateFive === 5) {
      /* POTENTIAL FLAW: null dereference will occur if data is null */
      IO.writeLine("" + data!.length);
    }
  }

  /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
  private goodG2B2(): void {
    let data: string | null;
    if (this.privateFive === 5) {
      /* FIX: hardcode data to non-null */
      data = "";
    } else {
      /* INCIDENTAL: CWE 561 Dead Code, the code below will never run,
       * but it ensures data is initialized to satisfy type checks and prevent
       * potential runtime issues related to uninitialized variables. */
      data = null;
    }

    if (this.privateFive === 5) {
      /* POTENTIAL FLAW: null dereference will occur if data is null */
      IO.writeLine("" + data!.length);
    }
  }

  /* goodB2G1() - use badsource and goodsink by changing second privateFive==5 to privateFive!=5 */
  private goodB2G1(): void {
    let data: string | null;
    if (this.privateFive === 5) {
      /* POTENTIAL FLAW: data is null */
      data = null;
    } else {
      /* INCIDENTAL: CWE 561 Dead Code, the code below will never run,
       * but it ensures data is initialized to satisfy type checks and prevent
       * potential runtime issues related to uninitialized variables. */
      data = null;
    }

    if (this.privateFive !== 5) {
      /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
      IO.writeLine("Benign, fixed string");
    } else {
      /* FIX: validate that data is non-null */
      if (data != null) {
        IO.writeLine("" + data.length);
      } else {
        IO.writeLine("data is null");
      }
    }
  }

  /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
  private goodB2G2(): void {
    let data: string | null;
    if (this.privateFive === 5) {
      /* POTENTIAL FLAW: data is null */
      data = null;
    } else {
      /* INCIDENTAL: CWE 561 Dead Code, the code below will never run,
       * but it ensures data is initialized to satisfy type checks and prevent
       * potential runtime issues related to uninitialized variables. */
      data = null;
    }

    if (this.privateFive === 5) {
      /* FIX: validate that data is non-null */
      if (data != null) {
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

  /* Below is the main(). It is only used when building this testcase on
   * its own for testing or for building a binary to use in testing binary
   * analysis tools. It is not used when compiling all the testcases as one
   * application, which is how source code analysis tools are tested.
   */
  public static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}