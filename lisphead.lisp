(load "console.lisp")
(load "card.lisp")
(defpackage :com.boothj5.lisphead
    (:use :common-lisp
          :com.boothj5.lisphead.console
          :com.boothj5.lisphead.card))
(in-package :com.boothj5.lisphead)

(defvar *num-players*)
(defvar *num-cards-each*)

(newlines 100)
(show-welcome-message)

(setf *num-players* (request-num-players))
(setf *num-cards-each* (request-num-cards))
(setf player-names (request-player-names *num-players*))
(setf deck (create-decks *num-players* *num-cards-each*))

(dotimes (i (length deck))
    (princ (show-card (elt deck i)))
    (newline))
