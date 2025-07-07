/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_75b.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-75b.tmpl.ets
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 75 Data flow: data passed in a serialized object from one method to another in different source files in the same package
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// This class handles the sink operations, receiving data that may have been serialized.
export class CWE476_NULL_Pointer_Dereference__Integer_75b {

    // Simulates deserialization for the bad sink.
    public badSink(dataSerialized: Uint8Array): void {
        let data: number | null = null; // Initialize to null for safety

        try {
            // To replicate the original logic, we simulate deserialization using JSON.
            // This converts the Uint8Array back to a string, then parses it into a number or null.
            const dataString = new TextDecoder().decode(dataSerialized);
            data = JSON.parse(dataString);

            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // Replicating the bug by directly calling toString() without a null check.
            IO.writeLine("" + data.toString());

        } catch (error: any) {
            // Catching any errors during the simulated deserialization process.
            IO.logger.warn(`Error during deserialization simulation: ${error.message}`, error);
        }
        // In ArkTS, stream closing like in Java is not necessary for these string/JSON operations,
        // as resources are managed automatically.
    }

    // goodG2B() - use GoodSource and BadSink
    // Simulates deserialization for a good source scenario, but still uses the bad sink logic.
    public goodG2BSink(dataSerialized: Uint8Array): void {
        let data: number | null = null; // Initialize to null for safety

        try {
            // To replicate the original logic, we simulate deserialization using JSON.
            // This converts the Uint8Array back to a string, then parses it into a number or null.
            const dataString = new TextDecoder().decode(dataSerialized);
            data = JSON.parse(dataString);

            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // Replicating the bug by directly calling toString() without a null check.
            IO.writeLine("" + data.toString());

        } catch (error: any) {
            // Catching any errors during the simulated deserialization process.
            IO.logger.warn(`Error during deserialization simulation: ${error.message}`, error);
        }
        // In ArkTS, stream closing like in Java is not necessary for these string/JSON operations,
        // as resources are managed automatically.
    }

    // goodB2G() - use BadSource and GoodSink
    // Simulates deserialization for a bad source scenario, but with a good sink (null check).
    public goodB2GSink(dataSerialized: Uint8Array): void {
        let data: number | null = null; // Initialize to null for safety

        try {
            // To replicate the original logic, we simulate deserialization using JSON.
            // This converts the Uint8Array back to a string, then parses it into a number or null.
            const dataString = new TextDecoder().decode(dataSerialized);
            data = JSON.parse(dataString);

            /* FIX: validate that data is non-null */
            if (data !== null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }

        } catch (error: any) {
            // Catching any errors during the simulated deserialization process.
            IO.logger.warn(`Error during deserialization simulation: ${error.message}`, error);
        }
        // In ArkTS, stream closing like in Java is not necessary for these string/JSON operations,
        // as resources are managed automatically.
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__Integer_75a.ets
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-75a.tmpl.ets
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 75 Data flow: data passed in a serialized object from one method to another in different source files in the same package
 *
 * */


export class CWE476_NULL_Pointer_Dereference__Integer_75a extends AbstractTestCase {

    public bad(): void { // No 'throws Throwable' in ArkTS, use try-catch for errors
        let data: number | null; // Use 'number | null' to explicitly allow null values

        /* POTENTIAL FLAW: data is null */
        data = null;

        let dataSerialized: Uint8Array; // Represents the serialized byte array

        try {
            // To replicate the original logic, we simulate serialization using JSON.
            // This converts the number or null to a JSON string, then encodes it into a Uint8Array.
            const dataString = JSON.stringify(data);
            dataSerialized = new TextEncoder().encode(dataString);

            // Create an instance of the sink class and pass the serialized data.
            (new CWE476_NULL_Pointer_Dereference__Integer_75b()).badSink(dataSerialized);
        } catch (error: any) {
            // Catching any errors during the simulated serialization process.
            IO.logger.warn(`Error during serialization simulation: ${error.message}`, error);
        }
        // In ArkTS, stream closing like in Java is not necessary for these string/JSON operations,
        // as resources are managed automatically.
    }

    public good(): void { // No 'throws Throwable' in ArkTS
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - use GoodSource and BadSink
    private goodG2B(): void { // No 'throws Throwable' in ArkTS
        let data: number | null;

        /* FIX: hardcode data to non-null */
        data = 5; // Direct number assignment, no need for Integer.valueOf

        let dataSerialized: Uint8Array;

        try {
            // To replicate the original logic, we simulate serialization using JSON.
            // This converts the number or null to a JSON string, then encodes it into a Uint8Array.
            const dataString = JSON.stringify(data);
            dataSerialized = new TextEncoder().encode(dataString);

            // Create an instance of the sink class and pass the serialized data.
            (new CWE476_NULL_Pointer_Dereference__Integer_75b()).goodG2BSink(dataSerialized);
        } catch (error: any) {
            // Catching any errors during the simulated serialization process.
            IO.logger.warn(`Error during serialization simulation: ${error.message}`, error);
        }
        // In ArkTS, stream closing like in Java is not necessary for these string/JSON operations,
        // as resources are managed automatically.
    }

    // goodB2G() - use BadSource and GoodSink
    private goodB2G(): void { // No 'throws Throwable' in ArkTS
        let data: number | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        let dataSerialized: Uint8Array;

        try {
            // To replicate the original logic, we simulate serialization using JSON.
            // This converts the number or null to a JSON string, then encodes it into a Uint8Array.
            const dataString = JSON.stringify(data);
            dataSerialized = new TextEncoder().encode(dataString);

            // Create an instance of the sink class and pass the serialized data.
            (new CWE476_NULL_Pointer_Dereference__Integer_75b()).goodB2GSink(dataSerialized);
        } catch (error: any) {
            // Catching any errors during the simulated serialization process.
            IO.logger.warn(`Error during serialization simulation: ${error.message}`, error);
        }
        // In ArkTS, stream closing like in Java is not necessary for these string/JSON operations,
        // as resources are managed automatically.
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        // Calling the static mainFromParent method, typically provided by the test framework.
        CWE476_NULL_Pointer_Dereference__Integer_75a.mainFromParent(args);
    }
}