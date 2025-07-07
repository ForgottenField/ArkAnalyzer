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
 * This code has a NULL Pointer Dereference CWE-476 vulnerability with a scope
 * complexity. http://cwe.mitre.org
 * In the original Java, this tried to get a system property and then
 * remove whitespace. If the key was unknown, calling .trim() on the potentially
 * null result would cause a NULL dereference exception. We replicate this behavior.
 */

// In ArkTS/TypeScript, we use console.warn for simple logging.
// No direct equivalent to java.util.logging.Logger is imported for this scenario.

export class NullPointerDereference_scope_476 {
  public function(cmd: string | null): string | null {
    // BUG
    // To replicate the original logic, we use the non-null assertion operator (!)
    // to allow calling .trim() on 'cmd', even if it might be null,
    // thereby replicating the potential runtime null pointer dereference.
    cmd = cmd!.trim(); // This line will cause a runtime error if cmd is null.
    // Returns the string, with leading and trailing whitespace omitted

    // In the original Java, if 'java.class.path' was undefined, 'cmd' would be null.
    // Calling 'cmd.trim()' in that scenario caused a NULL dereference exception.
    // We simulate this behavior here.
    return cmd;
  }

  constructor() {
    try {
      // In the original Java, this got a system property.
      // To replicate the original behavior where 'cmd' could be null,
      // we initialize it as null.
      let cmd: string | null = null; // Simulates System.getProperty("java.class.path") returning null

      // BUG
      // This call will pass a null 'cmd' to the 'function' method,
      // leading to the null dereference inside 'function'.
      cmd = this.function(cmd);
    } catch (e: any) {
      // In ArkTS, console.warn can be used for logging warnings.
      // We catch the error to demonstrate the exception handling,
      // similar to the original Java RuntimeException catch.
      const exception = `Exception ${e}`;
      console.warn(exception);
    }
  }

  public static main(): void {
    new NullPointerDereference_scope_476();
  }
}

// end of NullPointerDereference_scope_476.java (ArkTS equivalent)
