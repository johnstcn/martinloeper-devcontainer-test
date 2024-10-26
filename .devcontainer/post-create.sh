#!/usr/bin/env bash
set -eo pipefail

echo "export PATH=/home/vscode/.asdf/shims:/home/vscode/.local/bin/:${NESTO_CONTAINER_WORKSPACE_ROOT}/scripts:$PATH" >> /home/vscode/.bashrc