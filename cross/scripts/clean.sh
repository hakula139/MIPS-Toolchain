#!/bin/bash
path=$( cd "$(dirname "${BASH_SOURCE[0]}")/.."; pwd -P )
cd "$path"

rm -rf build/*
