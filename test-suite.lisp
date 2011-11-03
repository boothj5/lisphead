(load "lisp-unit.lisp")
(load "packages.lisp")
(load "load.lisp")
(load "test-packages.lisp")
(load "test-load.lisp")
(defpackage :com.boothj5.lisphead.test-suite
    (:use :common-lisp :lisp-unit
          :com.boothj5.lisphead.test-card))
          ;:com.boothj5.lisphead.test-player))
(in-package :com.boothj5.lisphead.test-suite)

(lisp-unit:run-all-tests :com.boothj5.lisphead.test-card)
                         ;;:com.boothj5.lisphead.test-player)
