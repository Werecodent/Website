#!/bin/sh

SCRIPT_DIR=$(cd "$( dirname "$BASH_SOURCE[0]" )" && pwd)
echo $SCRIPT_DIR
REPO_DIR=$( dirname "$SCRIPT_DIR" )
echo $REPO_DIR
ARTIFACT_DIR="$REPO_DIR/artifacts"
echo $ARTIFACT_DIR

mkdir -p artifacts/install
curl -sSL https://dot.net/v1/dotnet-install.sh > artifacts/install/dotnet-install.sh
chmod +x artifacts/install/dotnet-install.sh
./artifacts/install/dotnet-install.sh -c 10.0 -InstallDir artifacts/dotnet

./artifacts/dotnet/dotnet --version
./artifacts/dotnet/dotnet publish --configuration Release --property:PublishDir="$ARTIFACT_DIR/releases"
