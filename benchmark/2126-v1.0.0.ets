// goodCodeComplexity/NullPointerDereference_good_LocalControlFlow_476.ts
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
 * This code has a NULL Pointer Dereference CWE-476 vulnerability, with a
 * Local Control Flow complexity (switch). http://cwe.mitre.org
 * Here we try to get a system-like property from a specified key and
 * then remove whitespace. If the key is unknown, the value could be null, 
 * but in this 'good' example, the potential null dereference is handled.
 */

// No direct ArkTS equivalent for java.util.logging.Logger. Using console.warn for logging.

export class NullPointerDereference_good_LocalControlFlow_476 {
    // Simulates the main method entry point for the application.
    static main(): void {
        try {
            let i: number = 1;
            switch (i) {
                case 1:
                    // Simulates getting a system-like property indicated by the specified key.
                    // In a real ArkTS/TypeScript environment, system properties like 'java.class.path'
                    // are not directly available. We provide a default string to simulate a non-null return
                    // for the 'good' example behavior.
                    let cmd: string | null = "  simulated/path/to/classes  "; // Simulate System.getProperty("java.class.path")

                    if (cmd != null) {
                        // Returns the string, with leading and trailing whitespace omitted.
                        cmd = cmd.trim();
                    }
                    // The original Java code has no 'break;' here, leading to a fall-through to 'default:'.
                    // This behavior is replicated, though in this specific case, it doesn't change execution flow
                    // as 'default:' only contains 'break;'.
                default:
                    break;
            }
        } catch (re: Error) { // Using a generic Error type as SecurityException is Java-specific.
            // No direct ArkTS equivalent for java.util.logging.Logger.
            // Using console.warn for logging purposes.
            const exception: string = "Exception " + re;
            console.warn(exception);
        }
    }
}
