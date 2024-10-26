#!/usr/bin/env bash
set -eo pipefail

echo "export PATH=/tmp/code-server/bin:/home/vscode/.asdf/shims:/home/vscode/.local/bin/:${NESTO_CONTAINER_WORKSPACE_ROOT}/scripts:$PATH" >> /home/vscode/.bashrc