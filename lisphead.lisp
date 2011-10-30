(load "console.lisp")
(load "card.lisp")
(defpackage :com.boothj5.lisphead
    (:use :common-lisp
          :com.boothj5.lisphead.console
          :com.boothj5.lisphead.card))
(in-package :com.boothj5.lisphead)

(defun calc-decks-needed (num-players num-cards-each)
    (setq cards-needed (* num-players num-cards-each 3))
    (setq div (floor cards-needed 52))
    (setq add (if (> (mod cards-needed 52) 0) 1 0))
    (+ div add))

(newlines 100)
(show-welcome-message)

(setq num-players (request-num-players))
(setq num-cards-each (request-num-cards))
(setq player-names (request-player-names num-players))
(setq decks-needed (calc-decks-needed num-players num-cards-each))
(setq deck (create-decks decks-needed))

(setq i 0)
(loop
    (princ (show-card (elt deck i)))
    (newline)
    (setq i (+ i 1))
    (when (eq i (length deck)) (return)))

