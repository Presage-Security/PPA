#!/bin/bash

set -x
set -e

rm -f Packages Release Packages.gz InRelease
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages
apt-ftparchive release . > Release
gpg --default-key "maintainer@presagetech.com" --digest-algo SHA512 -abs -o - Release > Release.gpg
gpg --default-key "maintainer@presagetech.com" --digest-algo SHA512 --clearsign -o - Release > InRelease