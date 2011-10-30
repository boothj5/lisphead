(load "card.lisp")
(load "player.lisp")
(defpackage :com.boothj5.lisphead.console
    (:use :common-lisp :com.boothj5.lisphead.card :com.boothj5.lisphead.player)
    (:export :newline 
             :newlines 
             :show-welcome-message
             :request-num-players
             :request-num-cards
             :request-player-names
             :show-players))
(in-package :com.boothj5.lisphead.console)

(defun newline () (format t "~%"))

(defun newlines (num)
    (dotimes (i num) (newline)))

(defun show-welcome-message ()
    (format t "Welcome to LispHead!~%"))

(defun request-num-players ()
    (format t "Please enter number of players: ")
    (read))

(defun request-num-cards ()
    (format t "Please enter number of cards each: ")
    (read))

(defun request-player-names (num-players)
    (defvar player-names nil)
    (defvar name "")
    (dotimes (i num-players)
        (format t "Enter name for player ~d: " (+ i 1))
        (setf name (read))
        (setf player-names (cons name player-names)))
    player-names)

(defun show-player (player)
    (format t "~s~%" (get-name player))
    (format t "Hand      : ")
    (dotimes (i (length (get-hand player)))
        (princ (show-card (elt (get-hand player) i)))
        (princ ", "))
    (newline)
    (format t "face up   : ")
    (dotimes (i (length (get-face-up player)))
        (princ (show-card (elt (get-face-up player) i)))
        (princ ", "))
    (newline)
    (format t "face down : ")
    (dotimes (i (length (get-face-down player)))
        (princ (show-card (elt (get-face-down player) i)))
        (princ ", "))
    (newline))

(defun show-players (players)
    (dolist (player players)
        (show-player player)
        (newline)))

