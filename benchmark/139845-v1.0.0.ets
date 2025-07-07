// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_12.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-12.tmpl.ts

/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 12 Control flow: if(IO.staticReturnsTrueOrFalse())
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_12 extends AbstractTestCase {

    bad(): void {
        let data: number | null;
        if (IO.staticReturnsTrueOrFalse()) {
            // POTENTIAL FLAW: 'data' is assigned null.
            data = null;
        } else {
            // FIX: 'data' is assigned a non-null number.
            data = 5;
        }

        if (IO.staticReturnsTrueOrFalse()) {
            // POTENTIAL FLAW: Attempting to call a method on 'data' when it might be null will cause a runtime error.
            // To replicate the original Java bug, a non-null assertion '!' is used here to bypass TypeScript's null safety.
            IO.writeLine("" + data!.toString());
        } else {
            // FIX: Validate that 'data' is not null before accessing its properties.
            if (data !== null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodG2B() - use goodsource and badsink by changing the first "if" so that
     * both branches use the GoodSource */
    private goodG2B(): void {
        let data: number | null;
        if (IO.staticReturnsTrueOrFalse()) {
            // FIX: 'data' is assigned a non-null number.
            data = 5;
        } else {
            // FIX: 'data' is assigned a non-null number.
            data = 5;
        }

        if (IO.staticReturnsTrueOrFalse()) {
            // POTENTIAL FLAW: Attempting to call a method on 'data' when it might be null will cause a runtime error.
            // To replicate the original Java bug, a non-null assertion '!' is used here to bypass TypeScript's null safety.
            IO.writeLine("" + data!.toString());
        } else {
            // POTENTIAL FLAW: Attempting to call a method on 'data' when it might be null will cause a runtime error.
            // To replicate the original Java bug, a non-null assertion '!' is used here to bypass TypeScript's null safety.
            IO.writeLine("" + data!.toString());
        }
    }

    /* goodB2G() - use badsource and goodsink by changing the second "if" so that
     * both branches use the GoodSink */
    private goodB2G(): void {
        let data: number | null;
        if (IO.staticReturnsTrueOrFalse()) {
            // POTENTIAL FLAW: 'data' is assigned null.
            data = null;
        } else {
            // POTENTIAL FLAW: 'data' is assigned null.
            data = null;
        }

        if (IO.staticReturnsTrueOrFalse()) {
            // FIX: Validate that 'data' is not null before accessing its properties.
            if (data !== null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        } else {
            // FIX: Validate that 'data' is not null before accessing its properties.
            if (data !== null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
