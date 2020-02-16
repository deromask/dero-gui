#!/usr/bin/env bash

#gomobile bind --target=android -v --trimpath
gomobile bind --target=android -ldflags="-s -w" -v --trimpath