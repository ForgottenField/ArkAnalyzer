// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_53c.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-53c.tmpl.ts
//
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 53 Data flow: data passed as an argument from one method through two others to a fourth; all four functions are in different classes in the same package
//
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_53c {
  badSink(data: number | null): void {
    new CWE476_NULL_Pointer_Dereference__Integer_53d().badSink(data);
  }

  /* goodG2B() - use goodsource and badsink */
  goodG2BSink(data: number | null): void {
    new CWE476_NULL_Pointer_Dereference__Integer_53d().goodG2BSink(data);
  }

  /* goodB2G() - use badsource and goodsink */
  goodB2GSink(data: number | null): void {
    new CWE476_NULL_Pointer_Dereference__Integer_53d().goodB2GSink(data);
  }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_53b.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-53b.tmpl.ts
//
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 53 Data flow: data passed as an argument from one method through two others to a fourth; all four functions are in different classes in the same package
//
export class CWE476_NULL_Pointer_Dereference__Integer_53b {
  badSink(data: number | null): void {
    new CWE476_NULL_Pointer_Dereference__Integer_53c().badSink(data);
  }

  /* goodG2B() - use goodsource and badsink */
  goodG2BSink(data: number | null): void {
    new CWE476_NULL_Pointer_Dereference__Integer_53c().goodG2BSink(data);
  }

  /* goodB2G() - use badsource and goodsink */
  goodB2GSink(data: number | null): void {
    new CWE476_NULL_Pointer_Dereference__Integer_53c().goodB2GSink(data);
  }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_53d.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-53d.tmpl.ts
//
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 53 Data flow: data passed as an argument from one method through two others to a fourth; all four functions are in different classes in the same package
//
export class CWE476_NULL_Pointer_Dereference__Integer_53d {
  badSink(data: number | null): void {
    /* POTENTIAL FLAW: null dereference will occur if data is null */
    // To replicate the original bug, we use the non-null assertion operator (!)
    // which tells TypeScript that 'data' is not null, leading to a runtime error if it is.
    IO.writeLine('' + data!.toString());
  }

  /* goodG2B() - use goodsource and badsink */
  goodG2BSink(data: number | null): void {
    /* POTENTIAL FLAW: null dereference will occur if data is null */
    // To replicate the original bug, we use the non-null assertion operator (!)
    // which tells TypeScript that 'data' is not null, leading to a runtime error if it is.
    IO.writeLine('' + data!.toString());
  }

  /* goodB2G() - use badsource and goodsink */
  goodB2GSink(data: number | null): void {
    /* FIX: validate that data is non-null */
    if (data !== null) {
      IO.writeLine('' + data.toString());
    } else {
      IO.writeLine('data is null');
    }
  }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_53a.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-53a.tmpl.ts
//
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 53 Data flow: data passed as an argument from one method through two others to a fourth; all four functions are in different classes in the same package
//
export class CWE476_NULL_Pointer_Dereference__Integer_53a extends AbstractTestCase {
  bad(): void {
    let data: number | null;

    /* POTENTIAL FLAW: data is null */
    data = null;

    new CWE476_NULL_Pointer_Dereference__Integer_53b().badSink(data);
  }

  good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  /* goodG2B() - use goodsource and badsink */
  private goodG2B(): void {
    let data: number | null;

    /* FIX: hardcode data to non-null */
    data = 5; // In ArkTS/TypeScript, 'number' type handles integer values directly.

    new CWE476_NULL_Pointer_Dereference__Integer_53b().goodG2BSink(data);
  }

  /* goodB2G() - use badsource and goodsink */
  private goodB2G(): void {
    let data: number | null;

    /* POTENTIAL FLAW: data is null */
    data = null;

    new CWE476_NULL_Pointer_Dereference__Integer_53b().goodB2GSink(data);
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