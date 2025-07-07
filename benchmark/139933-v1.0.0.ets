// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__String_53b.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-53b.tmpl.ts

// This file is part of a series of test cases designed to illustrate the CWE-476 Null Pointer Dereference vulnerability.
// This specific variant demonstrates data flow from a source through multiple methods to a sink.

// Description:
// CWE: 476 Null Pointer Dereference
// BadSource: Assigns a null value to 'data'.
// GoodSource: Assigns a non-null value to 'data'.
// Sinks:
//    GoodSink: Includes a check to prevent a null dereference.
//    BadSink : Allows for a null dereference if 'data' is null.
// Flow Variant: 53 Data flow: 'data' is passed as an argument from one method through two others to a fourth method. All four functions are part of the same logical test case structure.

// Import necessary external components.
import { IO, AbstractTestCase } from './testcasesupport';

// This class acts as an intermediary, passing 'data' to the next stage in the data flow chain.
export class CWE476_NULL_Pointer_Dereference__String_53b {
    // Passes a potentially null 'data' value to the badSink method of the next class in the chain.
    public badSink(data: string | null): void {
        new CWE476_NULL_Pointer_Dereference__String_53c().badSink(data);
    }

    // goodG2B() - This method simulates a scenario where 'data' originates from a 'good' source but is directed to a 'bad' sink.
    // It passes 'data' to the goodG2BSink method of the next class in the chain.
    public goodG2BSink(data: string | null): void {
        new CWE476_NULL_Pointer_Dereference__String_53c().goodG2BSink(data);
    }

    // goodB2G() - This method simulates a scenario where 'data' originates from a 'bad' source but is directed to a 'good' sink.
    // It passes 'data' to the goodB2GSink method of the next class in the chain.
    public goodB2GSink(data: string | null): void {
        new CWE476_NULL_Pointer_Dereference__String_53c().goodB2GSink(data);
    }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__String_53c.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-53c.tmpl.ts

// This file is part of a series of test cases illustrating CWE-476 Null Pointer Dereference.
// This specific variant demonstrates data flow from a source through multiple methods to a sink.

// Description:
// CWE: 476 Null Pointer Dereference
// BadSource: Assigns a null value to 'data'.
// GoodSource: Assigns a non-null value to 'data'.
// Sinks:
//    GoodSink: Includes a check to prevent a null dereference.
//    BadSink : Allows for a null dereference if 'data' is null.
// Flow Variant: 53 Data flow: 'data' is passed as an argument from one method through two others to a fourth method. All four functions are part of the same logical test case structure.

// This class acts as another intermediary, passing 'data' to the final sink stage.
export class CWE476_NULL_Pointer_Dereference__String_53c {
    // Passes a potentially null 'data' value to the badSink method of the final class in the chain.
    public badSink(data: string | null): void {
        new CWE476_NULL_Pointer_Dereference__String_53d().badSink(data);
    }

    // goodG2B() - This method simulates a scenario where 'data' originates from a 'good' source but is directed to a 'bad' sink.
    // It passes 'data' to the goodG2BSink method of the final class in the chain.
    public goodG2BSink(data: string | null): void {
        new CWE476_NULL_Pointer_Dereference__String_53d().goodG2BSink(data);
    }

    // goodB2G() - This method simulates a scenario where 'data' originates from a 'bad' source but is directed to a 'good' sink.
    // It passes 'data' to the goodB2GSink method of the final class in the chain.
    public goodB2GSink(data: string | null): void {
        new CWE476_NULL_Pointer_Dereference__String_53d().goodB2GSink(data);
    }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__String_53d.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-53d.tmpl.ts

// This file is part of a series of test cases illustrating CWE-476 Null Pointer Dereference.
// This specific variant demonstrates data flow from a source through multiple methods to a sink.

// Description:
// CWE: 476 Null Pointer Dereference
// BadSource: Assigns a null value to 'data'.
// GoodSource: Assigns a non-null value to 'data'.
// Sinks:
//    GoodSink: Includes a check to prevent a null dereference.
//    BadSink : Allows for a null dereference if 'data' is null.
// Flow Variant: 53 Data flow: 'data' is passed as an argument from one method through two others to a fourth method. All four functions are part of the same logical test case structure.

// This class contains the final sink methods where the null pointer dereference may or may not occur.
export class CWE476_NULL_Pointer_Dereference__String_53d {
    // This bad sink method will cause a null pointer dereference if 'data' is null.
    public badSink(data: string | null): void {
        // POTENTIAL FLAW: A null dereference will occur here if 'data' is null, as 'length' is accessed without a null check.
        // The original Java logic is replicated where accessing 'data.length()' would throw a runtime error for null 'data'.
        IO.writeLine("" + (data as string).length);
    }

    // goodG2B() - This method simulates a scenario where 'data' originates from a 'good' source but is directed to a 'bad' sink.
    // This bad sink method will cause a null pointer dereference if 'data' is null.
    public goodG2BSink(data: string | null): void {
        // POTENTIAL FLAW: A null dereference will occur here if 'data' is null, as 'length' is accessed without a null check.
        // The original Java logic is replicated where accessing 'data.length()' would throw a runtime error for null 'data'.
        IO.writeLine("" + (data as string).length);
    }

    // goodB2G() - This method simulates a scenario where 'data' originates from a 'bad' source but is directed to a 'good' sink.
    // This good sink method includes a null check to prevent dereferencing a null 'data'.
    public goodB2GSink(data: string | null): void {
        // FIX: Validates that 'data' is not null before attempting to access its 'length' property.
        if (data != null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }
}

// TEMPLATE GENERATED TESTCASE FILE
// Filename: CWE476_NULL_Pointer_Dereference__String_53a.ts
// Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
// Template File: sources-sinks-53a.tmpl.ts

// This file is part of a series of test cases illustrating CWE-476 Null Pointer Dereference.
// This specific variant demonstrates data flow from a source through multiple methods to a sink.

// Description:
// CWE: 476 Null Pointer Dereference
// BadSource: Assigns a null value to 'data'.
// GoodSource: Assigns a non-null value to 'data'.
// Sinks:
//    GoodSink: Includes a check to prevent a null dereference.
//    BadSink : Allows for a null dereference if 'data' is null.
// Flow Variant: 53 Data flow: 'data' is passed as an argument from one method through two others to a fourth method. All four functions are part of the same logical test case structure.

// This is the main test case class, extending AbstractTestCase for test framework compatibility.
export class CWE476_NULL_Pointer_Dereference__String_53a extends AbstractTestCase {
    // The 'bad' method demonstrates a scenario leading to a null pointer dereference.
    public bad(): void {
        let data: string | null;

        // POTENTIAL FLAW: 'data' is explicitly assigned a null value here, which will lead to a dereference error later.
        data = null;

        // The null 'data' is then passed down the chain to the bad sink.
        new CWE476_NULL_Pointer_Dereference__String_53b().badSink(data);
    }

    // The 'good' method contains scenarios that either prevent or handle null dereferences.
    public good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    // goodG2B() - This method simulates a scenario where 'data' originates from a 'good' source but is directed to a 'bad' sink.
    private goodG2B(): void {
        let data: string | null;

        // FIX: 'data' is hardcoded to a non-null string value, preventing a null dereference from the source side.
        data = "This is not null";

        // The non-null 'data' is then passed down the chain to the bad sink.
        new CWE476_NULL_Pointer_Dereference__String_53b().goodG2BSink(data);
    }

    // goodB2G() - This method simulates a scenario where 'data' originates from a 'bad' source but is directed to a 'good' sink.
    private goodB2G(): void {
        let data: string | null;

        // POTENTIAL FLAW: 'data' is explicitly assigned a null value here, but it will be handled by the good sink.
        data = null;

        // The null 'data' is then passed down the chain to the good sink, which includes a null check.
        new CWE476_NULL_Pointer_Dereference__String_53b().goodB2GSink(data);
    }

    // This is the main entry point for running this test case independently.
    // It is primarily used for individual testing or building binaries for analysis tools,
    // not when compiling all test cases as a single application.
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}
