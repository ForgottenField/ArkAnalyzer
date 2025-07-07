/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_67a.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-67a.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Assigns null to a string variable.
 * GoodSource: Assigns a non-null value to a string variable.
 * Sinks:
 *    GoodSink: Includes a check to prevent null dereference.
 *    BadSink : Does not include a check, allowing potential null dereference.
 * Flow Variant: 67 Data flow: Data is passed within a class structure between different parts of the application.
 *
 * */

// Imports necessary support classes from a relative path.
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

// To replicate the original logic where 'Container' was an inner static class in Java,
// we define it as a top-level class in ArkTS/TypeScript. This allows it to be
// accessed by other classes within the same module, simulating the original data flow.
class Container {
    // In ArkTS/TypeScript, properties can be explicitly typed to allow null.
    public containerOne: string | null;
}

// Represents the primary test case class.
class CWE476_NULL_Pointer_Dereference__String_67a extends AbstractTestCase {

    public bad(): void {
        let data: string | null; // Declares a string variable that can also hold null.

        /* POTENTIAL FLAW: The 'data' variable is assigned a null value. */
        data = null;

        let dataContainer: Container = new Container();
        dataContainer.containerOne = data;
        // Instantiates 'CWE476_NULL_Pointer_Dereference__String_67b' and calls its 'badSink' method,
        // passing the container that holds the potentially null 'data'.
        (new CWE476_NULL_Pointer_Dereference__String_67b()).badSink(dataContainer);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - This method uses a good source to provide data to a bad sink. */
    private goodG2B(): void {
        let data: string | null;

        /* FIX: Assigning a non-null string to 'data'. */
        data = "This is not null";

        let dataContainer: Container = new Container();
        dataContainer.containerOne = data;
        // Instantiates and calls 'goodG2BSink' on 'CWE476_NULL_Pointer_Dereference__String_67b'.
        (new CWE476_NULL_Pointer_Dereference__String_67b()).goodG2BSink(dataContainer);
    }

    /* goodB2G() - This method uses a bad source to provide data to a good sink. */
    private goodB2G(): void {
        let data: string | null;

        /* POTENTIAL FLAW: The 'data' variable is assigned a null value. */
        data = null;

        let dataContainer: Container = new Container();
        dataContainer.containerOne = data;
        // Instantiates and calls 'goodB2GSink' on 'CWE476_NULL_Pointer_Dereference__String_67b'.
        (new CWE476_NULL_Pointer_Dereference__String_67b()).goodB2GSink(dataContainer);
    }

    /* This 'main' method is included for standalone execution and testing.
     * It is not used when the test cases are compiled as part of a larger application
     * for source code analysis tools. It delegates to a parent method for common setup.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}

// This class represents the secondary part of the data flow, simulating a separate file.
// All comments are adapted for ArkTS context.
/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_67b.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-67b.tmpl.ts
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Assigns null to a string variable.
 * GoodSource: Assigns a non-null value to a string variable.
 * Sinks:
 *    GoodSink: Includes a check to prevent null dereference.
 *    BadSink : Does not include a check, allowing potential null dereference.
 * Flow Variant: 67 Data flow: Data is passed within a class structure between different parts of the application.
 *
 * */

// Imports the IO utility from the testcasesupport module.
import { IO } from './testcasesupport';

class CWE476_NULL_Pointer_Dereference__String_67b {
    // The 'dataContainer' parameter is typed as 'Container', which is defined in the same scope.
    public badSink(dataContainer: Container): void {
        // Retrieves the string data from the container. It can be null.
        let data: string | null = dataContainer.containerOne;

        /* POTENTIAL FLAW: A null pointer dereference will occur here if 'data' is null. */
        // Replicating the original Java bug: attempting to access 'length' on a potentially null string.
        // In ArkTS/TypeScript, 'length' is a property, not a method.
        IO.writeLine("" + data!.length); // Use '!' to suppress TypeScript's null check, replicating the Java bug.

    }

    /* goodG2BSink() - This method uses a good source and a bad sink. */
    public goodG2BSink(dataContainer: Container): void {
        let data: string | null = dataContainer.containerOne;

        /* POTENTIAL FLAW: A null pointer dereference will occur here if 'data' is null. */
        // Replicating the original Java bug: no null check before accessing 'length'.
        IO.writeLine("" + data!.length); // Use '!' to suppress TypeScript's null check.

    }

    /* goodB2GSink() - This method uses a bad source and a good sink. */
    public goodB2GSink(dataContainer: Container): void {
        let data: string | null = dataContainer.containerOne;

        /* FIX: Validating that 'data' is not null before proceeding. */
        if (data != null) {
            // Accessing 'length' is safe because 'data' is checked for null.
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }
}