#!/bin/sh

mkdir -p artifacts/install

curl -sSL https://dot.net/v1/dotnet-install.sh > artifacts/install/dotnet-install.sh
chmod +x artifacts/install/dotnet-install.sh
./artifacts/install/dotnet-install.sh -c 10.0 -InstallDir artifacts/dotnet

./artifacts/dotnet/dotnet publish src/Site/Site.csproj -c Release -o artifacts/website
