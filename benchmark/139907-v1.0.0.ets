// CWE476_NULL_Pointer_Dereference__StringBuilder_81_base.ts
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/**
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Sets a value to null
 * GoodSource: Sets a value to a non-null value
 * Sinks:
 *    GoodSink: Adds a check to prevent a potential null dereference
 *    BadSink : Has a possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 */
export abstract class CWE476_NULL_Pointer_Dereference__StringBuilder_81_base {
    /**
     * Abstract method to be implemented by derived classes.
     * @param data The string value, which might be null.
     */
    public abstract action(data: string | null): void;
}

// CWE476_NULL_Pointer_Dereference__StringBuilder_81_goodB2G.ts
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/**
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Sets a value to null
 * GoodSource: Sets a value to a non-null value
 * Sinks:
 *    GoodSink: Adds a check to prevent a potential null dereference
 *    BadSink : Has a possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 */
export class CWE476_NULL_Pointer_Dereference__StringBuilder_81_goodB2G extends CWE476_NULL_Pointer_Dereference__StringBuilder_81_base {
    /**
     * Implements the action method with a null check to prevent dereference.
     * @param data The string value, which might be null.
     */
    public action(data: string | null): void {
        // FIX: Validate that 'data' is non-null before attempting to access its properties.
        if (data != null) {
            IO.writeLine('' + data.length);
        } else {
            IO.writeLine('data is null');
        }
    }
}

// CWE476_NULL_Pointer_Dereference__StringBuilder_81_bad.ts
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/**
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Sets a value to null
 * GoodSource: Sets a value to a non-null value
 * Sinks:
 *    GoodSink: Adds a check to prevent a potential null dereference
 *    BadSink : Has a possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 */
export class CWE476_NULL_Pointer_Dereference__StringBuilder_81_bad extends CWE476_NULL_Pointer_Dereference__StringBuilder_81_base {
    /**
     * Implements the action method with a potential null dereference.
     * @param data The string value, which might be null.
     */
    public action(data: string | null): void {
        // POTENTIAL FLAW: A null dereference will occur if 'data' is null,
        // as this code attempts to access its 'length' property directly.
        IO.writeLine('' + data.length);
    }
}

// CWE476_NULL_Pointer_Dereference__StringBuilder_81_goodG2B.ts
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/**
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Sets a value to null
 * GoodSource: Sets a value to a non-null value
 * Sinks:
 *    GoodSink: Adds a check to prevent a potential null dereference
 *    BadSink : Has a possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 */
export class CWE476_NULL_Pointer_Dereference__StringBuilder_81_goodG2B extends CWE476_NULL_Pointer_Dereference__StringBuilder_81_base {
    /**
     * Implements the action method with a potential null dereference.
     * @param data The string value, which might be null.
     */
    public action(data: string | null): void {
        // POTENTIAL FLAW: A null dereference will occur if 'data' is null,
        // as this code attempts to access its 'length' property directly.
        IO.writeLine('' + data.length);
    }
}

// CWE476_NULL_Pointer_Dereference__StringBuilder_81a.ts
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/**
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Sets a value to null
 * GoodSource: Sets a value to a non-null value
 * Sinks:
 *    GoodSink: Adds a check to prevent a potential null dereference
 *    BadSink : Has a possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 */
export class CWE476_NULL_Pointer_Dereference__StringBuilder_81a extends AbstractTestCase {
    /**
     * Simulates a scenario leading to a null pointer dereference.
     */
    public bad(): void {
        let data: string | null;

        // POTENTIAL FLAW: The 'data' variable is explicitly set to null.
        data = null;

        let baseObject: CWE476_NULL_Pointer_Dereference__StringBuilder_81_base = new CWE476_NULL_Pointer_Dereference__StringBuilder_81_bad();
        baseObject.action(data);
    }

    /**
     * Contains good variants that prevent null pointer dereferences.
     */
    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /**
     * goodG2B() - Uses a good source and a bad sink.
     * The source provides a non-null value, but the sink does not perform null validation.
     */
    private goodG2B(): void {
        let data: string | null;

        // FIX: 'data' is initialized to a non-null empty string.
        data = ''; // Equivalent to new StringBuilder() for string content

        let baseObject: CWE476_NULL_Pointer_Dereference__StringBuilder_81_base = new CWE476_NULL_Pointer_Dereference__StringBuilder_81_goodG2B();
        baseObject.action(data);
    }

    /**
     * goodB2G() - Uses a bad source and a good sink.
     * The source provides a null value, but the sink performs null validation.
     */
    private goodB2G(): void {
        let data: string | null;

        // POTENTIAL FLAW: The 'data' variable is explicitly set to null.
        data = null;

        let baseObject: CWE476_NULL_Pointer_Dereference__StringBuilder_81_base = new CWE476_NULL_Pointer_Dereference__StringBuilder_81_goodB2G();
        baseObject.action(data);
    }

    /**
     * The main method, used for standalone testing of this test case.
     * It is not utilized when compiling all test cases as a single application.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}