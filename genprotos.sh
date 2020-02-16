#!/usr/bin/env bash

protoc -I=protos --dart_out=lib/core/models protos/*.proto
protoc -I=protos --go_out=go/plugins/derocore/model protos/*.proto

# build json annotation file
flutter pub run build_runner build