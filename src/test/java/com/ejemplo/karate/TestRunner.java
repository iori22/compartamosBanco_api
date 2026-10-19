package com.ejemplo.karate;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run("src/test/java/com/ejemplo/karate/features/retoTecnicoInetum.feature")
                .tags("@Crear")
                .systemProperty("karate.env", "qa")
                .outputCucumberJson(true);

        // PARA EL REPORTE ES ESTE:  mvn clean test "-Dkarate.env=qa"
    }
}
