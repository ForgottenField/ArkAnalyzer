import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_41 extends AbstractTestCase {

    private badSink(data: string | null): void {
        // Potential flaw: Accessing 'length' on 'data' when it is null will cause a runtime error.
        IO.writeLine("" + data.length);
    }

    public bad(): void {
        let data: string | null;

        // Potential flaw: 'data' is deliberately assigned a null value.
        data = null;

        this.badSink(data);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    private goodG2BSink(data: string | null): void {
        // Potential flaw: Accessing 'length' on 'data' when it is null will cause a runtime error.
        IO.writeLine("" + data.length);
    }

    /* goodG2B() - use good source and bad sink */
    private goodG2B(): void {
        let data: string | null;

        // Fix: 'data' is initialized to a non-null string value.
        data = "";

        this.goodG2BSink(data);
    }

    private goodB2GSink(data: string | null): void {
        // Fix: Validate that 'data' is not null before accessing its properties.
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }

    /* goodB2G() - use bad source and good sink */
    private goodB2G(): void {
        let data: string | null;

        // Potential flaw: 'data' is deliberately assigned a null value.
        data = null;

        this.goodB2GSink(data);
    }

    /*
     * Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
