import { IO, AbstractTestCase } from './testcasesupport';
import HashMap from '@ohos.util.HashMap';

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_74a.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-74a.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 74 Data flow: data passed in a HashMap from one method to another in different source files in the same package
 *
 * */
export class CWE476_NULL_Pointer_Dereference__int_array_74a extends AbstractTestCase {
    bad(): void {
        let data: number[] | null;

        // POTENTIAL FLAW: In this scenario, 'data' is deliberately set to null.
        data = null;

        let dataHashMap: HashMap<number, number[] | null> = new HashMap<number, number[] | null>();
        dataHashMap.set(0, data);
        dataHashMap.set(1, data);
        dataHashMap.set(2, data);
        new CWE476_NULL_Pointer_Dereference__int_array_74b().badSink(dataHashMap);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use GoodSource and BadSink */
    private goodG2B(): void {
        let data: number[] | null;

        // FIX: 'data' is initialized here to a non-null array.
        data = new Array<number>(5);

        let dataHashMap: HashMap<number, number[] | null> = new HashMap<number, number[] | null>();
        dataHashMap.set(0, data);
        dataHashMap.set(1, data);
        dataHashMap.set(2, data);
        new CWE476_NULL_Pointer_Dereference__int_array_74b().goodG2BSink(dataHashMap);
    }

    /* goodB2G() - use BadSource and GoodSink */
    private goodB2G(): void {
        let data: number[] | null;

        // POTENTIAL FLAW: In this scenario, 'data' is deliberately set to null.
        data = null;

        let dataHashMap: HashMap<number, number[] | null> = new HashMap<number, number[] | null>();
        dataHashMap.set(0, data);
        dataHashMap.set(1, data);
        dataHashMap.set(2, data);
        new CWE476_NULL_Pointer_Dereference__int_array_74b().goodB2GSink(dataHashMap);
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

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_74b.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-74b.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 74 Data flow: data passed in a HashMap from one method to another in different source files in the same package
 *
 * */
export class CWE476_NULL_Pointer_Dereference__int_array_74b {
    public badSink(dataHashMap: HashMap<number, number[] | null>): void {
        let data: number[] | null = dataHashMap.get(2) ?? null; // Ensures 'data' is null if the value retrieved from the map is undefined or explicitly null.

        // POTENTIAL FLAW: A null pointer dereference will occur here if 'data' is null.
        IO.writeLine("" + data!.length); // Using the non-null assertion operator (!) to replicate the original Java behavior where a NullPointerException would occur.
    }

    /* goodG2B() - use GoodSource and BadSink */
    public goodG2BSink(dataHashMap: HashMap<number, number[] | null>): void {
        let data: number[] | null = dataHashMap.get(2) ?? null;

        // POTENTIAL FLAW: A null pointer dereference will occur here if 'data' is null.
        IO.writeLine("" + data!.length); // Using the non-null assertion operator (!) to replicate the original Java behavior where a NullPointerException would occur.
    }

    /* goodB2G() - use BadSource and GoodSink */
    public goodB2GSink(dataHashMap: HashMap<number, number[] | null>): void {
        let data: number[] | null = dataHashMap.get(2) ?? null;

        // FIX: Validating that 'data' is not null before access.
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }
}