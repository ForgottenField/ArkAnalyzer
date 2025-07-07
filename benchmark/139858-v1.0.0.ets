/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_52c.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-52c.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 52 Data flow: data passed as an argument from one method to another to another in three different classes in the same package
 *
 * */

import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_52c {
  public badSink(data: number | null): void {
    // POTENTIAL FLAW: A null dereference will occur if 'data' is null.
    IO.writeLine('' + data!.toString());
  }

  /* goodG2B() - use goodsource and badsink */
  public goodG2BSink(data: number | null): void {
    // POTENTIAL FLAW: A null dereference will occur if 'data' is null.
    IO.writeLine('' + data!.toString());
  }

  /* goodB2G() - use badsource and goodsink */
  public goodB2GSink(data: number | null): void {
    // FIX: Validate that 'data' is not null.
    if (data !== null) {
      IO.writeLine('' + data.toString());
    } else {
      IO.writeLine('data is null');
    }
  }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_52b.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-52b.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 52 Data flow: data passed as an argument from one method to another to another in three different classes in the same package
 *
 * */


export class CWE476_NULL_Pointer_Dereference__Integer_52b {
  public badSink(data: number | null): void {
    (new CWE476_NULL_Pointer_Dereference__Integer_52c()).badSink(data);
  }

  /* goodG2B() - use goodsource and badsink */
  public goodG2BSink(data: number | null): void {
    (new CWE476_NULL_Pointer_Dereference__Integer_52c()).goodG2BSink(data);
  }

  /* goodB2G() - use badsource and goodsink */
  public goodB2GSink(data: number | null): void {
    (new CWE476_NULL_Pointer_Dereference__Integer_52c()).goodB2GSink(data);
  }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_52a.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-52a.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 52 Data flow: data passed as an argument from one method to another to another in three different classes in the same package
 *
 * */

import { AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_52a extends AbstractTestCase {
  public bad(): void {
    let data: number | null;

    // POTENTIAL FLAW: 'data' is assigned null.
    data = null;

    (new CWE476_NULL_Pointer_Dereference__Integer_52b()).badSink(data);
  }

  public good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  /* goodG2B() - use goodsource and badsink */
  private goodG2B(): void {
    let data: number | null;

    // FIX: Assign a non-null value to 'data'.
    data = 5;

    (new CWE476_NULL_Pointer_Dereference__Integer_52b()).goodG2BSink(data);
  }

  /* goodB2G() - use badsource and goodsink */
  private goodB2G(): void {
    let data: number | null;

    // POTENTIAL FLAW: 'data' is assigned null.
    data = null;

    (new CWE476_NULL_Pointer_Dereference__Integer_52b()).goodB2GSink(data);
  }

  /* The following 'main' function is for standalone testing. It is not executed when this code is part of a larger application in ArkTS. */
  public static main(args: string[]): void {
    AbstractTestCase.mainFromParent(args);
  }
}
