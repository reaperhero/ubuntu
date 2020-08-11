#!/bin/bash
# installl golang first
cd  $GOPATH
cd src/github.com
mkdir nats-io && cd nats-io
git clone https://github.com/nats-io/nats.go.git
git clone https://github.com/nats-io/nkeys.git
git clone https://github.com/nats-io/nuid.git