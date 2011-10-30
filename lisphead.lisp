(load "console.lisp")
(load "card.lisp")
(load "player.lisp")
(defpackage :com.boothj5.lisphead
    (:use :common-lisp
          :com.boothj5.lisphead.console
          :com.boothj5.lisphead.card
          :com.boothj5.lisphead.player))
(in-package :com.boothj5.lisphead)

(defvar *num-players*)
(defvar *num-cards-each*)
(defvar *player-names*)
(defvar *deck*)
(defvar *players* nil)

(newlines 100)
(show-welcome-message)

(setf *num-players* (request-num-players))
(setf *num-cards-each* (request-num-cards))
(setf *player-names* (request-player-names *num-players*))
(setf *deck* (create-decks *num-players* *num-cards-each*))

(dolist (name *player-names*)
    (setf *players* (cons (make-player name *num-cards-each*) *players*)))

(add-to-hand (car *players*) (list 10 2))

(newline)
(show-players *players*)


