// goodCodeComplexity.ets

// This software was developed at the National Institute of Standards and
// Technology by employees of the Federal Government in the course of their
// official duties. Pursuant to title 17 Section 105 of the United States
// Code this software is not subject to copyright protection and is in the
// public domain. NIST assumes no responsibility whatsoever for its use by
// other parties, and makes no guarantees, expressed or implied, about its
// quality, reliability, or any other characteristic.
//
// This reference program was developed in June 2009 as part of the Software
// Assurance Metrics And Tool Evaluation (SAMATE) project.
// We would appreciate acknowledgment if the software is used.
// The SAMATE project website is: http://samate.nist.gov

// This code has a NULL Pointer Dereference CWE-476 vulnerability, with a
// inter procedural scope complexity. http://cwe.mitre.org
// Here we try to get a simulated system property from a specified key and
// then remove whitespace. If the key is unknown, the value could be null
// leading to a potential null dereference if not checked.

// Helper function to simulate System.getProperty from Java.
// In ArkTS, direct equivalents for Java system properties do not exist in the same way.
// This function mimics the behavior where retrieving a property by key might return null
// if the property is not found or set.
function getSimulatedSystemProperty(key: string): string | null {
  if (key === "java.class.path") {
    // For this specific key, we return a non-null value to replicate the original flow
    // where System.getProperty("java.class.path") typically returns a string.
    return "/path/to/simulated/classpath";
  }
  // For other keys, or to simulate a property not being set, this function can return null.
  return null;
}

class NullPointerDereference_good_scope_476 {

  // This method processes a string by trimming its whitespace.
  // It is designed to mirror the behavior of the original Java method.
  // Note: If 'cmd' is null when this method is called, it will result in a runtime error.
  public function(cmd: string): string {
    // Returns the string, with leading and trailing whitespace omitted.
    // This operation (trim()) will cause a null pointer dereference if 'cmd' is null.
    cmd = cmd.trim();
    return cmd;
  }

  constructor() {
    try {
      // To replicate the original logic, we simulate retrieving a system-like property.
      // This value could potentially be null, just like System.getProperty in Java.
      let cmd: string | null = getSimulatedSystemProperty("java.class.path");

      // A null check is performed here, replicating the original Java code's conditional execution.
      // This prevents the null pointer dereference from occurring in this specific execution path.
      if (cmd !== null) {
        cmd = this.function(cmd);
      }
    } catch (e: Error) {
      // The original Java code caught SecurityException. In ArkTS, a general Error is caught
      // to demonstrate similar error handling without Java-specific exception types.
      const logger = console; // Using console for basic logging, similar to Java's Logger.
      let exception = `Exception ${e.name}: ${e.message}`;
      logger.warn(exception);
    }
  }

  // The main method for the class, simulating Java's static main.
  static main(argv: string[]): void {
    new NullPointerDereference_good_scope_476();
  }
}
