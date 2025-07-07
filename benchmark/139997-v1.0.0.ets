/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_22b.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-22b.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 22 Control flow: Flow controlled by value of a public static variable. Sink functions are in a separate file from sources.
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_22b {
  badSink(data: number[] | null): void {
    if (CWE476_NULL_Pointer_Dereference__int_array_22a.badPublicStatic)
    {
      /* POTENTIAL FLAW: null dereference will occur if data is null */
      IO.writeLine("" + data!.length); // Using '!' to suppress TypeScript's null check to replicate the original bug.
    }
    else
    {
      /* INCIDENTAL: CWE 561 Dead Code. This code will not execute but ensures `data` is initialized before the sink for replication purposes. */
      data = null;
    }
  }

  /* goodB2G1() - use badsource and goodsink by setting the static variable to false instead of true */
  goodB2G1Sink(data: number[] | null): void {
    if (CWE476_NULL_Pointer_Dereference__int_array_22a.goodB2G1PublicStatic)
    {
      /* INCIDENTAL: CWE 561 Dead Code. This code will not execute but ensures `data` is initialized before the sink for replication purposes. */
      data = null;
    }
    else
    {

      /* FIX: validate that data is non-null */
      if (data != null)
      {
        IO.writeLine("" + data.length);
      }
      else
      {
        IO.writeLine("data is null");
      }

    }
  }

  /* goodB2G2() - use badsource and goodsink by reversing the blocks in the if in the sink function */
  goodB2G2Sink(data: number[] | null): void {
    if (CWE476_NULL_Pointer_Dereference__int_array_22a.goodB2G2PublicStatic)
    {
      /* FIX: validate that data is non-null */
      if (data != null)
      {
        IO.writeLine("" + data.length);
      }
      else
      {
        IO.writeLine("data is null");
      }
    }
    else
    {
      /* INCIDENTAL: CWE 561 Dead Code. This code will not execute but ensures `data` is initialized before the sink for replication purposes. */
      data = null;
    }
  }

  /* goodG2B() - use goodsource and badsink */
  goodG2BSink(data: number[] | null): void {
    if (CWE476_NULL_Pointer_Dereference__int_array_22a.goodG2BPublicStatic)
    {
      /* POTENTIAL FLAW: null dereference will occur if data is null */
      IO.writeLine("" + data!.length); // Using '!' to suppress TypeScript's null check to replicate the original bug.
    }
    else
    {
      /* INCIDENTAL: CWE 561 Dead Code. This code will not execute but ensures `data` is initialized before the sink for replication purposes. */
      data = null;
    }
  }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_22a.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-22a.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 22 Control flow: Flow controlled by value of a public static variable. Sink functions are in a separate file from sources.
 *
 * */

// Import statements are already at the top of the combined file.

export class CWE476_NULL_Pointer_Dereference__int_array_22a extends AbstractTestCase
{
  /* This public static variable controls the flow in the sink function, replicating a global variable's behavior. */
  static badPublicStatic: boolean = false;

  bad(): void
  {
    let data: number[] | null = null;

    /* POTENTIAL FLAW: data is null */
    data = null;

    CWE476_NULL_Pointer_Dereference__int_array_22a.badPublicStatic = true;
    (new CWE476_NULL_Pointer_Dereference__int_array_22b()).badSink(data);
  }

  /* This public static variable controls the flow in the sink function, replicating a global variable's behavior. */
  static goodB2G1PublicStatic: boolean = false;
  static goodB2G2PublicStatic: boolean = false;
  static goodG2BPublicStatic: boolean = false;

  good(): void
  {
    this.goodB2G1();
    this.goodB2G2();
    this.goodG2B();
  }

  /* goodB2G1() - use badsource and goodsink by setting the static variable to false instead of true */
  private goodB2G1(): void
  {
    let data: number[] | null = null;

    /* POTENTIAL FLAW: data is null */
    data = null;

    CWE476_NULL_Pointer_Dereference__int_array_22a.goodB2G1PublicStatic = false;
    (new CWE476_NULL_Pointer_Dereference__int_array_22b()).goodB2G1Sink(data);
  }

  /* goodB2G2() - use badsource and goodsink by reversing the blocks in the if in the sink function */
  private goodB2G2(): void
  {
    let data: number[] | null = null;

    /* POTENTIAL FLAW: data is null */
    data = null;

    CWE476_NULL_Pointer_Dereference__int_array_22a.goodB2G2PublicStatic = true;
    (new CWE476_NULL_Pointer_Dereference__int_array_22b()).goodB2G2Sink(data);
  }

  /* goodG2B() - use goodsource and badsink */
  private goodG2B(): void
  {
    let data: number[] | null = null;

    /* FIX: hardcode data to non-null */
    data = new Array<number>(5);

    CWE476_NULL_Pointer_Dereference__int_array_22a.goodG2BPublicStatic = true;
    (new CWE476_NULL_Pointer_Dereference__int_array_22b()).goodG2BSink(data);
  }

  /* Below is the main(). It is only used when building this testcase on
   * its own for testing or for building a binary to use in testing binary
   * analysis tools. It is not used when compiling all the testcases as one
   * application, which is how source code analysis tools are tested.
   */
  static main(args: string[]): void
  {
    AbstractTestCase.mainFromParent(args);
  }
}