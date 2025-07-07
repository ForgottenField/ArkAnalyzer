/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_74b.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-74b.tmpl.ets
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

import { IO } from './testcasesupport';
import HashMap from '@ohos.util.HashMap';

export class CWE476_NULL_Pointer_Dereference__String_74b {

    public badSink(dataHashMap: HashMap<number, string | null>): void {
        // Retrieve data from the HashMap. To replicate the original Java logic where 'null'
        // could be stored and retrieved, the type here allows 'null' and 'undefined'.
        let data: string | null | undefined = dataHashMap.get(2);

        /* POTENTIAL FLAW: A runtime error will occur if 'data' is null or undefined here. */
        // The '!' operator is used to assert non-null/non-undefined, replicating the original
        // Java dereference without a null check.
        IO.writeLine("" + data!.length);
    }

    /* goodG2B() - use GoodSource and BadSink */
    public goodG2BSink(dataHashMap: HashMap<number, string>): void {
        // Retrieve data from the HashMap.
        let data: string | undefined = dataHashMap.get(2);

        /* POTENTIAL FLAW: A runtime error will occur if 'data' is null or undefined here. */
        // Although this specific flow might not pass null data, the sink itself
        // does not check for null/undefined, preserving the potential flaw.
        IO.writeLine("" + data!.length);
    }

    /* goodB2G() - use BadSource and GoodSink */
    public goodB2GSink(dataHashMap: HashMap<number, string | null>): void {
        // Retrieve data from the HashMap. To replicate the original Java logic where 'null'
        // could be stored and retrieved, the type here allows 'null' and 'undefined'.
        let data: string | null | undefined = dataHashMap.get(2);

        /* FIX: Validate that 'data' is neither null nor undefined before use. */
        if (data !== undefined && data !== null) {
            IO.writeLine("" + data.length);
        } else {
            // This path indicates that the data was indeed null or undefined,
            // preventing the dereference.
            IO.writeLine("data is undefined or null");
        }
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_74a.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-74a.tmpl.ets
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

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';
import HashMap from '@ohos.util.HashMap';

export class CWE476_NULL_Pointer_Dereference__String_74a extends AbstractTestCase {

    public bad(): void {
        let data: string | null;

        /* POTENTIAL FLAW: 'data' is explicitly set to null, which will cause a dereference later. */
        data = null;

        // Create a HashMap to pass data. The values are typed to allow 'null' to replicate Java's behavior.
        let dataHashMap: HashMap<number, string | null> = new HashMap<number, string | null>();
        dataHashMap.set(0, data);
        dataHashMap.set(1, data);
        dataHashMap.set(2, data);

        // Call the sink method in a separate class, passing the HashMap.
        new CWE476_NULL_Pointer_Dereference__String_74b().badSink(dataHashMap);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use GoodSource and BadSink */
    private goodG2B(): void {
        let data: string;

        /* FIX: 'data' is explicitly set to a non-null value. */
        data = "This is not null";

        // Create a HashMap to pass data. The values are typed as 'string' because data is guaranteed non-null here.
        let dataHashMap: HashMap<number, string> = new HashMap<number, string>();
        dataHashMap.set(0, data);
        dataHashMap.set(1, data);
        dataHashMap.set(2, data);

        // Call the sink method, which will still be the 'badSink' in this flow,
        // but with non-null data.
        new CWE476_NULL_Pointer_Dereference__String_74b().goodG2BSink(dataHashMap);
    }

    /* goodB2G() - use BadSource and GoodSink */
    private goodB2G(): void {
        let data: string | null;

        /* POTENTIAL FLAW: 'data' is explicitly set to null, but will be handled by a good sink. */
        data = null;

        // Create a HashMap to pass data. The values are typed to allow 'null' to replicate Java's behavior.
        let dataHashMap: HashMap<number, string | null> = new HashMap<number, string | null>();
        dataHashMap.set(0, data);
        dataHashMap.set(1, data);
        dataHashMap.set(2, data);

        // Call the good sink method, which includes a null check.
        new CWE476_NULL_Pointer_Dereference__String_74b().goodB2GSink(dataHashMap);
    }

    /* This main method is typically for standalone testing or for building a binary for analysis tools. It is not used when compiling all test cases as a single application, which is how static analysis tools are usually tested. */
    // Note: ArkTS applications typically use an entry point different from 'main'.
    // This is included to mimic the original Java structure for test case execution purposes.
    public static main(args: string[]): void {
        // Assuming mainFromParent is available from AbstractTestCaseBase or a similar utility.
        AbstractTestCaseBase.mainFromParent(args);
    }
}