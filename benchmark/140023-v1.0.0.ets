/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_09.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-09.tmpl.ets
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: null_check_after_deref
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after the object has already been dereferenced
* Flow Variant: 09 Control flow: if(IO.STATIC_FINAL_TRUE) and if(IO.STATIC_FINAL_FALSE)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_09 extends AbstractTestCase {

  public bad(): void {
    if (IO.STATIC_FINAL_TRUE) {
      {
        let myString: string | null = null;
        myString = "Hello";
        // Dereferencing the string to get its length. At this point, 'myString' is inferred as non-null by TypeScript.
        IO.writeLine(myString.length);
        /* FLAW: Checking for null *after* the object has already been dereferenced.
         * In ArkTS, this check is redundant and does not prevent a prior dereference if 'myString' were null.
         * The current logic ensures 'myString' is non-null before the first use. */
        if (myString != null) {
          myString = "my, how I've changed";
        }
        // Dereferencing again. 'myString' is still a non-null string.
        IO.writeLine(myString.length);
      }
    }
  }

  /* good1() changes IO.STATIC_FINAL_TRUE to IO.STATIC_FINAL_FALSE */
  private good1(): void {
    if (IO.STATIC_FINAL_FALSE) {
      /* INCIDENTAL: CWE 561 Dead Code. The code within this block will never execute due to the condition. */
      IO.writeLine("Benign, fixed string");
    } else {

      {
        let myString: string | null = null;
        myString = "Hello";

        // Dereferencing the string to get its length. 'myString' is inferred as non-null by TypeScript here.
        IO.writeLine(myString.length);

        /* FIX: No null check is needed here. The previous use of 'myString' implies it was already non-null,
         * ensuring its validity at this point. */
        myString = "my, how I've changed";

        // Dereferencing again. 'myString' is still a non-null string.
        IO.writeLine(myString.length);
      }

    }
  }

  /* good2() reverses the bodies in the if statement */
  private good2(): void {
    if (IO.STATIC_FINAL_TRUE) {
      {
        let myString: string | null = null;
        myString = "Hello";
        // Dereferencing the string to get its length. 'myString' is inferred as non-null by TypeScript here.
        IO.writeLine(myString.length);
        /* FIX: No null check is needed here. The previous use of 'myString' implies it was already non-null,
         * ensuring its validity at this point. */
        myString = "my, how I've changed";
        // Dereferencing again. 'myString' is still a non-null string.
        IO.writeLine(myString.length);
      }
    }
  }

  public good(): void {
    this.good1();
    this.good2();
  }

  /* This is the entry point for running this test case independently.
   * It's typically used during development or for analyzing the compiled binary,
   * not when integrated into larger test suites. */
  public static main(args: string[]): void {
    AbstractTestCaseBase.mainFromParent(args);
  }
}
