import { IO, AbstractTestCase } from './testcasesupport';

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_71b.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-71b.tmpl.java
*/
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 71 Data flow: data passed as an Object reference argument from one method to another in different classes in the same package
export class CWE476_NULL_Pointer_Dereference__StringBuilder_71b {
    public badSink(dataObject: any): void {
        // To replicate the original logic, we simulate a scenario where this value could be null.
        // In ArkTS/TypeScript, we explicitly type it as 'string | null' to represent this possibility.
        let data: string | null = dataObject as string | null;

        // POTENTIAL FLAW: A null dereference will occur if 'data' is null.
        // Attempting to access '.length' on a null 'data' will cause a runtime error.
        IO.writeLine('' + data.length);
    }

    // goodG2B() - use goodsource and badsink
    public goodG2BSink(dataObject: any): void {
        // To replicate the original logic, we simulate a scenario where this value could be null.
        let data: string | null = dataObject as string | null;

        // POTENTIAL FLAW: A null dereference will occur if 'data' is null.
        // Attempting to access '.length' on a null 'data' will cause a runtime error.
        IO.writeLine('' + data.length);
    }

    // goodB2G() - use badsource and goodsink
    public goodB2GSink(dataObject: any): void {
        // To replicate the original logic, we simulate a scenario where this value could be null.
        let data: string | null = dataObject as string | null;

        // FIX: Validate that 'data' is non-null before attempting to use it.
        if (data != null) {
            IO.writeLine('' + data.length);
        } else {
            IO.writeLine('data is null');
        } 
    }
}

/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__StringBuilder_71a.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-71a.tmpl.java
*/
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 71 Data flow: data passed as an Object reference argument from one method to another in different classes in the same package
export class CWE476_NULL_Pointer_Dereference__StringBuilder_71a extends AbstractTestCase {
    public bad(): void {
        let data: string | null;

        // POTENTIAL FLAW: 'data' is explicitly set to null here.
        data = null;

        // Pass the potentially null 'data' to the bad sink method.
        // In ArkTS/TypeScript, if both classes are in the same file, direct instantiation is possible.
        new CWE476_NULL_Pointer_Dereference__StringBuilder_71b().badSink(data);
    }

    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - use goodsource and badsink
    private goodG2B(): void {
        let data: string | null;

        // FIX: Assign a non-null string to 'data' to prevent null dereference.
        // An empty string represents a non-null StringBuilder equivalent.
        data = '';

        // Pass the non-null 'data' to the bad sink method.
        new CWE476_NULL_Pointer_Dereference__StringBuilder_71b().goodG2BSink(data);
    }

    // goodB2G() - use badsource and goodsink
    private goodB2G(): void {
        let data: string | null;

        // POTENTIAL FLAW: 'data' is explicitly set to null here, similar to the 'bad' method's source.
        data = null;

        // Pass the potentially null 'data' to the good sink method, which includes a null check.
        new CWE476_NULL_Pointer_Dereference__StringBuilder_71b().goodB2GSink(data);
    }

    /*
     * This 'main' method is typically used in Java for standalone testing or binary analysis.
     * In an ArkTS context, application entry points and testing mechanisms differ.
     * This block is not directly runnable as a 'main' function in ArkTS.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
