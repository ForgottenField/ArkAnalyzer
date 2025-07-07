// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__deref_after_check_02.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
// Template File: point-flaw-02.tmpl.ts

// @description
// CWE: 476 NULL Pointer Dereference
// Sinks: deref_after_check
//    GoodSink: Do not dereference an object if it is null
//    BadSink : Dereference after checking to see if an object is null
// Flow Variant: 02 Control flow: if(true) and if(false)

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__deref_after_check_02 extends AbstractTestCase {
    public bad(): void {
        if (true) {
            {
                // FLAW: The code checks for null, but then still attempts to use the object.
                let myString: string | null = null;
                if (myString == null) {
                    // This will cause a runtime error by attempting to access a property on 'null'.
                    IO.writeLine(myString.length);
                }
            }
        }
    }

    // good1() demonstrates a scenario where the initial condition is 'false'.
    private good1(): void {
        if (false) {
            // INCIDENTAL: This code is unreachable due to the 'false' condition.
            IO.writeLine("Benign, fixed string");
        } else {
            {
                // FIX: The code checks for null and avoids using the object if it is null.
                let myString: string | null = null;

                if (myString == null) {
                    IO.writeLine("The string is null");
                }
            }
        }
    }

    // good2() demonstrates a different arrangement of the 'if' statement logic.
    private good2(): void {
        if (true) {
            {
                // FIX: The code checks for null and avoids using the object if it is null.
                let myString: string | null = null;
                if (myString == null) {
                    IO.writeLine("The string is null");
                }
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    /* This 'main' method is provided for testing the class in isolation.
     * In an ArkTS application, entry points are typically defined differently,
     * but this structure is maintained to mirror the original Java test setup.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
