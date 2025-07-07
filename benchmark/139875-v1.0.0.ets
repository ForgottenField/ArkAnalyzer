/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_05.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-05.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 05 Control flow: if(privateTrue) and if(privateFalse)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_05 extends AbstractTestCase {
    /* These two variables are not declared as 'readonly' but their values are never reassigned,
     * allowing analysis tools to infer their constant nature and ensuring reads always return
     * their initialized values within this context.
     */
    private privateTrue: boolean = true;
    private privateFalse: boolean = false;

    public bad(): void {
        let data: string | null; // Represents java.lang.StringBuilder for length property access
        if (this.privateTrue) {
            /* POTENTIAL FLAW: 'data' is intentionally set to null here to simulate the vulnerability. */
            data = null;
        } else {
            /* This code path is unreachable (dead code) due to the preceding condition.
             * It's included to ensure 'data' is always initialized, preventing potential type
             * errors or undefined behavior in ArkTS. */
            data = null;
        }

        if (this.privateTrue) {
            /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null, replicating the original vulnerability. */
            IO.writeLine("" + data!.length); // Use '!' to bypass TypeScript's null checking, replicating the null dereference
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first privateTrue to privateFalse */
    private goodG2B1(): void {
        let data: string | null;
        if (this.privateFalse) {
            /* This code path is unreachable (dead code) due to the preceding condition.
             * It's included to ensure 'data' is always initialized, preventing potential type
             * errors or undefined behavior in ArkTS. */
            data = null;
        } else {
            /* FIX: 'data' is explicitly initialized to a non-null value. */
            data = ""; // Represents an empty StringBuilder
        }

        if (this.privateTrue) {
            /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null, replicating the original vulnerability. */
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: string | null;
        if (this.privateTrue) {
            /* FIX: 'data' is explicitly initialized to a non-null value. */
            data = ""; // Represents an empty StringBuilder
        } else {
            /* This code path is unreachable (dead code) due to the preceding condition.
             * It's included to ensure 'data' is always initialized, preventing potential type
             * errors or undefined behavior in ArkTS. */
            data = null;
        }

        if (this.privateTrue) {
            /* POTENTIAL FLAW: A null dereference will occur here if 'data' is null, replicating the original vulnerability. */
            IO.writeLine("" + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second privateTrue to privateFalse */
    private goodB2G1(): void {
        let data: string | null;

        if (this.privateTrue) {
            /* POTENTIAL FLAW: 'data' is intentionally set to null here to simulate the vulnerability. */
            data = null;
        } else {
            /* This code path is unreachable (dead code) due to the preceding condition.
             * It's included to ensure 'data' is always initialized, preventing potential type
             * errors or undefined behavior in ArkTS. */
            data = null;
        }

        if (this.privateFalse) {
            /* This code path is unreachable (dead code). */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: A check is performed to ensure 'data' is non-null before dereferencing it. */
            if (data != null) {
                IO.writeLine("" + data.length);
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: string | null;
        if (this.privateTrue) {
            /* POTENTIAL FLAW: 'data' is intentionally set to null here to simulate the vulnerability. */
            data = null;
        } else {
            /* This code path is unreachable (dead code) due to the preceding condition.
             * It's included to ensure 'data' is always initialized, preventing potential type
             * errors or undefined behavior in ArkTS. */
            data = null;
        }

        if (this.privateTrue) {
            /* FIX: A check is performed to ensure 'data' is non-null before dereferencing it. */
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

    /* This is the main entry point, typically used for standalone testing or building
     * binaries for analysis tools. When integrated into a larger application,
     * this method might not be directly invoked, as is common in how ArkTS/TypeScript
     * source code analysis tools are evaluated.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}