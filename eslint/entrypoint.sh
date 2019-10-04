#!/bin/bash

set -euo pipefail

# shellcheck disable=SC1091
source /lib.sh

lint() {
	yarn lint
}

fix() {
	yarn lint --fix
}

_lint_and_fix_action eslint "${@}"
