import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

/*
* Original template file details for Java:
* Filename: CWE476_NULL_Pointer_Dereference__String_10.java
* Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
* Template File: sources-sinks-10.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 10 Control flow: if(IO.staticTrue) and if(IO.staticFalse)
*
* */

export class CWE476_NULL_Pointer_Dereference__String_10 extends AbstractTestCase {

    public bad(): void {
        let data: string | null; // Declare data, allowing it to be null.

        if (IO.staticTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            // This code path is unreachable due to the condition, but is kept for consistency with the original logic
            // and to ensure 'data' is always assigned, preventing compilation errors.
            data = null;
        }

        if (IO.staticTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java bug (accessing a method on a null object),
            // we use the non-null assertion operator (!) to bypass TypeScript's null checks,
            // allowing a runtime error if 'data' is indeed null.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first IO.staticTrue to IO.staticFalse */
    private goodG2B1(): void {
        let data: string | null;

        if (IO.staticFalse) {
            // This code path is unreachable due to the condition, but is kept for consistency with the original logic
            // and to ensure 'data' is always assigned, preventing compilation errors.
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        }

        if (IO.staticTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java bug (accessing a method on a null object),
            // we use the non-null assertion operator (!) to bypass TypeScript's null checks,
            // allowing a runtime error if 'data' is indeed null.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: string | null;

        if (IO.staticTrue) {
            /* FIX: hardcode data to non-null */
            data = "This is not null";
        } else {
            // This code path is unreachable due to the condition, but is kept for consistency with the original logic
            // and to ensure 'data' is always assigned, preventing compilation errors.
            data = null;
        }

        if (IO.staticTrue) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // To replicate the original Java bug (accessing a method on a null object),
            // we use the non-null assertion operator (!) to bypass TypeScript's null checks,
            // allowing a runtime error if 'data' is indeed null.
            IO.writeLine("" + data!.length);
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second IO.staticTrue to IO.staticFalse */
    private goodB2G1(): void {
        let data: string | null;

        if (IO.staticTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            // This code path is unreachable due to the condition, but is kept for consistency with the original logic
            // and to ensure 'data' is always assigned, preventing compilation errors.
            data = null;
        }

        if (IO.staticFalse) {
            // This code path is unreachable due to the condition.
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that data is non-null */
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

        if (IO.staticTrue) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            // This code path is unreachable due to the condition, but is kept for consistency with the original logic
            // and to ensure 'data' is always assigned, preventing compilation errors.
            data = null;
        }

        if (IO.staticTrue) {
            /* FIX: validate that data is non-null */
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

    /* The main method is used for standalone testing of this test case.
     * It is not typically used when compiling all test cases together for source code analysis.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}