(load "tests/lisp-unit.lisp")
(load "packages.lisp")
(load "load.lisp")
(load "tests/packages.lisp")
(load "tests/load.lisp")
(defpackage :com.boothj5.lisphead.test-suite
    (:use :common-lisp :lisp-unit
          :com.boothj5.lisphead.test-card
          :com.boothj5.lisphead.test-player))
(in-package :com.boothj5.lisphead.test-suite)

(lisp-unit:run-all-tests :com.boothj5.lisphead.test-card)
(lisp-unit:run-all-tests :com.boothj5.lisphead.test-player)
