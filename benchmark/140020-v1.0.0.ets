import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__null_check_after_deref_06 extends AbstractTestCase {
  // This variable is declared as 'readonly' and 'static', ensuring its value remains constant after initialization.
  private static readonly PRIVATE_STATIC_FINAL_FIVE: number = 5;

  public bad(): void {
    if (CWE476_NULL_Pointer_Dereference__null_check_after_deref_06.PRIVATE_STATIC_FINAL_FIVE == 5) {
      {
        let myString: string | null = null;
        myString = "Hello";
        IO.writeLine(myString!.length);
        // FLAW: This null check is redundant as the string has already been used and guaranteed to be non-null.
        if (myString != null) {
          myString = "my, how I've changed";
        }
        IO.writeLine(myString!.length);
      }
    }
  }

  // good1() changes PRIVATE_STATIC_FINAL_FIVE==5 to PRIVATE_STATIC_FINAL_FIVE!=5
  private good1(): void {
    if (CWE476_NULL_Pointer_Dereference__null_check_after_deref_06.PRIVATE_STATIC_FINAL_FIVE != 5) {
      // INCIDENTAL: This code is unreachable due to the conditional logic.
      IO.writeLine("Benign, fixed string");
    } else {
      {
        let myString: string | null = null;
        myString = "Hello";

        IO.writeLine(myString!.length);

        // FIX: No null check is needed here, as the object is guaranteed to be non-null from prior operations.
        myString = "my, how I've changed";

        IO.writeLine(myString!.length);
      }
    }
  }

  // good2() reverses the bodies in the if statement
  private good2(): void {
    if (CWE476_NULL_Pointer_Dereference__null_check_after_deref_06.PRIVATE_STATIC_FINAL_FIVE == 5) {
      {
        let myString: string | null = null;
        myString = "Hello";
        IO.writeLine(myString!.length);
        // FIX: No null check is needed here, as the object is guaranteed to be non-null from prior operations.
        myString = "my, how I've changed";
        IO.writeLine(myString!.length);
      }
    }
  }

  public good(): void {
    this.good1();
    this.good2();
  }

  // This 'main' method is provided for standalone testing and analysis, not for general application compilation.
  public static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}