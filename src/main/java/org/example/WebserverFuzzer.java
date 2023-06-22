package org.example;

import com.code_intelligence.jazzer.api.FuzzedDataProvider;

public class WebserverFuzzer {
    public static void fuzzerTestOneInput(FuzzedDataProvider data) {
        try {
            Webserver.checkUrl(data.consumeString(20));
        } catch (Exception exc) {
            // Ignore exceptions
        }
    }
}
