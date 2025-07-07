/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_68b.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-68b.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 68 Data flow: data passed as a member variable in the "a" class, which is used by a method in another class in the same package
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// This class represents the "b" part of the 68 flow variant, receiving data from the "a" class.
export class CWE476_NULL_Pointer_Dereference__Integer_68b {
    // This method demonstrates a bad sink where a null dereference can occur.
    public badSink(): void {
        // Retrieve the data, which might be null, from the static field of the 'a' class.
        let data: number | null = CWE476_NULL_Pointer_Dereference__Integer_68a.data;

        /* POTENTIAL FLAW: a null dereference will occur if data is null.
         * The '!' operator is used here to bypass TypeScript's null-checking
         * to replicate the Java NullPointerException behavior at runtime.
         */
        IO.writeLine("" + data!.toString());
    }

    // This method demonstrates a good source leading to a bad sink.
    public goodG2BSink(): void {
        // Retrieve the data from the static field of the 'a' class.
        let data: number | null = CWE476_NULL_Pointer_Dereference__Integer_68a.data;

        /* POTENTIAL FLAW: a null dereference will occur if data is null.
         * The '!' operator is used here to bypass TypeScript's null-checking
         * to replicate the Java NullPointerException behavior at runtime.
         */
        IO.writeLine("" + data!.toString());
    }

    // This method demonstrates a bad source leading to a good sink.
    public goodB2GSink(): void {
        // Retrieve the data from the static field of the 'a' class.
        let data: number | null = CWE476_NULL_Pointer_Dereference__Integer_68a.data;

        /* FIX: Validate that the data is non-null before use.
         * This prevents a potential null dereference.
         */
        if (data !== null) {
            IO.writeLine("" + data.toString());
        } else {
            IO.writeLine("data is null");
        }
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_68a.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-68a.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 68 Data flow: data passed as a member variable in the "a" class, which is used by a method in another class in the same package
 *
 * */

// This class represents the "a" part of the 68 flow variant, providing the data.
export class CWE476_NULL_Pointer_Dereference__Integer_68a extends AbstractTestCase {
    // This static field holds the data that can be passed between classes.
    public static data: number | null;

    // This method sets the data to null, simulating a bad source.
    public bad(): void {
        /* POTENTIAL FLAW: The data is explicitly set to null here,
         * which can lead to a null dereference when used later.
         */
        CWE476_NULL_Pointer_Dereference__Integer_68a.data = null;

        // An instance of the 'b' class is created to use the potentially null data.
        new CWE476_NULL_Pointer_Dereference__Integer_68b().badSink();
    }

    // This method orchestrates the good and bad flows for testing.
    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // This method uses a good source (non-null data) with a bad sink (no null check).
    private goodG2B(): void {
        /* FIX: The data is set to a non-null value.
         * This prevents the null dereference at the sink, even though the sink itself doesn't check.
         */
        CWE476_NULL_Pointer_Dereference__Integer_68a.data = 5;

        // An instance of the 'b' class is created to use the non-null data.
        new CWE476_NULL_Pointer_Dereference__Integer_68b().goodG2BSink();
    }

    // This method uses a bad source (null data) with a good sink (with a null check).
    private goodB2G(): void {
        /* POTENTIAL FLAW: The data is explicitly set to null here.
         * However, the sink is designed to handle nulls.
         */
        CWE476_NULL_Pointer_Dereference__Integer_68a.data = null;

        // An instance of the 'b' class is created to use the potentially null data, but with a safe sink.
        new CWE476_NULL_Pointer_Dereference__Integer_68b().goodB2GSink();
    }

    /* This is the main method, typically used for standalone testing or
     * for building a binary for analysis tools. It's not usually
     * compiled when all testcases are built together for source code
     * analysis tools.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}