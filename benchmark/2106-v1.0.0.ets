/*
 * This software was developed at the National Institute of Standards and
 * Technology by employees of the Federal Government in the course of their
 * official duties. Pursuant to title 17 Section 105 of the United States
 * Code this software is not subject to copyright protection and is in the
 * public domain. NIST assumes no responsibility whatsoever for its use by
 * other parties, and makes no guarantees, expressed or implied, about its
 * quality, reliability, or any other characteristic.
 *
 * This reference program was developed in June 2009 as part of the Software
 * Assurance Metrics And Tool Evaluation (SAMATE) project.
 * We would appreciate acknowledgment if the software is used.
 * The SAMATE project website is: http://samate.nist.gov
 */

/*
 * This code has a Null Pointer Dereference CWE-476 vulnerability with a local
 * control flow complexity. http://cwe.mitre.org
 * Here we attempt to retrieve a system property using a specified key,
 * and then remove leading and trailing whitespace from the retrieved value.
 * If the key does not correspond to an existing system property, the retrieval
 * operation can return null. Attempting to call the 'trim()' method on this
 * null value will lead to a runtime exception.
 */

// In ArkTS, standard logging can be done using console or hilog.
// We'll use console.error for simplicity to log exceptions.

// To replicate the original logic, we simulate a scenario where this value could be null.
function getSystemProperty(key: string): string | null {
  // In a real ArkTS environment, retrieving system properties might involve specific APIs.
  // For the purpose of replicating the original Java vulnerability where
  // System.getProperty could return null if the property is undefined,
  // we intentionally return null for "java.class.path" to trigger the bug.
  if (key === "java.class.path") {
    return null; // Simulating an undefined system property
  }
  // For other keys, we could return a placeholder or a real property if available.
  return "some_default_value";
}

class NullPointerDereference_LocalControlFlow_476 {
  static main(): void {
    try {
      let i: number = 1;
      switch (i) {
        case 1:
          // Retrieves a simulated system property value based on the specified key.
          // This function is designed to return null for "java.class.path" to replicate the original bug.
          let cmd: string | null = getSystemProperty("java.class.path");

          // BUG
          // Returns the string, with leading and trailing whitespace omitted.
          // The '!' operator asserts that 'cmd' is non-null at this point for the type checker.
          // However, if 'cmd' is actually null at runtime (as simulated by getSystemProperty),
          // this operation will cause a runtime error, replicating the original vulnerability.
          cmd = cmd!.trim();

          // If the simulated 'java.class.path' property is undefined, the value assigned to
          // 'cmd' will be null. Consequently, attempting to call 'trim()' on a null value
          // will cause a runtime exception (similar to a Null Pointer Dereference).
          break; // The break statement is inside the case block
        default:
          break;
      }
    } catch (e: Error) {
      // In ArkTS, console.error is used for logging errors.
      let exception: string = `Exception ${e.message}`;
      console.error(exception);
    }
  }
}

// Call the main method to execute the logic
NullPointerDereference_LocalControlFlow_476.main();