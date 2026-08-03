#!/bin/sh
mkdir -p ./artifacts/install
curl -sSL https://dot.net/v1/dotnet-install.sh > ./artifacts/install/dotnet-install.sh
chmod +x ./artifacts/install/dotnet-install.sh
./artifacts/dotnet-install.sh -c 10.0 -InstallDir ./artifacts/dotnet
./artifacts/dotnet --version
./artifacts/dotnet publish -c Release -o ./artifacts/releases
