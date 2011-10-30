(load "console.lisp")
(load "card.lisp")
(defpackage :com.boothj5.lisphead
    (:use :common-lisp
          :com.boothj5.lisphead.console
          :com.boothj5.lisphead.card))
(in-package :com.boothj5.lisphead)

(defun calc-cards-needed (num-players num-cards-each)
    (* num-players num-cards-each 3))

(newlines 100)

(show-welcome-message)

(setq num-players (request-num-players))
(setq num-cards-each (request-num-cards))

(setq player-names (request-player-names num-players))

(format t "Num cards required = ~d~%" (calc-cards-needed num-players num-cards-each))

(setq ten-diamonds '(10 3))

(newline)

(princ (show-card ten-diamonds))
