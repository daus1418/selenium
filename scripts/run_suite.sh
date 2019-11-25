#!/usr/bin/env bash
set -e

CMD="pabot --processes 4 --outputdir reports suites/*.robot"

echo ${CMD}

``${CMD}``
