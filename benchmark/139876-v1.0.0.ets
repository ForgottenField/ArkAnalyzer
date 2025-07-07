class KindsOfStringBuilder {
  private _value: string = "";

  public append(s: string): KindsOfStringBuilder {
    this._value += s;
    return this;
  }

  public length(): number {
    return this._value.length;
  }

  public toString(): string {
    return this._value;
  }
}

import { IO, AbstractTestCase } from './testcasesupport';

export class CWE476_NULL_Pointer_Dereference__StringBuilder_06 extends AbstractTestCase {
    /*
     * This variable is declared "readonly", allowing analysis tools to
     * determine that reads will always yield its initialized value.
     */
    private static readonly PRIVATE_STATIC_FINAL_FIVE: number = 5;

    public bad(): void {
        let data: KindsOfStringBuilder | null;
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // POTENTIAL FLAW: 'data' is assigned 'null'.
            data = null;
        } else {
            /*
             * INCIDENTAL: This code path will not be executed,
             * but it serves to ensure 'data' is initialized to avoid
             * compilation errors.
             */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__StringBuilder_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // POTENTIAL FLAW: A null dereference will occur if 'data' is null,
            // as its 'length()' method is accessed.
            // The '!' operator is used here to replicate the original Java behavior
            // where a null pointer dereference would occur at runtime.
            IO.writeLine("" + data!.length());
        }
    }

    /*
     * goodG2B1() - Demonstrates a good source and a bad sink by
     * modifying the condition in the initial assignment of 'data'.
     */
    private goodG2B1(): void {
        let data: KindsOfStringBuilder | null;
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_06.PRIVATE_STATIC_FINAL_FIVE !== 5) {
            /*
             * INCIDENTAL: This code path will not be executed,
             * but it serves to ensure 'data' is initialized to avoid
             * compilation errors.
             */
            data = null;
        } else {
            // FIX: 'data' is explicitly initialized to a non-null value.
            data = new KindsOfStringBuilder();
        }

        if (CWE476_NULL_Pointer_Dereference__StringBuilder_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // POTENTIAL FLAW: A null dereference will occur if 'data' is null,
            // as its 'length()' method is accessed.
            IO.writeLine("" + data!.length());
        }
    }

    /*
     * goodG2B2() - Demonstrates a good source and a bad sink by
     * reordering the statements in the first conditional block.
     */
    private goodG2B2(): void {
        let data: KindsOfStringBuilder | null;
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // FIX: 'data' is explicitly initialized to a non-null value.
            data = new KindsOfStringBuilder();
        } else {
            /*
             * INCIDENTAL: This code path will not be executed,
             * but it serves to ensure 'data' is initialized to avoid
             * compilation errors.
             */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__StringBuilder_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // POTENTIAL FLAW: A null dereference will occur if 'data' is null,
            // as its 'length()' method is accessed.
            IO.writeLine("" + data!.length());
        }
    }

    /*
     * goodB2G1() - Demonstrates a bad source and a good sink by
     * modifying the condition in the second conditional block.
     */
    private goodB2G1(): void {
        let data: KindsOfStringBuilder | null;
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // POTENTIAL FLAW: 'data' is assigned 'null'.
            data = null;
        } else {
            /*
             * INCIDENTAL: This code path will not be executed,
             * but it serves to ensure 'data' is initialized to avoid
             * compilation errors.
             */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__StringBuilder_06.PRIVATE_STATIC_FINAL_FIVE !== 5) {
            // INCIDENTAL: This code path will not be executed.
            IO.writeLine("Benign, fixed string");
        } else {
            // FIX: Validate that 'data' is not null before accessing its method.
            if (data !== null) {
                IO.writeLine("" + data.length());
            } else {
                IO.writeLine("data is null");
            }
        }
    }

    /*
     * goodB2G2() - Demonstrates a bad source and a good sink by
     * reordering the statements in the second conditional block.
     */
    private goodB2G2(): void {
        let data: KindsOfStringBuilder | null;
        if (CWE476_NULL_Pointer_Dereference__StringBuilder_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // POTENTIAL FLAW: 'data' is assigned 'null'.
            data = null;
        } else {
            /*
             * INCIDENTAL: This code path will not be executed,
             * but it serves to ensure 'data' is initialized to avoid
             * compilation errors.
             */
            data = null;
        }

        if (CWE476_NULL_Pointer_Dereference__StringBuilder_06.PRIVATE_STATIC_FINAL_FIVE === 5) {
            // FIX: Validate that 'data' is not null before accessing its method.
            if (data !== null) {
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

    /*
     * The 'main' method below is primarily for testing this test case in isolation.
     * It is not utilized when all test cases are compiled together as a single application,
     * which is the typical scenario for source code analysis tool testing.
     */
    public static main(args: string[]): void {
        AbstractTestCase.mainFromParent(args);
    }
}