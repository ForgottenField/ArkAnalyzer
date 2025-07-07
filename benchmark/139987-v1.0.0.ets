// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__int_array_09.java
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-09.tmpl.java

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 09 Control flow: if(IO.STATIC_FINAL_TRUE) and if(IO.STATIC_FINAL_FALSE)

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_09 extends AbstractTestCase {

    public bad(): void {
        let data: number[] | null; // Declare 'data' as an array of numbers or null.
        if (IO.STATIC_FINAL_TRUE) {
            // POTENTIAL FLAW: 'data' is null.
            data = null;
        } else {
            // INCIDENTAL: CWE 561 Dead Code, the code below will never run.
            // However, we include it to match the original Java logic for 'data' initialization.
            data = null;
        }

        if (IO.STATIC_FINAL_TRUE) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
            // We use '!' to bypass TypeScript's static null checks and replicate the runtime bug.
            IO.writeLine("" + data!.length);
        }
    }

    // goodG2B1() - use goodsource and badsink by changing first IO.STATIC_FINAL_TRUE to IO.STATIC_FINAL_FALSE
    private goodG2B1(): void {
        let data: number[] | null; // Declare 'data' as an array of numbers or null.
        if (IO.STATIC_FINAL_FALSE) {
            // INCIDENTAL: CWE 561 Dead Code, the code below will never run.
            // However, we include it to match the original Java logic for 'data' initialization.
            data = null;
        } else {
            // FIX: 'data' is explicitly set to a non-null array.
            data = new Array<number>(5);
        }

        if (IO.STATIC_FINAL_TRUE) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
            // We use '!' to bypass TypeScript's static null checks and replicate the runtime bug.
            IO.writeLine("" + data!.length);
        }
    }

    // goodG2B2() - use goodsource and badsink by reversing statements in first if
    private goodG2B2(): void {
        let data: number[] | null; // Declare 'data' as an array of numbers or null.
        if (IO.STATIC_FINAL_TRUE) {
            // FIX: 'data' is explicitly set to a non-null array.
            data = new Array<number>(5);
        } else {
            // INCIDENTAL: CWE 561 Dead Code, the code below will never run.
            // However, we include it to match the original Java logic for 'data' initialization.
            data = null;
        }

        if (IO.STATIC_FINAL_TRUE) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
            // We use '!' to bypass TypeScript's static null checks and replicate the runtime bug.
            IO.writeLine("" + data!.length);
        }
    }

    // goodB2G1() - use badsource and goodsink by changing second IO.STATIC_FINAL_TRUE to IO.STATIC_FINAL_FALSE
    private goodB2G1(): void {
        let data: number[] | null; // Declare 'data' as an array of numbers or null.
        if (IO.STATIC_FINAL_TRUE) {
            // POTENTIAL FLAW: 'data' is null.
            data = null;
        } else {
            // INCIDENTAL: CWE 561 Dead Code, the code below will never run.
            // However, we include it to match the original Java logic for 'data' initialization.
            data = null;
        }

        if (IO.STATIC_FINAL_FALSE) {
            // INCIDENTAL: CWE 561 Dead Code, the code below will never run.
            IO.writeLine("Benign, fixed string");
        } else {
            // FIX: Validate that 'data' is not null.
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    // goodB2G2() - use badsource and goodsink by reversing statements in second if
    private goodB2G2(): void {
        let data: number[] | null; // Declare 'data' as an array of numbers or null.
        if (IO.STATIC_FINAL_TRUE) {
            // POTENTIAL FLAW: 'data' is null.
            data = null;
        } else {
            // INCIDENTAL: CWE 561 Dead Code, the code below will never run.
            // However, we include it to match the original Java logic for 'data' initialization.
            data = null;
        }

        if (IO.STATIC_FINAL_TRUE) {
            // FIX: Validate that 'data' is not null.
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    public good(): void {
        this.goodG2B1();
        this.goodG2B2();
        this.goodB2G1();
        this.goodB2G2();
    }

    // Below is the main(). It is only used when building this testcase on
    // its own for testing or for building a binary to use in testing binary
    // analysis tools. It is not used when compiling all the testcases as one
    // application, which is how source code analysis tools are tested.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
