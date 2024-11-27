#!/usr/bin/env bash
set -eo pipefail

echo "export PATH=/tmp/code-server/bin:/home/vscode/.asdf/shims:/root/.asdf/shims:/root/.local/bin/:${NESTO_CONTAINER_WORKSPACE_ROOT}/scripts:$PATH" >> /root/.bashrc