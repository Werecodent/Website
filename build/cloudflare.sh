#!/bin/sh

mkdir -p artifacts/install
curl -sSL https://dot.net/v1/dotnet-install.sh > artifacts/install/dotnet-install.sh
chmod +x artifacts/install/dotnet-install.sh
./artifacts/install/dotnet-install.sh -c 10.0 -InstallDir artifacts/dotnet

dotnet --version
./build/run.sh publish

#$ARTIFACT_DIR/dotnet publish -c Release -o ./artifacts/releases
