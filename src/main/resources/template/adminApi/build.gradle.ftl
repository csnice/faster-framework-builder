plugins {
    id 'java'
    id 'org.springframework.boot' version '2.0.2.RELEASE'
}

group '${projectName}'
version '1.0-SNAPSHOT'

sourceCompatibility = 1.8
sourceSets.main.resources.srcDirs = ["src/main/java", "src/main/resources"]
repositories {
    mavenCentral()
    maven { url 'http://maven.aliyun.com/nexus/content/groups/public/' }
}

dependencies {
    compile 'com.github.faster-framework:faster-framework-core-spring-boot-starter:${dependencyVersion}'
    compile 'com.github.faster-framework:faster-framework-admin-spring-boot-starter:${dependencyVersion}'
}