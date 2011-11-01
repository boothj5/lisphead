(load "console.lisp")
(load "game.lisp")
(load "player.lisp")
(defpackage :com.boothj5.lisphead
    (:use :common-lisp
          :com.boothj5.lisphead.console
          :com.boothj5.lisphead.game
          :com.boothj5.lisphead.player))
(in-package :com.boothj5.lisphead)

(defun main ()
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
    (deal *game*)
    (newlines 100)
    (show-players (getf *game* :players))
    (swap-cards)
    (first-move *game*))

(defun swap-cards ()
    (dolist (player (getf *game* :players))
        (let ((swap (request-swap player))
              (hand)
              (face-up))
            (loop until (not swap) do
                (setf hand (request-hand-swap))
                (setf face-up (request-face-up-swap))
                (do-swap player hand face-up)
                (setf swap (request-swap-more player))))))

(main)
