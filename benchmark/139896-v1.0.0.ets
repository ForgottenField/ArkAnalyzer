/*
 * TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_53c.ts
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-53c.tmpl.ts
 */
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource: Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 53 Data flow: data passed as an argument from one method through two others to a fourth; all four functions are in different classes in the same package
 *
 */


export class CWE476_NULL_Pointer_Dereference__StringBuilder_53c {
  public badSink(data: string | null): void {
    // In ArkTS, 'throws Throwable' is not applicable; exceptions are runtime.
    new CWE476_NULL_Pointer_Dereference__StringBuilder_53d().badSink(data);
  }

  /* goodG2B() - use goodsource and badsink */
  public goodG2BSink(data: string | null): void {
    new CWE476_NULL_Pointer_Dereference__StringBuilder_53d().goodG2BSink(data);
  }

  /* goodB2G() - use badsource and goodsink */
  public goodB2GSink(data: string | null): void {
    new CWE476_NULL_Pointer_Dereference__StringBuilder_53d().goodB2GSink(data);
  }
}

/*
 * TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_53b.ts
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-53b.tmpl.ts
 */
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource: Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 53 Data flow: data passed as an argument from one method through two others to a fourth; all four functions are in different classes in the same package
 *
 */


export class CWE476_NULL_Pointer_Dereference__StringBuilder_53b {
  public badSink(data: string | null): void {
    new CWE476_NULL_Pointer_Dereference__StringBuilder_53c().badSink(data);
  }

  /* goodG2B() - use goodsource and badsink */
  public goodG2BSink(data: string | null): void {
    new CWE476_NULL_Pointer_Dereference__StringBuilder_53c().goodG2BSink(data);
  }

  /* goodB2G() - use badsource and goodsink */
  public goodB2GSink(data: string | null): void {
    new CWE476_NULL_Pointer_Dereference__StringBuilder_53c().goodB2GSink(data);
  }
}

/*
 * TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_53d.ts
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-53d.tmpl.ts
 */
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource: Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 53 Data flow: data passed as an argument from one method through two others to a fourth; all four functions are in different classes in the same package
 *
 */

import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_53d {
  public badSink(data: string | null): void {
    // POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its length.
    // In ArkTS/TypeScript, string length is a property, not a method.
    // To replicate the original behavior of an unhandled null, we directly access 'data.length'.
    // If 'data' is null, this will result in a runtime error.
    IO.writeLine('' + data!.length); // Using '!' to assert non-null, replicating the potential dereference
  }

  /* goodG2B() - use goodsource and badsink */
  public goodG2BSink(data: string | null): void {
    // POTENTIAL FLAW: A null dereference will occur if 'data' is null when accessing its length.
    // In ArkTS/TypeScript, string length is a property, not a method.
    // To replicate the original behavior of an unhandled null, we directly access 'data.length'.
    // If 'data' is null, this will result in a runtime error.
    IO.writeLine('' + data!.length); // Using '!' to assert non-null, replicating the potential dereference
  }

  /* goodB2G() - use badsource and goodsink */
  public goodB2GSink(data: string | null): void {
    // FIX: The code checks if 'data' is non-null before accessing its properties.
    if (data != null) {
      // In ArkTS/TypeScript, string length is a property, not a method.
      IO.writeLine('' + data.length);
    } else {
      IO.writeLine('data is null');
    }
  }
}

/*
 * TEMPLATE GENERATED TESTCASE FILE
 * Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_53a.ts
 * Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
 * Template File: sources-sinks-53a.tmpl.ts
 */
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource: Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 53 Data flow: data passed as an argument from one method through two others to a fourth; all four functions are in different classes in the same package
 *
 */

import { AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_53a extends AbstractTestCase {
  public bad(): void {
    // In ArkTS, 'throws Throwable' is not applicable; exceptions are runtime.
    let data: string | null;

    // POTENTIAL FLAW: 'data' is assigned null, simulating a potential null value.
    data = null;

    new CWE476_NULL_Pointer_Dereference__StringBuilder_53b().badSink(data);
  }

  public good(): void {
    this.goodG2B();
    this.goodB2G();
  }

  /* goodG2B() - use goodsource and badsink */
  private goodG2B(): void {
    let data: string | null;

    // FIX: 'data' is explicitly set to a non-null value.
    // In Java, 'new StringBuilder()' creates an empty mutable string builder.
    // In ArkTS/TypeScript, we use an empty string to represent this.
    data = '';

    new CWE476_NULL_Pointer_Dereference__StringBuilder_53b().goodG2BSink(data);
  }

  /* goodB2G() - use badsource and goodsink */
  private goodB2G(): void {
    let data: string | null;

    // POTENTIAL FLAW: 'data' is assigned null, simulating a potential null value.
    data = null;

    new CWE476_NULL_Pointer_Dereference__StringBuilder_53b().goodB2GSink(data);
  }

  /* This main method is for standalone testing or binary analysis. It's not part of the primary testcase execution when compiled as a larger application. */
  public static main(args: string[]): void {
    // In ArkTS, 'throws ClassNotFoundException, InstantiationException, IllegalAccessException' are not applicable.
    AbstractTestCase.mainFromParent(args);
  }
}
