#!/bin/bash
GF=$(mktemp -t goenv); curl -s https://raw.github.com/biinilya/goenv/master/activate.sh > $GF; source $GF
goon otacmgr
set -x

$GOBIN/go get -fix "github.com/coreos/etcd"
$GOBIN/go get -fix "github.com/coreos/etcdctl"

CDIR=$(pwd)
cd $GOENV_PATH/src/github.com/coreos/etcd
./build
cp etcd $CDIR/otac_mgr
cd $GOENV_PATH/src/github.com/coreos/etcdctl
./build
cp etcdctl $CDIR/otac_ctl
cd $CDIR

set +x