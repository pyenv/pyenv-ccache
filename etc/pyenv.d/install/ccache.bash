#!/usr/bin/env bash

resolve_link() {
  $(type -p greadlink readlink | head -1) "$1"
}

abs_dirname() {
  local cwd="$(pwd)"
  local path="$1"

  while [ -n "$path" ]; do
    cd "${path%/*}"
    local name="${path##*/}"
    path="$(resolve_link "$name" || true)"
  done

  pwd
  cd "$cwd"
}

PYENV_CCACHE_ROOT="$(abs_dirname "$(abs_dirname "${BASH_SOURCE[0]}")/../../../..")"

if [ -z "$TMPDIR" ]; then
  TMP="/tmp"
else
  TMP="${TMPDIR%/}"
fi

if [ ! -w "$TMP" ] || [ ! -x "$TMP" ]; then
  echo "pyenv-ccache: TMPDIR=$TMP is set to a non-accessible location" >&2
  exit 1
fi

SEED="$(date "+%Y%m%d%H%M%S").$$"
BUILD_PATH="${TMP}/python-build.${SEED}" # for the compatibility with python-build

setup_ccache() {
  ## force python-build to use specified path as `BUILD_PATH`
  if [ -n "${PYENV_BUILD_ROOT}" ]; then
    export PYTHON_BUILD_BUILD_PATH="${PYENV_BUILD_ROOT}/${VERSION_NAME}"
  else
    export PYTHON_BUILD_BUILD_PATH="${BUILD_PATH}"
  fi

  export CCACHE_BASEDIR="${PYTHON_BUILD_BUILD_PATH}"
  export CC="ccache $(command -v "$CC" || command -v "cc" || true)"
}

if [ -n "$PYENV_CCACHE_DISABLE" ]; then
  echo "pyenv-ccache: ccache is disabled." 1>&2
else
  if command -v ccache 1>/dev/null; then
    before_install "setup_ccache"
  else
    echo "pyenv-ccache: ccache not found." 1>&2
    exit 1
  fi
fi
