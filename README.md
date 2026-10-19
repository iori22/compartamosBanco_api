Guía completa para levantar el proyecto de 

1) Instalar Java / Maven / Gradle
Ingresar a: https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html
    - Descarga el instalador .msi (Windows)
    - Ejecuta el instalador y sigue las instrucciones.

Ingresar a: https://maven.apache.org/
    -  Descargar y seguir las indicaciones

Ingresar a: https://gradle.org/
-  Descargar y seguir las indicaciones

2) Clona el repositorio o importalo
    - git clone  

Estructura del Proyecto

-proyecto-automatizacion
src
└─ test
├─ java
│    └─ com/ejemplo/proyecto/Karate
│          ├─ features/             # Archivos Gherkin .feature
│          └─ runners/         # Clases para correr pruebas y donde esta la integración con XRAY
└─ resources 
            └─ karate-config.properties   # Archivo de configuración de KarateDSL 
├── pom.xml
├── README.md
├── azure-pipelines.yaml       # El pipeline se ejecuta automáticamente cada vez que se realizan cambios en ramas configuradas (por ejemplo, main o develop)


3) Instalar dependencias necesarias
    - mvn clean verify

4) Ejecutar el escenario de servicios:
   - mvn clean test
   - mvn allure:report
   - mvn allure:serve (Para abrirlo en el navegador)