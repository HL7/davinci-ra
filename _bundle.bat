@ECHO OFF
IF "%1%"=="-h" GOTO printUsage
GOTO initialize

:printUsage
ECHO Loads bundles to a FHIR server.
ECHO   -h  Print this help
ECHO   -s  Use specificed fhir base url like http://localhost:8080/fhir/
GOTO exit0

:initialize
SET tooling_jar=tooling-1.4.1-SNAPSHOT-jar-with-dependencies.jar
SET input_cache_path=%~dp0input-cache

IF "%1%"=="-s" (
	SET fsoption=-fs=%2%
	GOTO bundle
)

SET fsoption=-fs=https://cloud.alphora.com/sandbox/r4/ra/fhir/
GOTO bundle

:bundle
SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%input_cache_path%\%tooling_jar%" (
	ECHO running: JAVA -jar "%input_cache_path%\%tooling_jar%" -PostBundlesInDir -fv=fhir4 -e=json -dp=bundles/ %fsoption%
	JAVA -jar "%input_cache_path%\%tooling_jar%" -PostBundlesInDir -fv=fhir4 -e=json -dp=bundles/ %fsoption%
) ELSE IF EXIST "..\%tooling_jar%" (
	ECHO running: JAVA -jar "..\%tooling_jar%" -PostBundlesInDir -fv=fhir4 -e=json -dp=bundles/ %fsoption%
	JAVA -jar "..\%tooling_jar%" -PostBundlesInDir -fv=fhir4 -e=json -dp=bundles/ %fsoption%
) ELSE (
	ECHO IG Bundle NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
)

PAUSE

:exit0
EXIT /b 0
