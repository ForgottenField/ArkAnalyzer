// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__binary_if_05.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.pointflaw.label.xml
// Template File: point-flaw-05.tmpl.ts

//
// @description
// CWE: 476 NULL Pointer Dereference
// Sinks: binary_if
//    GoodSink: Do not check for null after the object has been dereferenced
//    BadSink : Check for null after an object has already been dereferenced
// Flow Variant: 05 Control flow: if(privateTrue) and if(privateFalse)
//

import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_05 extends AbstractTestCase {
    // The two variables below are not declared as 'readonly' but are never
    // assigned any other value, so a tool should be able to identify that
    // reads of these will always return their initialized values.
    private privateTrue: boolean = true;
    private privateFalse: boolean = false;

    public bad(): void {
        if (this.privateTrue) {
            let myString: string | null = null;
            // FLAW: In TypeScript/ArkTS, using a single '&' (bitwise AND) with boolean expressions will evaluate both sides,
            // leading to a dereference of 'myString' even when it is null, causing a runtime error.
            // The '!' operator is used to assert non-null, replicating the original Java null pointer dereference behavior.
            if ((myString != null) & (myString!.length > 0)) {
                IO.writeLine("The string length is greater than 0");
            }
        }
    }

    // good1() changes privateTrue to privateFalse
    private good1(): void {
        if (this.privateFalse) {
            // INCIDENTAL: This code is unreachable due to the 'privateFalse' condition, replicating the original dead code.
            IO.writeLine("Benign, fixed string");
        } else {
            let myString: string | null = null;

            // FIX: Use '&&' (logical AND) in the if statement. If the left side of the expression evaluates to false,
            // the right side will not be evaluated, preventing dereferencing a null value.
            if ((myString != null) && (myString.length > 0)) {
                IO.writeLine("The string length is greater than 0");
            }
        }
    }

    // good2() reverses the bodies in the if statement
    private good2(): void {
        if (this.privateTrue) {
            let myString: string | null = null;
            // FIX: Use '&&' (logical AND) in the if statement. If the left side of the expression evaluates to false,
            // the right side will not be evaluated, preventing dereferencing a null value.
            if ((myString != null) && (myString.length > 0)) {
                IO.writeLine("The string length is greater than 0");
            }
        }
    }

    public good(): void {
        this.good1();
        this.good2();
    }

    // Below is the main(). It is only used when building this testcase on
    // its own for testing or for building a binary to use in testing binary
    // analysis tools. It is not used when compiling all the testcases as one
    // application, which is how source code analysis tools are tested.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
