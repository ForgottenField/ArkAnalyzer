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
 * This code demonstrates a correctly handled scenario for a potential Null Pointer Dereference CWE-476.
 * http://cwe.mitre.org
 * Here, we attempt to retrieve a simulated system property. If the property is found,
 * leading and trailing whitespace is removed. If the property value could potentially
 * be null (simulated here), the code explicitly checks for null before attempting
 * to dereference it (e.g., calling .trim()). This prevents a null pointer exception.
 * Any errors during property retrieval are caught.
 */

// In ArkTS, console functions are typically used for logging instead of a dedicated Logger class.

export class NullPointerDereference_good_476 {

    // To replicate the original behavior, we simulate a system property retrieval.
    // In a real ArkTS environment, accessing platform-specific properties would
    // involve different APIs, like NAPI or specific OpenHarmony system services.
    // This simulation might return null or throw an error depending on the 'key'
    // to mimic Java's System.getProperty behavior.
    private static getSimulatedProperty(key: string): string | null {
        if (key === "java.class.path") {
            // For the 'good' example, return a non-null string to show successful operation
            // and allow the .trim() operation to proceed safely.
            return "/data/app/path/to/my/app.hap "; // Include a trailing space to demonstrate trim()
        } else if (key === "unknown.property") {
            // This case demonstrates a property not being found, resulting in null.
            return null;
        } else if (key === "security.restricted") {
            // This case simulates a security exception that would be caught by the try-catch block.
            throw new Error("SecurityException: Access denied to " + key);
        }
        return null; // Default case, property not recognized
    }

    public static main(argv?: string[]): void {
        try {
            // Retrieves a simulated system property value based on the specified key.
            // This mimics Java's System.getProperty, which could return null or throw an exception.
            let cmd: string | null = NullPointerDereference_good_476.getSimulatedProperty("java.class.path");

            if (cmd !== null) {
                // If the simulated property value is not null, safely remove leading and trailing whitespace.
                cmd = cmd.trim();
                console.log("Simulated property value after trim: '" + cmd + "'");
            } else {
                console.log("Simulated property value is null.");
            }
        } catch (re: Error) {
            // Catches any errors that occur during the simulated property retrieval,
            // similar to catching a SecurityException in Java.
            let exception: string = "Caught Exception: " + re.message;
            console.warn(exception);
        }
    }
}

// In a typical ArkTS application, you would call the main method or instantiate
// the class from an entry point, e.g., in a Page's onPageShow or an App's onCreate.
// Example of how to run this from an entry file (e.g., index.ets or app.ets):
// NullPointerDereference_good_476.main();

// end of NullPointerDereference_good_476.java (adapted for ArkTS)