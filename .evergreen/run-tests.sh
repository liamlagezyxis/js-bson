#!/bin/bash
if [ -z "$NODE_VERSION" ]; then
  echo "NODE_VERSION environment variable must be specified"
  exit 1
fi

NODE_ARTIFACTS_PATH="${PROJECT_DIRECTORY}/node-artifacts"

export PATH="/opt/mongodbtoolchain/v2/bin:$PATH"
export NVM_DIR="${NODE_ARTIFACTS_PATH}/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


case $1 in
  "node")
    npm run check:coverage
    ;;
  "browser")
    # TODO(NODE-3555): remove explicit browser tests
    npm run test-browser
    ;;
  *)
    npm test
    ;;
esac
