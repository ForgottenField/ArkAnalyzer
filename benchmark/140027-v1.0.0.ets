/* TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_13.java
 * Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
 * Template File: point-flaw-13.tmpl.java
 */
/*
 * @description
 * CWE: 476 NULL Pointer Dereference
 * Sinks: null_check_after_deref
 *    GoodSink: Do not check for null after the object has been dereferenced
 *    BadSink : Check for null after the object has already been dereferenced
 * Flow Variant: 13 Control flow: if(IO.STATIC_FINAL_FIVE===5) and if(IO.STATIC_FINAL_FIVE!==5)
 *
 * */

import { IO, AbstractTestCase, mainFromParent } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_13 extends AbstractTestCase {
  bad(): void {
    if (IO.STATIC_FINAL_FIVE === 5) {
      {
        let myString: string | null = null;
        myString = "Hello";
        // The original logic accesses the string length. We use the non-null assertion operator
        // to confirm to the ArkTS compiler that myString is not null here, mirroring Java's behavior.
        IO.writeLine(myString!.length);
        /* FLAW: This null check is redundant as the object has already been dereferenced and guaranteed to be non-null. */
        if (myString !== null) {
          myString = "my, how I've changed";
        }
        IO.writeLine(myString!.length);
      }
    }
  }

  // This good1 method changes the control flow condition to IO.STATIC_FINAL_FIVE !== 5.
  private good1(): void {
    if (IO.STATIC_FINAL_FIVE !== 5) {
      /* INCIDENTAL: CWE 561 Dead Code, the code below will never execute due to the condition. */
      IO.writeLine("Benign, fixed string");
    } else {
      {
        let myString: string | null = null;
        myString = "Hello";

        IO.writeLine(myString!.length);

        /* FIX: A null check is not needed here as the object is guaranteed to be non-null. */
        myString = "my, how I've changed";

        IO.writeLine(myString!.length);
      }
    }
  }

  // This good2 method reverses the code blocks in the conditional statement.
  private good2(): void {
    if (IO.STATIC_FINAL_FIVE === 5) {
      {
        let myString: string | null = null;
        myString = "Hello";
        IO.writeLine(myString!.length);
        /* FIX: A null check is not needed here as the object is guaranteed to be non-null. */
        myString = "my, how I've changed";
        IO.writeLine(myString!.length);
      }
    }
  }

  public good(): void {
    this.good1();
    this.good2();
  }

  /*
   * This main method is used for standalone testing of this test case
   * or for building a binary for testing binary analysis tools.
   * It is not used when compiling all test cases as a single application,
   * which is how source code analysis tools are typically tested.
   */
  static main(args: string[]): void {
    mainFromParent(args);
  }
}
