#!/bin/bash

function tangle_files() {
    DIR="$(pwd)/home"
    FILES=""

    for i in `find $DIR -maxdepth 1 -iname "*.org" -type f`; do
	FILES="$FILES \"$i\""
    done

    emacs -Q --batch \
	  --eval \
	  "(progn
          (require 'org)
          (require 'ob)
          (require 'ob-tangle)
          (mapc (lambda (file)
	    (find-file (expand-file-name file \"$DIR\"))
	    (org-babel-tangle)
	    (kill-buffer)) '($FILES)))"
}

tangle_files
