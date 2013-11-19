#!/bin/bash

if [[ -z $GOENV_PATH ]]; then 
	GOENV_SCRIPT=https://raw.github.com/biinilya/goenv/master/activate.sh
	GF=$(mktemp -t goenvXXX); curl -s $GOENV_SCRIPT > $GF; . $GF
fi

goon otacmgr
goversion 1.2rc4

rm -rf ~/.goenv/otacmgr

set -x

go get "github.com/coreos/etcd"
go get "github.com/coreos/etcdctl"

CDIR=$(pwd)
cd $GOENV_PATH/src/github.com/coreos/etcd
PATH="$GOBIN:$PATH" ./build
cp etcd $CDIR/otac_mgr
cd $GOENV_PATH/src/github.com/coreos/etcdctl
PATH="$GOBIN:$PATH" ./build
cp etcdctl $CDIR/otac_ctl
cd $CDIR

set +x
