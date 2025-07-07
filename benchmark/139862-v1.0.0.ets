import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 66 Data flow: data passed in an array from one method to another in different source files in the same package
 *
 * */
export class CWE476_NULL_Pointer_Dereference__Integer_66a extends AbstractTestCase {
    bad(): void {
        let data: number | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        let dataArray: (number | null)[] = new Array(5);
        dataArray[2] = data;
        (new CWE476_NULL_Pointer_Dereference__Integer_66b()).badSink(dataArray);
    }

    good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use goodsource and badsink */
    private goodG2B(): void {
        let data: number | null;

        /* FIX: hardcode data to non-null */
        data = 5;

        let dataArray: (number | null)[] = new Array(5);
        dataArray[2] = data;
        (new CWE476_NULL_Pointer_Dereference__Integer_66b()).goodG2BSink(dataArray);
    }

    /* goodB2G() - use badsource and goodsink */
    private goodB2G(): void {
        let data: number | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        let dataArray: (number | null)[] = new Array(5);
        dataArray[2] = data;
        (new CWE476_NULL_Pointer_Dereference__Integer_66b()).goodB2GSink(dataArray);
    }

    /* This main method is used for isolated testing or generating a binary for analysis tools. When compiling all test cases as a single application, this method is not typically used. */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
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
 * Flow Variant: 66 Data flow: data passed in an array from one method to another in different source files in the same package
 *
 * */
export class CWE476_NULL_Pointer_Dereference__Integer_66b {
    badSink(dataArray: (number | null)[]): void {
        let data: number | null = dataArray[2];

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        IO.writeLine("" + data!.toString());
    }

    /* goodG2B() - use goodsource and badsink */
    goodG2BSink(dataArray: (number | null)[]): void {
        let data: number | null = dataArray[2];

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        IO.writeLine("" + data!.toString());
    }

    /* goodB2G() - use badsource and goodsink */
    goodB2GSink(dataArray: (number | null)[]): void {
        let data: number | null = dataArray[2];

        /* FIX: validate that data is non-null */
        if (data !== null) {
            IO.writeLine("" + data.toString());
        } else {
            IO.writeLine("data is null");
        }
    }
}
