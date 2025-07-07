export class IO {

  /* Fill in these parameters if you want to be able to actually connect
   * to a database. In a real ArkTS application, database interaction
   * would involve specific ArkTS or Node.js database modules, not Java's JDBC.
   */
  private static readonly dbUrl: string = "";
  private static readonly dbUsername: string = "";
  private static readonly dbPassword: string = "";

  // For logging test case information. This simulates Java's Logger for console output.
  public static readonly logger: any = {
    info: (message: string) => console.info(message),
    warn: (message: string) => console.warn(message),
    error: (message: string) => console.error(message)
  };

  public static writeString(str: string): void {
    console.info(str); // Replicates System.out.print/println functionality.
  }

  public static writeLine(line: string): void {
    console.info(line);
  }

  // ArkTS/TypeScript does not support Java-style method overloading based on parameter types.
  // We rename methods for distinct signatures to handle different numeric types.
  public static writeLineInt(intNumber: number): void {
    // Replicates Java's String.format("%02d", intNumber) by padding with a leading zero if needed.
    IO.writeLine(String(intNumber).padStart(2, '0'));
  }

  public static writeLineLong(longNumber: number): void {
    // Replicates Java's String.format("%02d", longNumber) by padding with a leading zero if needed.
    IO.writeLine(String(longNumber).padStart(2, '0'));
  }

  public static writeLineDouble(doubleNumber: number): void {
    // Replicates Java's String.format("%02f", doubleNumber). For general display,
    // direct string conversion is often sufficient without specific padding for floating-point numbers.
    IO.writeLine(String(doubleNumber));
  }

  public static writeLineFloat(floatNumber: number): void {
    // Replicates Java's String.format("%02f", floatNumber).
    IO.writeLine(String(floatNumber));
  }

  public static writeLineShort(shortNumber: number): void {
    // Replicates Java's String.format("%02d", shortNumber) by padding with a leading zero if needed.
    IO.writeLine(String(shortNumber).padStart(2, '0'));
  }

  public static writeLineByte(byteHex: number): void {
    // Replicates Java's String.format("%02x", byteHex) for hexadecimal representation with padding.
    IO.writeLine(((byteHex as number) & 0xFF).toString(16).padStart(2, '0'));
  }

  /* This method simulates a database connection. In a real ArkTS application,
   * database interaction would involve specific ArkTS or Node.js database modules.
   * We return null here to replicate the potential for a null connection if parameters are missing.
   */
  public static getDBConnection(): any | null {
    if (IO.dbUrl === '' || IO.dbUsername === '' || IO.dbPassword === '') {
      IO.logger.warn("DB connection parameters are empty. Returning null connection.");
      return null;
    }
    return {}; // Simulate a non-null connection for demonstration if parameters were set.
  }

  /* These variables are marked as 'const' or 'readonly', indicating they are assigned once and should retain their initial values. */
  public static readonly STATIC_FINAL_TRUE: boolean = true;
  public static readonly STATIC_FINAL_FALSE: boolean = false;
  public static readonly STATIC_FINAL_FIVE: number = 5;

  /* These variables are not marked as 'const' or 'readonly', but are never
   * assigned any other value. A static analysis tool could identify that
   * reads of these will always return their initialized values. */
  public static staticTrue: boolean = true;
  public static staticFalse: boolean = false;
  public static staticFive: number = 5;

  public static staticReturnsTrue(): boolean {
    return true;
  }

  public static staticReturnsFalse(): boolean {
    return false;
  }

  public static staticReturnsTrueOrFalse(): boolean {
    return Math.random() < 0.5; // Simulates Java's Random().nextBoolean()
  }

  /* Converts an array of numbers (representing byte values) into a hexadecimal string.
   */
  public static toHex(byteBuffer: number[]): string {
    const strBuffer: string[] = [];
    let i: number;

    for (i = 0; i < byteBuffer.length; i++) {
      if (((byteBuffer[i] as number) & 0xFF) < 0x10) {
        strBuffer.push('0');
      }
      strBuffer.push(((byteBuffer[i] as number) & 0xFF).toString(16));
    }

    return strBuffer.join('');
  }
}

/*
 * @description This abstract class is the base for all non-Servlet
 * AbstractTestCase classes.
 *
 */
export abstract class AbstractTestCaseBase {
  public abstract runTest(className: string): void;

  /* In a static context, dynamically obtaining the current class name can be complex.
   * To simplify test case execution without hardcoding class names,
   * we pass the class constructor for instantiation.
   */
  public static mainFromParent(
    TestClass: { new(): AbstractTestCaseBase }, // Accepts the class constructor type.
    className: string // Also pass the class name string directly for logging.
  ): void {
    // In ArkTS/TypeScript, we directly instantiate the class using the provided constructor.
    // The original Java code used reflection (Class.forName, newInstance) which is not idiomatic
    // or directly available in ArkTS/TypeScript in the same way.
    const myObject: AbstractTestCaseBase = new TestClass();
    myObject.runTest(className);
  }
}

/*
 * @description This abstract class is the base for the majority of
 * test cases that are not Servlet or class based issue and have both
 * a "bad" and "good" function.
 *
 */
export abstract class AbstractTestCase extends AbstractTestCaseBase {
  public abstract bad(): void; // Exceptions are not part of method signatures in ArkTS/TS, but they can still be thrown/caught.

  public abstract good(): void; // Exceptions are not part of method signatures in ArkTS/TS.

  public runTest(className: string): void {
    IO.writeLine(`Starting tests for Class ${className}`);

    try {
      this.good();

      IO.writeLine(`Completed good() for Class ${className}`);
    } catch (e: Error | any) { // Catching Errors or other exceptions.
      IO.writeLine(`Caught an error from good() for Class ${className}`);

      // Replicates Java's getMessage() property on the error object.
      IO.writeLine(`Error's message = ${e.message}`);

      // Replicates Java's getStackTrace() using the 'stack' property, which holds the stack trace string.
      IO.writeLine('Stack trace below');
      const stackTrace = e.stack ? e.stack.split('\n') : ['No stack trace available'];
      for (const stackTraceElement of stackTrace) {
        IO.writeLine(stackTraceElement.trim());
      }
    }

    try {
      this.bad();

      IO.writeLine(`Completed bad() for Class ${className}`);
    } catch (e: Error | any) {
      IO.writeLine(`Caught an error from bad() for Class ${className}`);

      IO.writeLine(`Error's message = ${e.message}`);

      IO.writeLine('Stack trace below');
      const stackTrace = e.stack ? e.stack.split('\n') : ['No stack trace available'];
      for (const stackTraceElement of stackTrace) {
        IO.writeLine(stackTraceElement.trim());
      }
    }
  } /* runTest */
}

