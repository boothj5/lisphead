(load "console.lisp")
(load "card.lisp")
(load "player.lisp")
(load "game.lisp")
(defpackage :com.boothj5.lisphead
    (:use :common-lisp
          :com.boothj5.lisphead.console
          :com.boothj5.lisphead.card
          :com.boothj5.lisphead.player
          :com.boothj5.lisphead.game))
(in-package :com.boothj5.lisphead)

(defvar *num-players*)
(defvar *num-cards-each*)
(defvar *player-names*)
(defvar *game*)

(newlines 100)
(show-welcome-message)

(setf *num-players* (request-num-players))
(setf *num-cards-each* (request-num-cards))
(setf *player-names* (request-player-names *num-players*))
(setf *game* (make-game *player-names* *num-cards-each*))

(princ "Created game")
(newline)

(deal *game*)

(newline)
(show-players (get-players *game*))


