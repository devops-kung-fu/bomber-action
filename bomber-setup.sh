#!/bin/bash
# This script downloads the latest release of bomber, extracts the files out of the package
# and runs bomber scan on the SBOM generated from the Syft action

VERSION=0.4.0

echo "Setting Up Bomber"
wget --progress=bar:force:noscroll "https://github.com/devops-kung-fu/bomber/releases/download/v${VERSION}/bomber_${VERSION}_linux_amd64.deb" && sudo dpkg --install "bomber_${VERSION}_linux_arm64.deb"

# clean up remaining package
rm "bomber_${VERSION}_linux_amd64.deb"
echo "Running Bomber Scan on Generated SBOM file"
bomber scan bomber.cyclonedx.json --output=json > bomber_results.json