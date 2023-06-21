package org.example;

import com.code_intelligence.jazzer.api.FuzzedDataProvider;

class MainFuzzTest {

    public static void fuzzerTestOneInput(FuzzedDataProvider data) {
        Main.main(new String[] { data.consumeString(20) });
    }
}
