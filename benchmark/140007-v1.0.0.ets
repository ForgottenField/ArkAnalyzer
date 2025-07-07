// Imports from the specified relative path for testcase support.
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/*
 * This class replicates the static nested 'Container' class from Java.
 * It is defined at the top-level within this combined file to be accessible by
 * both CWE476_NULL_Pointer_Dereference__int_array_67a and
 * CWE476_NULL_Pointer_Dereference__int_array_67b classes, mimicking the Java
 * static nested class behavior without requiring inter-file imports in this
 * single-file representation.
 */
export class Container {
  public containerOne: number[] | null; // Represents an integer array that can hold a null reference.
}

/* TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__int_array_67b.ts
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-67b.tmpl.ts
 */
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource: Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 67 Data flow: data passed in a class from one method to another in different files/modules.
 */
export class CWE476_NULL_Pointer_Dereference__int_array_67b {
  public badSink(dataContainer: Container): void {
    const data: number[] | null = dataContainer.containerOne;

    // POTENTIAL FLAW: A null pointer dereference will occur here if 'data' is null.
    // This replicates the original Java behavior where 'data.length' would throw a NullPointerException.
    IO.writeLine("" + data.length);
  }

  /* goodG2B() - uses a good source and a bad sink */
  public goodG2BSink(dataContainer: Container): void {
    const data: number[] | null = dataContainer.containerOne;

    // POTENTIAL FLAW: A null pointer dereference will occur here if 'data' is null.
    // This replicates the original Java behavior where 'data.length' would throw a NullPointerException.
    IO.writeLine("" + data.length);
  }

  /* goodB2G() - uses a bad source and a good sink */
  public goodB2GSink(dataContainer: Container): void {
    const data: number[] | null = dataContainer.containerOne;

    // FIX: Validates that 'data' is not null before attempting to access its length.
    if (data !== null) {
      IO.writeLine("" + data.length);
    } else {
      IO.writeLine("data is null");
    }
  }
}

/* TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__int_array_67a.ts
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-67a.tmpl.ts
 */
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource: Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 67 Data flow: data passed in a class from one method to another in different files/modules.
 */
export class CWE476_NULL_Pointer_Dereference__int_array_67a extends AbstractTestCase {
  public bad(): void {
    let data: number[] | null;

    // To replicate the original logic, 'data' is intentionally set to null here.
    data = null;

    const dataContainer = new Container(); // Uses the globally accessible Container class within this file.
    dataContainer.containerOne = data;
    new CWE476_NULL_Pointer_Dereference__int_array_67b().badSink(dataContainer);
  }

  public good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  /* goodG2B() - uses a good source and a bad sink */
  private goodG2B(): void {
    let data: number[] | null;

    // FIX: 'data' is initialized to a non-null array.
    data = new Array<number>(5); // Creates an array of 5 undefined elements, replicating Java's default array creation.

    const dataContainer = new Container();
    dataContainer.containerOne = data;
    new CWE476_NULL_Pointer_Dereference__int_array_67b().goodG2BSink(dataContainer);
  }

  /* goodB2G() - uses a bad source and a good sink */
  private goodB2G(): void {
    let data: number[] | null;

    // To replicate the original logic, 'data' is intentionally set to null here.
    data = null;

    const dataContainer = new Container();
    dataContainer.containerOne = data;
    new CWE476_NULL_Pointer_Dereference__int_array_67b().goodB2GSink(dataContainer);
  }

  /*
   * The 'main' method is typically used for standalone testing or for building a binary for analysis tools.
   * It is not used when compiling all test cases as part of a larger application, which is how source code
   * analysis tools are usually tested.
   */
  public static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}