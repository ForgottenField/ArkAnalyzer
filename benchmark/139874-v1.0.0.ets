/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_04.java
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-04.tmpl.java
*/
/*
* @description
* CWE: 476 Null Pointer Dereference
* BadSource:  Set data to null
* GoodSource: Set data to a non-null value
* Sinks:
*    GoodSink: add check to prevent possibility of null dereference
*    BadSink : possibility of null dereference
* Flow Variant: 04 Control flow: if(PRIVATE_STATIC_FINAL_TRUE) and if(PRIVATE_STATIC_FINAL_FALSE)
*
* */

import { IO, AbstractTestCase } from './testcasesupport';

// To precisely replicate the behavior of Java's StringBuilder, including its methods,
// and to ensure the "Method Call" null dereference type is maintained, 
// we define a minimal ArkTSStringBuilder class.
class ArkTSStringBuilder {
    private content: string;

    constructor(initialContent: string = "") {
        this.content = initialContent;
    }

    // Replicates Java's StringBuilder.length() method
    length(): number {
        return this.content.length;
    }

    // Replicates Java's StringBuilder.append() method
    append(s: string): ArkTSStringBuilder {
        this.content += s;
        return this;
    }

    // Replicates Java's StringBuilder.toString() method
    toString(): string {
        return this.content;
    }
}

export class CWE476_NULL_Pointer_Dereference__StringBuilder_04 extends AbstractTestCase {
    /* These variables are declared as 'readonly' and 'static', meaning their values are constant and accessible without an instance. */
    private static readonly PRIVATE_STATIC_FINAL_TRUE: boolean = true;
    private static readonly PRIVATE_STATIC_FINAL_FALSE: boolean = false;

    public bad(): void {
        let data: ArkTSStringBuilder | null;
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This code path will not be taken due to the conditional, but is included to replicate the original structure. */
            data = null; // Ensuring data is initialized even in dead code path for consistency
        }

        if (CWE476_NULL_Pointer_Dereference__StringBuilder_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            // Attempting to call a method on a potentially null 'data' object.
            IO.writeLine("" + data!.length()); // The '!' is used to suppress TypeScript's null-checking, replicating the runtime error.
        }
    }

    /* goodG2B1() - use goodsource and badsink by changing first PRIVATE_STATIC_FINAL_TRUE to PRIVATE_STATIC_FINAL_FALSE */
    private goodG2B1(): void {
        let data: ArkTSStringBuilder | null;
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_04.PRIVATE_STATIC_FINAL_FALSE) {
            /* This code path will not be taken due to the conditional, but is included to replicate the original structure. */
            data = null;
        } else {
            /* FIX: hardcode data to non-null */
            data = new ArkTSStringBuilder();
        }

        if (CWE476_NULL_Pointer_Dereference__StringBuilder_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data!.length());
        }
    }

    /* goodG2B2() - use goodsource and badsink by reversing statements in first if */
    private goodG2B2(): void {
        let data: ArkTSStringBuilder | null;
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* FIX: hardcode data to non-null */
            data = new ArkTSStringBuilder();
        } else {
            /* This code path will not be taken due to the conditional, but is included to replicate the original structure. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__StringBuilder_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: null dereference will occur if data is null */
            IO.writeLine("" + data!.length());
        }
    }

    /* goodB2G1() - use badsource and goodsink by changing second PRIVATE_STATIC_FINAL_TRUE to PRIVATE_STATIC_FINAL_FALSE */
    private goodB2G1(): void {
        let data: ArkTSStringBuilder | null;
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This code path will not be taken due to the conditional, but is included to replicate the original structure. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__StringBuilder_04.PRIVATE_STATIC_FINAL_FALSE) {
            /* This code path will not be taken due to the conditional. */
            IO.writeLine("Benign, fixed string");
        } else {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /* goodB2G2() - use badsource and goodsink by reversing statements in second if  */
    private goodB2G2(): void {
        let data: ArkTSStringBuilder | null;
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* POTENTIAL FLAW: data is null */
            data = null;
        } else {
            /* This code path will not be taken due to the conditional, but is included to replicate the original structure. */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__StringBuilder_04.PRIVATE_STATIC_FINAL_TRUE) {
            /* FIX: validate that data is non-null */
            if (data != null) {
                IO.writeLine("" + data.length());
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

    /* This is the main entry point for the test case, used for direct execution. */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
