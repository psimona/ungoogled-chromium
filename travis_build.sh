set -euxo pipefail

mkdir build/
mkdir build/sandbox
mkdir build/downloads
./utilikit/prepare_sources.py
./utilikit/substitute_domains.py
./utilikit/generate_build_files.py debian --flavor conservative --apply-domain-substitution
# Checks and reports any additional packages needed
dpkg-checkbuilddeps
cd build/sandbox
dpkg-buildpackage -b -uc