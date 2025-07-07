/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_15.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-15.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 15 Control flow: switch(6) and switch(7)
*
* */

// Translates Java's 'import testcasesupport.*;' for ArkTS
import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_15 extends AbstractTestCase {

    // The 'bad' method demonstrates a potential null pointer dereference.
    // In ArkTS/TypeScript, we use 'string | null' to explicitly allow null values,
    // replicating the original Java behavior where a String reference could be null.
    bad(): void { // Java's 'throws Throwable' is not directly translated in ArkTS/TypeScript as exceptions are handled differently.
        let data: string | null;

        switch (6) {
            case 6:
                /* POTENTIAL FLAW: 'data' is assigned null, replicating the original Java behavior. */
                data = null;
                break;
            default:
                /* INCIDENTAL: CWE 561 Dead Code. This path will never be executed.
                 * It is included to ensure `data` is initialized before its use, similar to the original Java design. */
                data = null;
                break;
        }

        switch (7) {
            case 7:
                /* POTENTIAL FLAW: A null dereference will occur if 'data' is null.
                 * The '!' operator (non-null assertion) is used here to replicate the direct access
                 * that would lead to a NullPointerException in Java, deliberately bypassing
                 * TypeScript's strict null checks for faithfulness to the original bug. */
                IO.writeLine("" + data!.length); // In ArkTS/TypeScript, 'length' is a property of a string, not a method.
                break;
            default:
                /* INCIDENTAL: CWE 561 Dead Code. This code path will never be executed. */
                IO.writeLine("Benign, fixed string");
                break;
        }
    }

    /* goodG2B1() - uses a good source and a bad sink by changing the first switch to switch(5) */
    private goodG2B1(): void {
        let data: string | null;

        switch (5) {
            case 6:
                /* INCIDENTAL: CWE 561 Dead Code. This path will never be executed.
                 * It is included to ensure `data` is initialized before its use, similar to the original Java design. */
                data = null;
                break;
            default:
                /* FIX: 'data' is explicitly assigned a non-null value. */
                data = "This is not null";
                break;
        }

        switch (7) {
            case 7:
                /* POTENTIAL FLAW: A null dereference will occur if 'data' is null.
                 * The '!' operator is used to replicate the direct access that would lead to a NullPointerException,
                 * preserving the original bug's nature. */
                IO.writeLine("" + data!.length);
                break;
            default:
                /* INCIDENTAL: CWE 561 Dead Code. This code path will never be executed. */
                IO.writeLine("Benign, fixed string");
                break;
        }
    }

    /* goodG2B2() - uses a good source and a bad sink by reversing the blocks in the first switch */
    private goodG2B2(): void {
        let data: string | null;

        switch (6) {
            case 6:
                /* FIX: 'data' is explicitly assigned a non-null value. */
                data = "This is not null";
                break;
            default:
                /* INCIDENTAL: CWE 561 Dead Code. This path will never be executed.
                 * It is included to ensure `data` is initialized before its use, similar to the original Java design. */
                data = null;
                break;
        }

        switch (7) {
            case 7:
                /* POTENTIAL FLAW: A null dereference will occur if 'data' is null.
                 * The '!' operator is used to replicate the direct access that would lead to a NullPointerException,
                 * preserving the original bug's nature. */
                IO.writeLine("" + data!.length);
                break;
            default:
                /* INCIDENTAL: CWE 561 Dead Code. This code path will never be executed. */
                IO.writeLine("Benign, fixed string");
                break;
        }
    }

    /* goodB2G1() - uses a bad source and a good sink by changing the second switch to switch(8) */
    private goodB2G1(): void {
        let data: string | null;

        switch (6) {
            case 6:
                /* POTENTIAL FLAW: 'data' is assigned null, replicating the original Java behavior. */
                data = null;
                break;
            default:
                /* INCIDENTAL: CWE 561 Dead Code. This path will never be executed.
                 * It is included to ensure `data` is initialized before its use, similar to the original Java design. */
                data = null;
                break;
        }

        switch (8) {
            case 7:
                /* INCIDENTAL: CWE 561 Dead Code. This code path will never be executed. */
                IO.writeLine("Benign, fixed string");
                break;
            default:
                /* FIX: Validates that 'data' is non-null before dereferencing it. */
                if (data != null) {
                    IO.writeLine("" + data.length); // In ArkTS/TypeScript, 'length' is a property.
                } else {
                    IO.writeLine("data is null");
                }
                break;
        }
    }

    /* goodB2G2() - uses a bad source and a good sink by reversing the blocks in the second switch */
    private goodB2G2(): void {
        let data: string | null;

        switch (6) {
            case 6:
                /* POTENTIAL FLAW: 'data' is assigned null, replicating the original Java behavior. */
                data = null;
                break;
            default:
                /* INCIDENTAL: CWE 561 Dead Code. This path will never be executed.
                 * It is included to ensure `data` is initialized before its use, similar to the original Java design. */
                data = null;
                break;
        }

        switch (7) {
            case 7:
                /* FIX: Validates that 'data' is non-null before dereferencing it. */
                if (data != null) {
                    IO.writeLine("" + data.length); // In ArkTS/TypeScript, 'length' is a property.
                } else {
                    IO.writeLine("data is null");
                }
                break;
            default:
                /* INCIDENTAL: CWE 561 Dead Code. This code path will never be executed. */
                IO.writeLine("Benign, fixed string");
                break;
        }
    }

    public good(): void {
        this.goodG2B1();
        this.goodG2B2();
        this.goodB2G1();
        this.goodB2G2();
    }

    /* Below is the main() method. It is primarily used when this testcase is built individually
     * for testing or to create a binary for analysis tools. It is not typically used when all
     * testcases are compiled together as a single application, which is common for source code analysis tool testing.
     */
    public static main(args: string[]): void { // Java-specific exceptions like ClassNotFoundException, InstantiationException, IllegalAccessException are omitted in ArkTS.
        AbstractTestCase.mainFromParent(args);
    }
}