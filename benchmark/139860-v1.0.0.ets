import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package
 *
 */
export class CWE476_NULL_Pointer_Dereference__Integer_54a extends AbstractTestCase {
    public bad(): void {
        let data: number | null;

        // POTENTIAL FLAW: 'data' is intentionally set to null to demonstrate the vulnerability.
        data = null;

        new CWE476_NULL_Pointer_Dereference__Integer_54b().badSink(data);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: number | null;

        // FIX: 'data' is explicitly set to a non-null value.
        data = 5; // In ArkTS/TypeScript, a number literal directly represents a numeric value, similar to Java's Integer.valueOf(5).

        new CWE476_NULL_Pointer_Dereference__Integer_54b().goodG2BSink(data);
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: number | null;

        // POTENTIAL FLAW: 'data' is intentionally set to null to demonstrate the vulnerability.
        data = null;

        new CWE476_NULL_Pointer_Dereference__Integer_54b().goodB2GSink(data);
    }

    // The original Java 'main' method is not directly translatable to a class method in ArkTS/TypeScript,
    // as execution typically starts from an application entry point or external function.
}


/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package
 *
 */
export class CWE476_NULL_Pointer_Dereference__Integer_54b {
    public badSink(data: number | null): void {
        new CWE476_NULL_Pointer_Dereference__Integer_54c().badSink(data);
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(data: number | null): void {
        new CWE476_NULL_Pointer_Dereference__Integer_54c().goodG2BSink(data);
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(data: number | null): void {
        new CWE476_NULL_Pointer_Dereference__Integer_54c().goodB2GSink(data);
    }
}


/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package
 *
 */
export class CWE476_NULL_Pointer_Dereference__Integer_54c {
    public badSink(data: number | null): void {
        new CWE476_NULL_Pointer_Dereference__Integer_54d().badSink(data);
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(data: number | null): void {
        new CWE476_NULL_Pointer_Dereference__Integer_54d().goodG2BSink(data);
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(data: number | null): void {
        new CWE476_NULL_Pointer_Dereference__Integer_54d().goodB2GSink(data);
    }
}


/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package
 *
 */
export class CWE476_NULL_Pointer_Dereference__Integer_54d {
    public badSink(data: number | null): void {
        new CWE476_NULL_Pointer_Dereference__Integer_54e().badSink(data);
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(data: number | null): void {
        new CWE476_NULL_Pointer_Dereference__Integer_54e().goodG2BSink(data);
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(data: number | null): void {
        new CWE476_NULL_Pointer_Dereference__Integer_54e().goodB2GSink(data);
    }
}

import { IO } from './testcasesupport';

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 54 Data flow: data passed as an argument from one method through three others to a fifth; all five functions are in different classes in the same package
 *
 */
export class CWE476_NULL_Pointer_Dereference__Integer_54e {
    public badSink(data: number | null): void {
        // POTENTIAL FLAW: A null value for 'data' will cause a dereference at runtime when 'toString()' is called.
        IO.writeLine("" + data.toString());
    }

    /* goodG2B() - use goodsource and badsink */
    public goodG2BSink(data: number | null): void {
        // POTENTIAL FLAW: A null value for 'data' will cause a dereference at runtime when 'toString()' is called.
        IO.writeLine("" + data.toString());
    }

    /* goodB2G() - use badsource and goodsink */
    public goodB2GSink(data: number | null): void {
        // FIX: Validating 'data' ensures it is not null before use.
        if (data != null) {
            IO.writeLine("" + data.toString());
        } else {
            IO.writeLine("data is null");
        }
    }
}