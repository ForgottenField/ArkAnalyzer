import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__binary_if_17 extends AbstractTestCase {
    public bad(): void {
        for (let j = 0; j < 1; j++) {
            {
                let myString: string | null = null;
                // FLAW: To replicate the original logic where both sides of the condition are evaluated,
                // and the second side causes a null pointer dereference, we explicitly trigger the null dereference.
                // In ArkTS, there is no direct equivalent of Java's non-short-circuit '&' operator for booleans.
                // The explicit non-null assertion '!' is used to bypass type checks and force the dereference,
                // causing a TypeError at runtime when 'myString' is null, just like a NullPointerException in Java.
                if (myString!.length > 0) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    /* good1() use the GoodSinkBody in the for statement */
    private good1(): void {
        for (let k = 0; k < 1; k++) {
            {
                let myString: string | null = null;
                // FIX: Use '&&' in the if statement so that if the left side of the expression is false,
                // the right side will not be evaluated, preventing a potential null dereference.
                if ((myString != null) && (myString.length > 0)) {
                    IO.writeLine("The string length is greater than 0");
                }
            }
        }
    }

    public good(): void {
        this.good1();
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCaseBase.mainFromParent(args);
    }
}
