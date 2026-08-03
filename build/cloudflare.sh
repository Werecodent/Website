#!/bin/sh

SCRIPT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
cd "$SCRIPT_DIR/.."

ARTIFACT_DIR="SCRIPT_DIR/../artifacts"

mkdir -p "$ARTIFACT_DIR/install"
curl -sSL https://dot.net/v1/dotnet-install.sh > "$ARTIFACT_DIR/install/dotnet-install.sh"
chmod +x ./artifacts/install/dotnet-install.sh
$ARTIFACT_DIR/install/dotnet-install.sh -c 10.0 -InstallDir ./artifacts/dotnet
$ARTIFACT_DIR/dotnet --version

$SCRIPT_DIR/run.sh publish

#$ARTIFACT_DIR/dotnet publish -c Release -o ./artifacts/releases
