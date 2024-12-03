#!/usr/bin/env bash
set -eo pipefail

echo "export CODER_EXECUTABLE_PATH=$(find /tmp -name 'coder.*'); export PATH=\$CODER_EXECUTABLE_PATH:/tmp/code-server/bin:/root/.local/bin/:${NESTO_CONTAINER_WORKSPACE_ROOT}/scripts:$PATH" >> /root/.bashrc