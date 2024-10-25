#!/usr/bin/env bash
set -eo pipefail

echo "export PATH=${NESTO_CONTAINER_WORKSPACE_ROOT}/.local/bin/:${NESTO_CONTAINER_WORKSPACE_ROOT}/scripts:$PATH" >> /home/vscode/.bashrc

install -d /home/vscode/.local/bin/
ln -s "$BROWSER" "/home/vscode/.local/bin/xdg-open"
chown -R vscode:vscode /home/vscode/.local