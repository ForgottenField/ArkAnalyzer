import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_45 extends AbstractTestCase {

    private dataBad: number[] | null;
    private dataGoodG2B: number[] | null;
    private dataGoodB2G: number[] | null;

    private badSink(): void {
        // Replicating the original logic, 'data' can be null here.
        let data: number[] | null = this.dataBad;

        // POTENTIAL FLAW: A null dereference will occur if 'data' is null.
        // Accessing 'length' on a potentially null array will cause a runtime error.
        IO.writeLine("" + data!.length); // Using '!' for non-null assertion to match Java's direct dereference, simulating the bug.
    }

    public bad(): void {
        let data: number[] | null;

        // POTENTIAL FLAW: The 'data' variable is explicitly set to null.
        data = null;

        this.dataBad = data;
        this.badSink();
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    private goodG2BSink(): void {
        // Replicating the original logic, 'data' can be null here.
        let data: number[] | null = this.dataGoodG2B;

        // POTENTIAL FLAW: A null dereference will occur if 'data' is null.
        // Accessing 'length' on a potentially null array will cause a runtime error.
        IO.writeLine("" + data!.length); // Using '!' for non-null assertion to match Java's direct dereference, simulating the bug.
    }

    // goodG2B() - use goodsource and badsink
    private goodG2B(): void {
        let data: number[] | null;

        // FIX: The 'data' array is explicitly initialized to a non-null value.
        data = new Array<number>(5);

        this.dataGoodG2B = data;
        this.goodG2BSink();
    }

    private goodB2GSink(): void {
        // Replicating the original logic, 'data' can be null here.
        let data: number[] | null = this.dataGoodB2G;

        // FIX: Validates that 'data' is not null before accessing its properties.
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }

    // goodB2G() - use badsource and goodsink
    private goodB2G(): void {
        let data: number[] | null;

        // POTENTIAL FLAW: The 'data' variable is explicitly set to null.
        data = null;

        this.dataGoodB2G = data;
        this.goodB2GSink();
    }

    /*
     * This `main` method is typically used for standalone testing or binary analysis.
     * It is not used when compiling all test cases as part of a larger ArkTS application.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}