#! /bin/bash

## java spring shell
function jss() {

    ## make sure that running from the root dir - should have a pom.xml there
    if [[ ! -f pom.xml ]]; then
        echo "File pom.xml missing. Try again from root directory."
        return
    fi

    ## build the jar - if fail to build, stop going.
    mvn install -DskipTests
    if [[ $? != 0 ]]; then
        echo "Failed to compile. Exiting."
        return
    fi

    ## extract the jar to prep for classpath export
    cd target
    jar xf *.jar
    cd ..

    ## export the classpath
    export CLASSPATH="target/BOOT-INF/classes/:target/BOOT-INF/lib/*"

    ## run java shell
    jshell boot.jsh
}
