#!/bin/sh

echo "Creating tmp directory".
mkdir -p /tmp/kogito-travel-agency

echo "Cleaning tmp directory."
rm -rf /tmp/kogito-travel-agency/*

echo "Starting Maven build."
mvn clean package -DskipTests

echo "Copying application artefacts."
cp -r target/kogito-travel-agency-1.0-SNAPSHOT-runner.jar target/lib /tmp/kogito-travel-agency

echo "Starting OpenShift binary build."
oc start-build kogito-travel-agency-binary --from-dir=/tmp/kogito-travel-agency
