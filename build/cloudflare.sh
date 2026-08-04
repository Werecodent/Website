#!/bin/sh

SCRIPT_DIR=$(cd "$( dirname "$BASH_SOURCE[0]" )" && pwd)
echo $SCRIPT_DIR
REPO_DIR=$( dirname "$SCRIPT_DIR" )
echo $REPO_DIR
ARTIFACT_DIR="$REPO_DIR/artifacts"
echo $ARTIFACT_DIR

mkdir -p "$ARTIFACT_DIR/install"
curl -sSL https://dot.net/v1/dotnet-install.sh > $ARTIFACT_DIR/install/dotnet-install.sh
chmod +x $ARTIFACT_DIR/install/dotnet-install.sh
. "$ARTIFACT_DIR/install/dotnet-install.sh" -c 10.0 -InstallDir $ARTIFACT_DIR/dotnet

. "$ARTIFACT_DIR/dotnet/dotnet" --version
. "$ARTIFACT_DIR/dotnet/dotnet" publish --configuration Release --property:PublishDir="$ARTIFACT_DIR/releases"
