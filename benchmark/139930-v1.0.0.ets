import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__String_45 extends AbstractTestCase {

    // Private member variables, explicitly typed to allow null to replicate the original Java behavior.
    private dataBad: string | null;
    private dataGoodG2B: string | null;
    private dataGoodB2G: string | null;

    // Method to simulate a bad sink scenario.
    private badSink(): void {
        let data: string | null = this.dataBad;

        // Potential flaw: A null dereference will occur if 'data' is null.
        // To replicate the original Java bug, we use the non-null assertion operator (!)
        // which tells TypeScript to treat 'data' as non-null at this point,
        // allowing the runtime error to occur if 'data' is indeed null.
        IO.writeLine("" + data!.length);
    }

    // Bad method: sets data to null and calls the bad sink.
    public bad(): void {
        let data: string | null;

        // To replicate the original logic, 'data' is intentionally set to null here.
        data = null;

        this.dataBad = data;
        this.badSink();
    }

    // Good method: orchestrates good scenarios.
    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // Sink for goodG2B scenario (bad sink, but good source).
    private goodG2BSink(): void {
        let data: string | null = this.dataGoodG2B;

        // Potential flaw: A null dereference will occur if 'data' is null.
        // To replicate the original Java bug, we use the non-null assertion operator (!)
        // which tells TypeScript to treat 'data' as non-null at this point,
        // allowing the runtime error to occur if 'data' is indeed null.
        IO.writeLine("" + data!.length);
    }

    // goodG2B() - uses a good source and a bad sink.
    private goodG2B(): void {
        let data: string; // This variable will hold a non-null string.

        // Fix: 'data' is assigned a non-null value here.
        data = "This is not null";

        this.dataGoodG2B = data;
        this.goodG2BSink();
    }

    // Sink for goodB2G scenario (good sink, bad source).
    private goodB2GSink(): void {
        let data: string | null = this.dataGoodB2G;

        // Fix: Validates that 'data' is not null before use.
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }

    // goodB2G() - uses a bad source and a good sink.
    private goodB2G(): void {
        let data: string | null;

        // To replicate the original logic, 'data' is intentionally set to null here.
        data = null;

        this.dataGoodB2G = data;
        this.goodB2GSink();
    }

    /*
     * The main method serves as the entry point for running this test case independently,
     * or for building a binary to use in testing binary analysis tools.
     * It is not used when compiling all the test cases as one application,
     * which is how source code analysis tools are typically tested.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
