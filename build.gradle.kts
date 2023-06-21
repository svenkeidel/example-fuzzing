plugins {
    java
    application
    jacoco
    id("com.code-intelligence.cifuzz") version "1.2.0"
}

group = "org.example"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    implementation("com.code-intelligence:jazzer:0.18.0")
    implementation("com.code-intelligence:jazzer-junit:0.18.0")
    implementation(platform("org.junit:junit-bom:5.9.1"))
    implementation("org.junit.jupiter:junit-jupiter")
}

application {
    mainClass.set("org.example.Main")
}

tasks.jar {
    manifest {
        attributes(mapOf(
                "Main-Class" to "org.example.Main"
        ))
    }
}

jacoco {
    applyTo(tasks.run.get())
}

tasks.register<JacocoReport>("applicationCodeCoverageReport") {
    executionData(tasks.run.get())
    sourceSets(sourceSets.main.get())
}

tasks.test {
    useJUnitPlatform()
}