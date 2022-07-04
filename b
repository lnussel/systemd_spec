#!/bin/bash
export PATH=/usr/lib64/ccache:$PATH
exec rpmbuild --build-in-place --noprep systemd.spec --without downstream_build --without html --define "_sourcedir $PWD" --define "_rpmdir $PWD/RPMS" --define "_topdir $PWD/rpm" "$@"
