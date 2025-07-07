/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_81_base.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81_base.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 *
 * */

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export abstract class CWE476_NULL_Pointer_Dereference__String_81_base {
    // In ArkTS, abstract methods do not use the 'throws' keyword. The 'data' parameter
    // is typed as 'string | null' to explicitly allow for null values, replicating
    // the potential null state from the original Java code.
    abstract action(data: string | null): void;
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_81a.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81a.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 *
 * */

export class CWE476_NULL_Pointer_Dereference__String_81a extends AbstractTestCase {
    public bad(): void {
        let data: string | null; // Declare 'data' with potential null type.

        // POTENTIAL FLAW: To replicate the original logic, this value is explicitly set to null.
        data = null;

        // In ArkTS, we instantiate the specific class and then call the action method,
        // passing the potentially null 'data' variable.
        let baseObject: CWE476_NULL_Pointer_Dereference__String_81_base = new CWE476_NULL_Pointer_Dereference__String_81_bad();
        baseObject.action(data);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - use GoodSource and BadSink
    private goodG2B(): void {
        let data: string | null;

        // FIX: 'data' is assigned a non-null string value.
        data = "This is not null";

        // In ArkTS, we instantiate the specific class and then call the action method.
        let baseObject: CWE476_NULL_Pointer_Dereference__String_81_base = new CWE476_NULL_Pointer_Dereference__String_81_goodG2B();
        baseObject.action(data);
    }

    // goodB2G() - use BadSource and GoodSink
    private goodB2G(): void {
        let data: string | null;

        // POTENTIAL FLAW: To replicate the original logic, this value is explicitly set to null.
        data = null;

        // In ArkTS, we instantiate the specific class and then call the action method.
        let baseObject: CWE476_NULL_Pointer_Dereference__String_81_base = new CWE476_NULL_Pointer_Dereference__String_81_goodB2G();
        baseObject.action(data);
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    // In ArkTS, the 'main' function is not typically structured this way,
    // but to preserve the original test harness logic, we keep the call to 'mainFromParent'.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_81_goodB2G.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81_goodB2G.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 *
 * */

export class CWE476_NULL_Pointer_Dereference__String_81_goodB2G extends CWE476_NULL_Pointer_Dereference__String_81_base {
    public action(data: string | null): void {

        // FIX: Validate that 'data' is non-null before dereferencing it.
        if (data != null)
        {
            // In ArkTS, string length is accessed via the 'length' property directly, not as a method.
            IO.writeLine(String(data.length));
        }
        else
        {
            IO.writeLine("data is null");
        }

    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_81_goodG2B.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81_goodG2B.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 *
 * */

export class CWE476_NULL_Pointer_Dereference__String_81_goodG2B extends CWE476_NULL_Pointer_Dereference__String_81_base {
    public action(data: string | null): void {

        // POTENTIAL FLAW: A null dereference will occur here if 'data' is null, replicating the original vulnerability.
        // The '!' operator is used here to assert that 'data' is non-null at runtime,
        // replicating the behavior of a direct dereference in Java that would throw a NullPointerException.
        IO.writeLine(String(data!.length));

    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_81_bad.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81_bad.tmpl.java
*/
/*
 * @description
 * CWE: 476 Null Pointer Dereference
 * BadSource:  Set data to null
 * GoodSource: Set data to a non-null value
 * Sinks:
 *    GoodSink: add check to prevent possibility of null dereference
 *    BadSink : possibility of null dereference
 * Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
 *
 * */

export class CWE476_NULL_Pointer_Dereference__String_81_bad extends CWE476_NULL_Pointer_Dereference__String_81_base {
    public action(data: string | null): void {

        // POTENTIAL FLAW: A null dereference will occur here if 'data' is null, replicating the original vulnerability.
        // The '!' operator is used here to assert that 'data' is non-null at runtime,
        // replicating the behavior of a direct dereference in Java that would throw a NullPointerException.
        IO.writeLine(String(data!.length));

    }
}
