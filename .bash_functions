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


# Usage: grepc "query" -H
# Depends on `$blog` and `$scratches` to be there.
function grepc() {
   # error check: variables blog and scratches. exit with message
   grep -P -hri -C 0 --group-separator=$'\n\n' "$@" $blog $scratches 
}

function grepo() {
    # get the command results
    local results="$(pcregrep -r -cl $1 $scratches | awk -F: '{ print $2 " " $1 }' | sort -hr)"

    if [[ $2 == "-o" ]]; then 
        echo -n $1 | xsel -bi
        echo "$results" | cut -d" " -f2 | xargs subl3 -n
    else
        echo "$results"
    fi
}

# Usage: grepc ...args
# Depends on `$blog` and `$scratches` to be there.
function clfu() {
    local clfu="$HOME/.clfu"
   # error check: variables blog and scratches. exit with message
   grep --color=always -P "$1" -B 1 --group-separator "" "$clfu" | less -FXR
}
