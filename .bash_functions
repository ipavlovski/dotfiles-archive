#! /bin/bash

## java spring shell
function jss() {

    ## make sure that running from the root dir - should have a pom.xml there
    if [[ ! -f pom.xml ]]; then
        echo "File pom.xml missing. Try again from root directory."
        return
    fi

    ## build the jar - if fail to build, stop going.
    mvn clean install -DskipTests
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

    ## run java shell with boot.jsh file, if it is there
    local args="-R -Dspring.profiles.active=test"
    local boot="src/main/resources/boot.jsh"
    if [[ -f "$boot" ]]; then
        jshell $args $boot
    else
        jshell $args
    fi
}

## use the 'config' wrapper to add changes, commit them and push them
function config-push() {
    config add -u
    config commit -m "update."
    config push
}

## calculator
function c() {
    printf "%s\n" "$*" | bc 
}

## copy from intellij
