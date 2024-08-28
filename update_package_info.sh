#!/bin/bash

set -x

rm -f Packages Release Packages.gz InRelease
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages
apt-ftparchive release . > Release
gpg --default-key "maintainer@presagetech.com" -abs -o - Release > Release.gpg
gpg --default-key "maintainer@presagetech.com" --clearsign -o - Release > InRelease