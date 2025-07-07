// Import necessary modules from the testcasesupport path.
import { IO, AbstractTestCase } from './testcasesupport';

/**
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 67 Data flow: data passed in a class from one method to another in different source files in the same package
 *
 * This file contains two classes, CWE476_NULL_Pointer_Dereference__Integer_67a and _67b,
 * which simulate data flow between methods using a container class.
 */
export class CWE476_NULL_Pointer_Dereference__Integer_67a extends AbstractTestCase {
    /**
     * Helper class to contain and pass a nullable numeric value.
     * In ArkTS, we use 'number | null' to represent this nullable numeric value,
     * mirroring the nullable nature of Java's Integer wrapper class.
     * This class is defined as a static member to replicate Java's static nested class behavior,
     * allowing it to be referenced via 'CWE476_NULL_Pointer_Dereference__Integer_67a.Container'.
     */
    static Container = class {
        containerOne: number | null;
    }

    /**
     * Simulates a bad scenario where a null value is propagated.
     * @throws {Error} if an unexpected error occurs (replicates Java's implicit 'throws Throwable').
     */
    bad(): void {
        let data: number | null;

        /* POTENTIAL FLAW: The 'data' variable is assigned null. */
        data = null;

        // Create an instance of the nested Container class.
        let dataContainer: CWE476_NULL_Pointer_Dereference__Integer_67a.Container = new CWE476_NULL_Pointer_Dereference__Integer_67a.Container();
        dataContainer.containerOne = data;
        // Instantiate and call the badSink method from the related class, passing the container.
        new CWE476_NULL_Pointer_Dereference__Integer_67b().badSink(dataContainer);
    }

    /**
     * Executes both good data flow scenarios.
     */
    good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /**
     * goodG2B() - uses a good source and a bad sink.
     * 'data' is initialized to a non-null value, but still passed to a sink
     * that doesn't check for null, demonstrating a potential vulnerability
     * if the source were to change or be compromised.
     * @throws {Error} if an unexpected error occurs.
     */
    private goodG2B(): void {
        let data: number | null;

        /* FIX: 'data' is assigned a non-null value to prevent a null dereference. */
        data = 5; // Using a number literal directly for the numeric value.

        let dataContainer: CWE476_NULL_Pointer_Dereference__Integer_67a.Container = new CWE476_NULL_Pointer_Dereference__Integer_67a.Container();
        dataContainer.containerOne = data;
        // Call the goodG2BSink method from the related class.
        new CWE476_NULL_Pointer_Dereference__Integer_67b().goodG2BSink(dataContainer);
    }

    /**
     * goodB2G() - uses a bad source and a good sink.
     * 'data' is initialized to null, but the sink properly handles null values.
     * @throws {Error} if an unexpected error occurs.
     */
    private goodB2G(): void {
        let data: number | null;

        /* POTENTIAL FLAW: The 'data' variable is assigned null. */
        data = null;

        let dataContainer: CWE476_NULL_Pointer_Dereference__Integer_67a.Container = new CWE476_NULL_Pointer_Dereference__Integer_67a.Container();
        dataContainer.containerOne = data;
        // Call the goodB2GSink method from the related class.
        new CWE476_NULL_Pointer_Dereference__Integer_67b().goodB2GSink(dataContainer);
    }

    /**
     * This 'main' method is provided for independent execution of this test case,
     * useful for local testing or binary analysis. It is not invoked when all test cases
     * are compiled together for static analysis tools.
     * @param {string[]} args - Command line arguments.
     */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}

/**
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 67 Data flow: data passed in a class from one method to another in different source files in the same package
 */
export class CWE476_NULL_Pointer_Dereference__Integer_67b {

    /**
     * Simulates a bad sink where a null dereference can occur.
     * @param {CWE476_NULL_Pointer_Dereference__Integer_67a.Container} dataContainer - The container holding the nullable numeric value.
     * @throws {Error} if an unexpected error occurs.
     */
    badSink(dataContainer: CWE476_NULL_Pointer_Dereference__Integer_67a.Container): void {
        let data: number | null = dataContainer.containerOne;

        /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null, as 'toString()' is called directly on it. */
        IO.writeLine("" + data.toString());
    }

    /**
     * goodG2B() - uses a good source and a bad sink.
     * This method still contains the potential flaw as it doesn't check for null,
     * relying on the caller to provide non-null data.
     * @param {CWE476_NULL_Pointer_Dereference__Integer_67a.Container} dataContainer - The container holding the nullable numeric value.
     * @throws {Error} if an unexpected error occurs.
     */
    goodG2BSink(dataContainer: CWE476_NULL_Pointer_Dereference__Integer_67a.Container): void {
        let data: number | null = dataContainer.containerOne;

        /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null, as 'toString()' is called directly on it. */
        IO.writeLine("" + data.toString());
    }

    /**
     * goodB2G() - uses a bad source and a good sink.
     * This method demonstrates proper null handling by validating 'data' before use.
     * @param {CWE476_NULL_Pointer_Dereference__Integer_67a.Container} dataContainer - The container holding the nullable numeric value.
     * @throws {Error} if an unexpected error occurs.
     */
    goodB2GSink(dataContainer: CWE476_NULL_Pointer_Dereference__Integer_67a.Container): void {
        let data: number | null = dataContainer.containerOne;

        /* FIX: A check is performed to ensure 'data' is non-null before attempting to use it. */
        if (data != null) {
            IO.writeLine("" + data.toString());
        } else {
            IO.writeLine("data is null");
        }
    }
}