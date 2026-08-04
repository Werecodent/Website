#!/bin/sh
set -euo pipefail

SCRIPT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
echo $SCRIPT_DIR

ARTIFACT_DIR="$SCRIPT_DIR/../artifacts"
echo $ARTIFACT_DIR

mkdir -p "$ARTIFACT_DIR/install"
curl -sSL https://dot.net/v1/dotnet-install.sh > artifacts/install/dotnet-install.sh
chmod +x artifacts/install/dotnet-install.sh
./artifacts/install/dotnet-install.sh -c 10.0 -InstallDir artifacts/dotnet

./artifacts/dotnet/dotnet --version
./artifacts/dotnet/dotnet publish --configuration Release --property:PublishDir="$ARTIFACT_DIR/releases"
