/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__String_12.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-12.tmpl.ts
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Assigns a null value to the variable
* GoodSource: Assigns a non-null value to the variable
* Sinks:
*    GoodSink: Adds a check to prevent the possibility of null dereference
*    BadSink : Allows the possibility of null dereference
* Flow Variant: 12 Control flow: if(IO.staticReturnsTrueOrFalse())
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_12 extends AbstractTestCase {
    bad(): void {
        let data: string | null; // Declare data, allowing it to be a string or null
        if (IO.staticReturnsTrueOrFalse()) {
            /* POTENTIAL FLAW: data is assigned null, which could lead to a dereference error later */
            data = null;
        } else {
            /* FIX: data is assigned a non-null value */
            data = "This is not null";
        }

        if (IO.staticReturnsTrueOrFalse()) {
            /* POTENTIAL FLAW: Accessing the 'length' property will cause a null dereference error if 'data' is null.
             * This replicates the original Java bug where a method call on a null object causes an exception. */
            IO.writeLine("" + data!.length); // Use non-null assertion (!) for direct translation of the bug
        } else {
            /* FIX: Validate that data is non-null before accessing its properties. */
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodG2B() - This method uses a good source (always non-null data) and a bad sink (no null check). */
    private goodG2B(): void {
        let data: string | null;
        if (IO.staticReturnsTrueOrFalse()) {
            /* FIX: data is assigned a non-null value */
            data = "This is not null";
        } else {
            /* FIX: data is assigned a non-null value */
            data = "This is not null";
        }

        if (IO.staticReturnsTrueOrFalse()) {
            /* POTENTIAL FLAW: Accessing the 'length' property will cause a null dereference error if 'data' is null.
             * This replicates the original Java bug where a method call on a null object causes an exception. */
            IO.writeLine("" + data!.length); // Use non-null assertion (!) for direct translation of the bug
        } else {
            /* POTENTIAL FLAW: Accessing the 'length' property will cause a null dereference error if 'data' is null.
             * This replicates the original Java bug where a method call on a null object causes an exception. */
            IO.writeLine("" + data!.length); // Use non-null assertion (!) for direct translation of the bug
        }
    }

    /* goodB2G() - This method uses a bad source (potentially null data) and a good sink (with null check). */
    private goodB2G(): void {
        let data: string | null;
        if (IO.staticReturnsTrueOrFalse()) {
            /* POTENTIAL FLAW: data is assigned null, which could lead to a dereference error later */
            data = null;
        } else {
            /* POTENTIAL FLAW: data is assigned null, which could lead to a dereference error later */
            data = null;
        }

        if (IO.staticReturnsTrueOrFalse()) {
            /* FIX: Validate that data is non-null before accessing its properties. */
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        } else {
            /* FIX: Validate that data is non-null before accessing its properties. */
            if (data != null) {
                IO.writeLine("" + data.length);
            }
            else {
                IO.writeLine("data is null");
            }
        }
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /*
     * This main method is used when testing this specific test case in isolation or when building
     * a binary for testing binary analysis tools. It is not used when compiling all test cases
     * as a single application, which is the typical approach for source code analysis tool testing.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
