/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__null_check_after_deref_05.java
Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
Template File: point-flaw-05.tmpl.java
*/
/*
* @description
* CWE: 476 NULL Pointer Dereference
* Sinks: null_check_after_deref
*    GoodSink: Do not check for null after the object has been dereferenced
*    BadSink : Check for null after the object has already been dereferenced
* Flow Variant: 05 Control flow: if(privateTrue) and if(privateFalse)
*
* */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_05 extends AbstractTestCase {

  /* The variables below are not declared as 'readonly' or 'const',
   * but are never assigned any other value. A static analysis tool
   * should be able to determine that reads of these will always
   * return their initialized values.
   */
  private privateTrue: boolean = true;
  private privateFalse: boolean = false;

  public bad(): void {
    if (this.privateTrue) {
      {
        let myString: string | null = null;
        myString = "Hello";
        // The 'length' property is accessed on 'myString'. In Java, this was a method call.
        // If 'myString' were null at this point, this operation would lead to a runtime error.
        IO.writeLine(myString.length);
        /* FLAW: A null check is performed after the object has already been dereferenced. This check is redundant. */
        if (myString !== null) {
          myString = "my, how I've changed";
        }
        IO.writeLine(myString.length);
      }
    }
  }

  /* good1() changes privateTrue to privateFalse */
  private good1(): void {
    if (this.privateFalse) {
      /* INCIDENTAL: This code is unreachable due to the conditional logic. */
      IO.writeLine("Benign, fixed string");
    } else {

      {
        let myString: string | null = null;
        myString = "Hello";

        IO.writeLine(myString.length);

        /* FIX: A null check is not needed here, as the code flow ensures the object is not null. */
        myString = "my, how I've changed";

        IO.writeLine(myString.length);
      }

    }
  }

  /* good2() reverses the bodies in the if statement */
  private good2(): void {
    if (this.privateTrue) {
      {
        let myString: string | null = null;
        myString = "Hello";
        IO.writeLine(myString.length);
        /* FIX: A null check is not needed here, as the code flow ensures the object is not null. */
        myString = "my, how I've changed";
        IO.writeLine(myString.length);
      }
    }
  }

  public good(): void {
    this.good1();
    this.good2();
  }

  /* This 'main' function is for standalone testing or binary analysis.
   * It is not used when test cases are compiled together as a single application
   * for source code analysis.
   */
  static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}
