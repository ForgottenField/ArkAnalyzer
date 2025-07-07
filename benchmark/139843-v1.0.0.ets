// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__Integer_10.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-10.tmpl.ts

// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 10 Control flow: if(IO.staticTrue) and if(IO.staticFalse)

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__Integer_10 extends AbstractTestCase {

    public bad(): void {
        let data: number | null; // To replicate the original logic, 'data' is explicitly typed to allow null.
        if (IO.staticTrue) {
            // POTENTIAL FLAW: 'data' is null here.
            data = null;
        } else {
            // INCIDENTAL: CWE 561 Dead Code. This code will never run, but it's kept to reflect the original initialization pattern.
            data = null;
        }

        if (IO.staticTrue) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
            IO.writeLine("" + data!.toString()); // Use non-null assertion (!) to replicate the original unchecked dereference behavior.
        }
    }

    // goodG2B1() - use goodsource and badsink by changing first IO.staticTrue to IO.staticFalse
    private goodG2B1(): void {
        let data: number | null;
        if (IO.staticFalse) {
            // INCIDENTAL: CWE 561 Dead Code. This code will never run, but it's kept to reflect the original initialization pattern.
            data = null;
        } else {
            // FIX: Explicitly assign a non-null value to 'data'.
            data = 5; // Replicates Integer.valueOf(5) by assigning a primitive number.
        }

        if (IO.staticTrue) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
            IO.writeLine("" + data!.toString()); // Use non-null assertion (!) to replicate the original unchecked dereference behavior.
        }
    }

    // goodG2B2() - use goodsource and badsink by reversing statements in first if
    private goodG2B2(): void {
        let data: number | null;
        if (IO.staticTrue) {
            // FIX: Explicitly assign a non-null value to 'data'.
            data = 5; // Replicates Integer.valueOf(5) by assigning a primitive number.
        } else {
            // INCIDENTAL: CWE 561 Dead Code. This code will never run, but it's kept to reflect the original initialization pattern.
            data = null;
        }

        if (IO.staticTrue) {
            // POTENTIAL FLAW: A null dereference will occur here if 'data' is null.
            IO.writeLine("" + data!.toString()); // Use non-null assertion (!) to replicate the original unchecked dereference behavior.
        }
    }

    // goodB2G1() - use badsource and goodsink by changing second IO.staticTrue to IO.staticFalse
    private goodB2G1(): void {
        let data: number | null;
        if (IO.staticTrue) {
            // POTENTIAL FLAW: 'data' is null here.
            data = null;
        } else {
            // INCIDENTAL: CWE 561 Dead Code. This code will never run, but it's kept to reflect the original initialization pattern.
            data = null;
        }

        if (IO.staticFalse) {
            // INCIDENTAL: CWE 561 Dead Code. This code will never run.
            IO.writeLine("Benign, fixed string");
        } else {
            // FIX: Validate that 'data' is not null before use.
            if (data != null) {
                IO.writeLine("" + data.toString());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    // goodB2G2() - use badsource and goodsink by reversing statements in second if
    private goodB2G2(): void {
        let data: number | null;
        if (IO.staticTrue) {
            // POTENTIAL FLAW: 'data' is null here.
            data = null;
        } else {
            // INCIDENTAL: CWE 561 Dead Code. This code will never run, but it's kept to reflect the original initialization pattern.
            data = null;
        }

        if (IO.staticTrue) {
            // FIX: Validate that 'data' is not null before use.
            if (data != null) {
                IO.writeLine("" + data.toString());
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
        AbstractTestCaseBase.mainFromParent(args);
    }
}
