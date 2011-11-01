(load "test-card.lisp")
(defpackage :com.boothj5.lisphead.test-suite
    (:use :common-lisp :lisp-unit
          :com.boothj5.lisphead.test-card))
(in-package :com.boothj5.lisphead.test-suite)

(lisp-unit:run-all-tests :com.boothj5.lisphead.test-card)
