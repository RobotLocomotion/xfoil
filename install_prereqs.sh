#!/bin/bash

case $1 in
  ("homebrew")
    brew install gfortran ;;
  ("macports")
    ;;
  ("ubuntu")
    ;;
  ("cygwin")
    ;;
  (*)
    echo "Usage: ./install_prereqs.sh package_manager"
    echo "where package_manager is one of the following: "
    echo "  homebrew"
    echo "  macports"
    echo "  ubuntu"
    echo "  cygwin"
    exit 1 ;;
esac

if [ -f tobuild.txt ]; then
  SUBDIRS=`grep -v "^\#" tobuild.txt`
  for subdir in $SUBDIRS; do
    if [ -f $subdir/install_prereqs.sh ]; then
      echo "installing prereqs for $subdir"
      ( cd $subdir; ./install_prereqs.sh $1 || true )
    fi
  done
fi
