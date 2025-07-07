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
 * This code has a Null Pointer Dereference (CWE-476) vulnerability with an address
 * alias level complexity. http://cwe.mitre.org
 * Here, we attempt to retrieve an environment variable's value using a specified key
 * and then remove whitespace. If the key is not set, attempting to call a method
 * on the resulting 'undefined' value leads to a runtime exception.
 */

// No specific imports are required for console logging in ArkTS.

/**
 * This function demonstrates a Null Pointer Dereference (CWE-476) vulnerability,
 * replicating the logic of the original Java class's main method.
 */
export function NullPointerDereference_AddressAliasLevel_476(): void {
  try {
    // Obtains an environment variable's value as indicated by the specified key.
    // In ArkTS, this typically involves accessing `process.env`.
    // To replicate the original Java behavior where the property might be null/undefined,
    // we use 'process.env' which can return 'undefined' if the variable is not set.
    let aliasCmd: (string | null | undefined)[] = new Array(1);
    aliasCmd[0] = process.env['JAVA_CLASS_PATH']; // Simulate System.getProperty

    // BUG
    // Attempts to return the string, with leading and trailing whitespace omitted.
    // If aliasCmd[0] is undefined (or null), calling trim() will cause a TypeError (runtime error).
    aliasCmd[0] = aliasCmd[0].trim();

    // If the environment variable 'JAVA_CLASS_PATH' is not set, its value will be undefined.
    // In such a scenario, aliasCmd[0] will hold 'undefined'.
    // Attempting to call the 'trim()' method on 'undefined' will then cause a runtime error (TypeError).

  } catch (e: any) {
    // In ArkTS, we use console.error or console.warn for logging, similar to Java's Logger.
    // Note: The original Java code catches RuntimeException, which maps to general Errors in ArkTS.
    const exception = `Exception ${e}`; 
    console.error(exception); 
  }
}

// end of NullPointerDereference_AddressAliasLevel_476.ets