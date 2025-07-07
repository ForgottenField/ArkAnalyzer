/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_74b.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-74b.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 74 Data flow: data passed in a Map from one method to another in different source files in the same package
 *
 * */

import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_74b {
    // In ArkTS/TypeScript, Map<number, number | null> is used to represent a Map where
    // keys are numbers and values can be numbers or null, mimicking Java's HashMap<Integer, Integer>
    // where Integer can hold a null reference.
    public badSink(dataHashMap: Map<number, number | null>): void {
        // Retrieve data from the Map. If the original data was null, this will retrieve null.
        let data: number | null = dataHashMap.get(2) ?? null;

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        // Calling toString() on a null value will cause a runtime error in ArkTS/TypeScript,
        // replicating the NullPointerException in Java. The '!' non-null assertion is used
        // to explicitly replicate the direct dereference that would occur in Java.
        IO.writeLine("" + data!.toString());

    }

    /* goodG2B() - use GoodSource and BadSink */
    public goodG2BSink(dataHashMap: Map<number, number | null>): void {
        let data: number | null = dataHashMap.get(2) ?? null;

        /* POTENTIAL FLAW: null dereference will occur if data is null */
        IO.writeLine("" + data!.toString());

    }

    /* goodB2G() - use BadSource and GoodSink */
    public goodB2GSink(dataHashMap: Map<number, number | null>): void {
        let data: number | null = dataHashMap.get(2) ?? null;

        /* FIX: validate that data is non-null */
        if (data != null)
        {
            IO.writeLine("" + data.toString());
        }
        else
        {
            IO.writeLine("data is null");
        }

    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_74a.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-74a.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 74 Data flow: data passed in a Map from one method to another in different source files in the same package
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_74a extends AbstractTestCase
{
    public bad(): void
    {
        let data: number | null; // Declare data that can hold a number or null.

        /* POTENTIAL FLAW: data is null */
        // Setting data to null directly replicates the bad source from Java.
        data = null;

        // In ArkTS/TypeScript, Map is used for key-value pairs, similar to Java's HashMap.
        // We specify that values can be number or null.
        let dataHashMap: Map<number, number | null> = new Map<number, number | null>();
        dataHashMap.set(0, data);
        dataHashMap.set(1, data);
        dataHashMap.set(2, data);
        
        // Create an instance of the other class and call its badSink method,
        // passing the Map with the potentially null value.
        (new CWE476_NULL_Pointer_Dereference__Integer_74b()).badSink(dataHashMap);
    }

    public good(): void
    {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use GoodSource and BadSink */
    private goodG2B(): void
    {
        let data: number | null; // Declare data that can hold a number or null.

        /* FIX: hardcode data to non-null */
        // Assigning a non-null number directly replicates the good source.
        data = 5;

        let dataHashMap: Map<number, number | null> = new Map<number, number | null>();
        dataHashMap.set(0, data);
        dataHashMap.set(1, data);
        dataHashMap.set(2, data);
        
        (new CWE476_NULL_Pointer_Dereference__Integer_74b()).goodG2BSink(dataHashMap);
    }

    /* goodB2G() - use BadSource and GoodSink */
    private goodB2G(): void
    {
        let data: number | null; // Declare data that can hold a number or null.

        /* POTENTIAL FLAW: data is null */
        // Setting data to null directly replicates the bad source from Java.
        data = null;

        let dataHashMap: Map<number, number | null> = new Map<number, number | null>();
        dataHashMap.set(0, data);
        dataHashMap.set(1, data);
        dataHashMap.set(2, data);
        
        (new CWE476_NULL_Pointer_Dereference__Integer_74b()).goodB2GSink(dataHashMap);
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    // Replicating the static main method from Java.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}