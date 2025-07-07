// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_68a.ets
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-68a.tmpl.ets

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

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_68a extends AbstractTestCase {
    // Declares a static field that can hold an array of numbers or be null.
    public static data: number[] | null;

    public bad(): void {
        // POTENTIAL FLAW: 'data' is explicitly set to null here.
        CWE476_NULL_Pointer_Dereference__int_array_68a.data = null;

        // Creates an instance of the '68b' class and calls its 'badSink' method.
        // This method will attempt to dereference the 'data' field, which is null.
        (new CWE476_NULL_Pointer_Dereference__int_array_68b()).badSink();
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - uses a good source and a bad sink
    private goodG2B(): void {
        // FIX: 'data' is initialized to a non-null array, preventing null dereference in the sink.
        CWE476_NULL_Pointer_Dereference__int_array_68a.data = new Array<number>(5);

        // Calls 'goodG2BSink' which, despite the good source, contains a bad sink logic that
        // does not check for null before dereferencing.
        (new CWE476_NULL_Pointer_Dereference__int_array_68b()).goodG2BSink();
    }

    // goodB2G() - uses a bad source and a good sink
    private goodB2G(): void {
        // POTENTIAL FLAW: 'data' is explicitly set to null here, simulating a bad source.
        CWE476_NULL_Pointer_Dereference__int_array_68a.data = null;

        // Calls 'goodB2GSink' which correctly validates 'data' for null before use.
        (new CWE476_NULL_Pointer_Dereference__int_array_68b()).goodB2GSink();
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


// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_68b.ets
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-68b.tmpl.ets

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

import { IO } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_68b {
    public badSink(): void {
        // Retrieves the 'data' array from the static member of the '68a' class.
        // In the 'bad' flow, this 'data' will be null.
        let data: number[] | null = CWE476_NULL_Pointer_Dereference__int_array_68a.data;

        // POTENTIAL FLAW: Accessing 'length' on a potentially null 'data' array.
        // This will cause a runtime error if 'data' is null.
        IO.writeLine("" + data!.length); // Use '!' for non-null assertion to match Java's unchecked access for faithful bug replication.
                                        // Although TypeScript would normally flag this, the directive is to replicate the bug.
    }

    // goodG2B() - uses good source and bad sink
    public goodG2BSink(): void {
        // Retrieves the 'data' array from the static member of the '68a' class.
        // In the 'goodG2B' flow, this 'data' will be non-null.
        let data: number[] | null = CWE476_NULL_Pointer_Dereference__int_array_68a.data;

        // POTENTIAL FLAW: Accessing 'length' on a potentially null 'data' array.
        // Even though 'goodG2B' sets it to non-null, this sink itself doesn't validate.
        // This would cause a runtime error if 'data' were null at this point.
        IO.writeLine("" + data!.length); // Use '!' for non-null assertion to match Java's unchecked access for faithful bug replication.
    }

    // goodB2G() - uses bad source and good sink
    public goodB2GSink(): void {
        // Retrieves the 'data' array from the static member of the '68a' class.
        // In the 'goodB2G' flow, this 'data' will be null.
        let data: number[] | null = CWE476_NULL_Pointer_Dereference__int_array_68a.data;

        // FIX: Validates that 'data' is not null before attempting to access its 'length'.
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            // Handles the null case gracefully, preventing a runtime error.
            IO.writeLine("data is null");
        }
    }
}
