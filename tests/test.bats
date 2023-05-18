setup() {
  set -eu -o pipefail
  export DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/.."
  export TESTDIR=~/tmp/testopensearch
  mkdir -p $TESTDIR
  export PROJNAME=testopensearch
  export DDEV_NON_INTERACTIVE=true
  ddev delete -Oy ${PROJNAME} || true
  cd "${TESTDIR}"
  ddev config global --simple-formatting
  ddev config --project-name=${PROJNAME} --project-type=php
  ddev start -y
}

teardown() {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  ddev delete -Oy ${PROJNAME}
  [ "${TESTDIR}" != "" ] && rm -rf ${TESTDIR}
}

@test "install from directory" {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  echo "# ddev get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get ${DIR}
  ddev restart
  ddev restart
  ddev exec "curl -v opensearch:9200" | grep "${PROJNAME}-opensearch"
}

@test "install from release" {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  echo "# ddev get sebastian-ehrling/ddev-opensearch with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get sebastian-ehrling/ddev-opensearch
  ddev restart
  ddev restart
  ddev describe
  ddev exec "curl -v opensearch:9200"
  ddev exec "curl -v opensearch:9200" | grep "${PROJNAME}-opensearch"
}
