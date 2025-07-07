// Import necessary classes from the testcasesupport module.
import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_01 extends AbstractTestCase {
  public bad(): void {
    {
      let myString: string | null = null; // Declare myString and initialize to null, simulating a potential null value.

      // FLAW: Using a single '&' (bitwise AND) in the 'if' statement will cause both sides of the expression to be evaluated,
      // even if the left side ('myString != null') is false. This leads to a null pointer dereference
      // when attempting to access 'myString.length' if 'myString' is null.
      if ((myString != null) & (myString.length > 0)) {
        IO.writeLine("The string length is greater than 0");
      }
    }
  }

  public good(): void {
    this.good1();
  }

  private good1(): void {
    {
      let myString: string | null = null; // Declare myString and initialize to null.

      // FIX: Use '&&' (logical AND) in the 'if' statement. This operator short-circuits evaluation.
      // If the left side of the expression ('myString != null') is false, the right side ('myString.length > 0')
      // will not be evaluated, thereby preventing the null dereference.
      if ((myString != null) && (myString.length > 0)) {
        IO.writeLine("The string length is greater than 0");
      }
    }
  }

  /*
   * Below is the main() equivalent. This static method is typically used when building this test case
   * independently for testing or for creating a compiled binary for analysis tools.
   * It is generally not used when compiling all test cases together as a single application,
   * which is the common approach for testing source code analysis tools.
   */
  public static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}