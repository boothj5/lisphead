(load "tests/lisp-unit.lisp")
(load "packages.lisp")
(load "load.lisp")
(load "tests/packages.lisp")
(load "tests/load.lisp")
(defpackage :com.boothj5.lisphead.test-suite
    (:use :common-lisp :lisp-unit
          :com.boothj5.lisphead.test-card
          :com.boothj5.lisphead.test-hand
          :com.boothj5.lisphead.test-deck
          :com.boothj5.lisphead.test-player))
(in-package :com.boothj5.lisphead.test-suite)

(format t "RUNNING TESTS")

(format t "~%~%-->Card tests:~%")
(lisp-unit:run-all-tests :com.boothj5.lisphead.test-card)
(format t "~%~%-->Hand tests:~%")
(lisp-unit:run-all-tests :com.boothj5.lisphead.test-hand)
(format t "~%~%-->Deck tests:~%")
(lisp-unit:run-all-tests :com.boothj5.lisphead.test-deck)
(format t "~%~%-->Player tests:~%")
(lisp-unit:run-all-tests :com.boothj5.lisphead.test-player)
(format t "~%~%")
