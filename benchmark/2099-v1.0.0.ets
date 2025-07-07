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
 * We would appreciate acknowledgement if the software is used.
 * The SAMATE project website is: http://samate.nist.gov
 */

/*
 * This code has a NULL Pointer Dereference CWE-476 vulnerability.
 * http://cwe.mitre.org
 * Here we try to get a property and then remove whitespace. If the property is unknown,
 * calling trim() on the resulting null value causes a null pointer dereference.
 */

class NullPointerDereference_476 {
  // The main method equivalent in ArkTS/TypeScript.
  static main(argv: string[]): void {
    try {
      // To replicate the original logic, we simulate a scenario where a configuration
      // property or similar value could be null.
      // The Java code's System.getProperty("java.class.path") could return null if the
      // property is not defined. We explicitly set 'cmd' to null to trigger the bug.
      let cmd: string | null = null; 

      // BUG
      // Attempts to remove leading and trailing whitespace.
      // If 'cmd' is null at this point, attempting to call 'trim()' will cause a runtime error.
      // This precisely replicates the Null Pointer Dereference vulnerability.
      cmd = cmd.trim(); 
      
      // If the simulated property is undefined (null), then 'cmd' will be null.
      // Thus, calling 'cmd.trim()' causes a NULL dereference exception.

    } catch (re) {
      // In ArkTS/TypeScript, runtime errors are typically caught as 'any' or 'Error' objects.
      // console.error is used for logging error messages.
      let exception = `Exception ${re}`;
      console.error(exception);
    }
  }
}

// In a typical ArkTS application, the main entry point might be an ability's onStart or a global function.
// For a direct translation of a standalone class with a main method, one might simulate calling it.
// NullPointerDereference_476.main([]); // Uncomment to execute in a script environment

// end of NullPointerDereference_476.ets