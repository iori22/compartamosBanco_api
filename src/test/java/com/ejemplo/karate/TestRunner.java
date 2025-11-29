package com.ejemplo.karate;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run("src/test/java/com/ejemplo/karate/features/servicio.feature").outputCucumberJson(true);
    }
}
