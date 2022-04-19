#!/bin/bash
#DO NOT EDIT WITH WINDOWS

usage () {
    cat <<HELP_USAGE

    $0  [-d] [-s <fhir_base_url>]

   Refreshes FHIR documents in place. Optionally loads resources to a FHIR server.
   -d  Use default Alphora FHIR sandbox
   -h  Print this help
   -s  Use specificed fhir base url like http://localhost:8080/fhir/
HELP_USAGE
	exit 0
}

tooling_jar=tooling-1.4.1-SNAPSHOT-jar-with-dependencies.jar
input_cache_path=./input-cache
ig_resource_path=./input/ecqm-content-r4.xml

while getopts dhs: flag
do
    case "${flag}" in
		d) server_url="https://cloud.alphora.com/sandbox/r4/cqm/fhir/";; 
		h) usage;;
        s) server_url=${OPTARG};;
    esac
done

echo "server_url: ${server_url}"

fsoption=""
if [ ! -z "${server_url}" ]; then
	fsoption="-fs ${server_url}"
fi

echo "fsoption: $fsoption"

set -e

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	java -jar $tooling -RefreshIG -ini="$PWD"/ig.ini -t -d -p $fsoption

else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		java -jar $tooling -RefreshIG -ini="$PWD"/ig.ini -t -d -p $fsoption -rp input/cql
	else
		echo IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi
