/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_81_base.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81_base.tmpl.ts
*/
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export abstract class CWE476_NULL_Pointer_Dereference__int_array_81_base {
    abstract action(data: number[] | null): void;
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_81_goodG2B.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81_goodG2B.tmpl.ts
*/
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_81_goodG2B extends CWE476_NULL_Pointer_Dereference__int_array_81_base {
    action(data: number[] | null): void {
        /* POTENTIAL FLAW: null dereference will occur if data is null.
         * To replicate the original behavior, we use the non-null assertion operator. */
        IO.writeLine("" + data!.length);
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_81_bad.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81_bad.tmpl.ts
*/
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_81_bad extends CWE476_NULL_Pointer_Dereference__int_array_81_base {
    action(data: number[] | null): void {
        /* POTENTIAL FLAW: null dereference will occur if data is null.
         * To replicate the original behavior, we use the non-null assertion operator. */
        IO.writeLine("" + data!.length);
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_81a.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81a.tmpl.ts
*/
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_81a extends AbstractTestCase {
    bad(): void {
        let data: number[] | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        let baseObject: CWE476_NULL_Pointer_Dereference__int_array_81_base = new CWE476_NULL_Pointer_Dereference__int_array_81_bad();
        baseObject.action(data);
    }

    good(): void {
        this.goodG2B();
        this.goodB2G();
    }

    /* goodG2B() - use GoodSource and BadSink */
    private goodG2B(): void {
        let data: number[] | null;

        /* FIX: set data to a non-null value */
        data = new Array<number>(5);

        let baseObject: CWE476_NULL_Pointer_Dereference__int_array_81_base = new CWE476_NULL_Pointer_Dereference__int_array_81_goodG2B();
        baseObject.action(data);
    }

    /* goodB2G() - use BadSource and GoodSink */
    private goodB2G(): void {
        let data: number[] | null;

        /* POTENTIAL FLAW: data is null */
        data = null;

        let baseObject: CWE476_NULL_Pointer_Dereference__int_array_81_base = new CWE476_NULL_Pointer_Dereference__int_array_81_goodB2G();
        baseObject.action(data);
    }

    /* Below is the main(). It is only used when building this testcase on
     * its own for testing or for building a binary to use in testing binary
     * analysis tools. It is not used when compiling all the testcases as one
     * application, which is how source code analysis tools are tested.
     */
    static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}


/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE476_NULL_Pointer_Dereference__int_array_81_goodB2G.ts
Label Definition File: CWE476_NULL_Pointer_Dereference.label.xml
Template File: sources-sinks-81_goodB2G.tmpl.ts
*/
// @description
// CWE: 476 Null Pointer Dereference
// BadSource:  Set data to null
// GoodSource: Set data to a non-null value
// Sinks:
//    GoodSink: add check to prevent possibility of null dereference
//    BadSink : possibility of null dereference
// Flow Variant: 81 Data flow: data passed in a parameter to an abstract method
import { IO, AbstractTestCase, AbstractTestCaseBase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__int_array_81_goodB2G extends CWE476_NULL_Pointer_Dereference__int_array_81_base {
    action(data: number[] | null): void {
        /* FIX: validate that data is non-null */
        if (data !== null) {
            IO.writeLine("" + data.length);
        } else {
            IO.writeLine("data is null");
        }
    }
}
