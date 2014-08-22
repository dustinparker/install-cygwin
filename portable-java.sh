#!/bin/bash

fatal() {
    echo "$@"
    exit 1
}

mandatory() {
    "$@" || fatal "Command failed: $@"
}

prefix="$HOME/Software"

installer="$1"
shift

[ -x "$(which cabextract)" ] || apt-cyg -u install cabextract

[ -f "$installer" ] || fatal "$installer not found"

basename="$(basename "$installer")"

case "$basename" in
jdk-*-windows-*.exe)
    ;;
*)
    echo "$basename filename doesn't appear to be a JDK"
    exit 1
    ;;
esac

release="${basename%-windows*.exe}"

[ -d "$prefix/$release" ] && fatal "$prefix/$release already exists"

echo "Installing to $release"

mandatory mkdir --parents "$prefix/$release"
mandatory cabextract -d "$TMP" -F tools.zip "$installer"
mandatory unzip -q "$TMP/tools.zip" -d "$prefix/$release"

(
    IFS=$'\n'
    cd "$prefix/$release"
    for i in $(find -name '*.pack'); do
        mandatory bin/unpack200 "$i" "${i%.pack}.jar" && rm "$i"
    done
)

echo "Setting JAVA_HOME"

setx JAVA_HOME "$(cygpath -w "$prefix/$release")"
