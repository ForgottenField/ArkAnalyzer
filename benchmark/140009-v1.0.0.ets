/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_71a.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-71a.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:   Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 * GoodSink: add check to prevent possibility of null dereference
 * BadSink : possibility of null dereference
 * Flow Variant: 71 Data flow: data passed as an Object reference argument from one method to another in different classes in the same package
 *
 * */

// No package equivalent in ArkTS/TypeScript; modules are used for organization.

// Import necessary classes from the testcasesupport module.
import { IO, AbstractTestCase } from './testcasesupport';

// Define the CWE476_NULL_Pointer_Dereference__int_array_71a class.
export class CWE476_NULL_Pointer_Dereference__int_array_71a extends AbstractTestCase {
    public bad(): void {
        let data: number[] | null;

        // POTENTIAL FLAW: 'data' is explicitly assigned null, replicating the original Java behavior.
        data = null;

        // In ArkTS, 'any' is used for the parameter type to simulate Java's 'Object'
        // for dynamic passing and subsequent type assertion in the receiving method.
        new CWE476_NULL_Pointer_Dereference__int_array_71b().badSink(data);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - uses a good source and a bad sink.
    private goodG2B(): void {
        let data: number[] | null;

        // FIX: Initialize 'data' to a non-null array to prevent null dereference.
        data = new Array<number>(5);

        // In ArkTS, 'any' is used for the parameter type to simulate Java's 'Object'
        // for dynamic passing and subsequent type assertion in the receiving method.
        new CWE476_NULL_Pointer_Dereference__int_array_71b().goodG2BSink(data);
    }

    // goodB2G() - uses a bad source and a good sink.
    private goodB2G(): void {
        let data: number[] | null;

        // POTENTIAL FLAW: 'data' is explicitly assigned null, replicating the original Java behavior.
        data = null;

        // In ArkTS, 'any' is used for the parameter type to simulate Java's 'Object'
        // for dynamic passing and subsequent type assertion in the receiving method.
        new CWE476_NULL_Pointer_Dereference__int_array_71b().goodB2GSink(data);
    }

    // The 'main' method is provided for testing this specific test case in isolation.
    // It is typically not used when all test cases are compiled together for static analysis.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_71b.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-71b.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:   Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 * GoodSink: add check to prevent possibility of null dereference
 * BadSink : possibility of null dereference
 * Flow Variant: 71 Data flow: data passed as an Object reference argument from one method to another in different classes in the same package
 *
 * */

// No package equivalent in ArkTS/TypeScript; modules are used for organization.

// Import necessary classes from the testcasesupport module.
// 'IO' is needed for output operations.
// 'AbstractTestCase' is not needed here as this class does not extend it.
import { IO } from './testcasesupport';

// Define the CWE476_NULL_Pointer_Dereference__int_array_71b class.
// This class is exported to allow its use from other modules, mirroring Java's public class behavior.
export class CWE476_NULL_Pointer_Dereference__int_array_71b {
    public badSink(dataObject: any): void {
        // Cast the incoming 'any' type to a number array that might be null.
        // This simulates the Java cast from Object to int[].
        let data: number[] | null = dataObject as number[] | null;

        // POTENTIAL FLAW: A null dereference will occur if 'data' is null when 'data.length' is accessed.
        // The '!' non-null assertion operator is used here to replicate the original Java behavior
        // where a NullPointerException would occur without an explicit null check.
        IO.writeLine(`${data!.length}`);
    }

    // goodG2B() - uses good source and bad sink.
    public goodG2BSink(dataObject: any): void {
        // Cast the incoming 'any' type to a number array that might be null.
        let data: number[] | null = dataObject as number[] | null;

        // POTENTIAL FLAW: A null dereference will occur if 'data' is null when 'data.length' is accessed.
        // The '!' non-null assertion operator is used here to replicate the original Java behavior
        // where a NullPointerException would occur without an explicit null check.
        IO.writeLine(`${data!.length}`);
    }

    // goodB2G() - uses bad source and good sink.
    public goodB2GSink(dataObject: any): void {
        // Cast the incoming 'any' type to a number array that might be null.
        let data: number[] | null = dataObject as number[] | null;

        // FIX: Validate that 'data' is non-null before attempting to access its 'length' property.
        if (data != null) {
            IO.writeLine(`${data.length}`);
        } else {
            IO.writeLine("data is null");
        }
    }
}