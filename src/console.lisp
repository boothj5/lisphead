(load "packages.lisp")
(in-package :com.boothj5.lisphead.console)

(defun newline () (format t "~%"))

(defun newlines (num)
    (dotimes (i num) (newline)))

(defun clearscreen ()
    (newlines 100))

(defun show-welcome-message ()
    (format t "Welcome to LispHead!~%"))

(defun request-num-players ()
    (format t "Please enter number of players: ")
    (read))

(defun request-num-cards ()
    (format t "Please enter number of cards each: ")
    (read))

(defun request-hand-swap ()
    (format t "Please choose a hand card: ")
    (- (read) 1))

(defun request-face-up-swap ()
    (format t "Please choose a face up card: ")
    (- (read) 1))

(defun request-swap (player)
    (clearscreen)
    (show-player player)
    (y-or-n-p "Do you want to swap cards? "))

(defun request-swap-more (player)
    (clearscreen)
    (show-player player)
    (y-or-n-p "Do you want to swap more cards? "))

(defun request-player-names (num-players)
    (defvar player-names nil)
    (defvar name "")
    (dotimes (i num-players)
        (format t "Enter name for player ~d: " (+ i 1))
        (setf name (read))
        (setf player-names (cons name player-names)))
    player-names)

(defun show-cards (name cards)
    (format t name)
    (dotimes (i (hand-size cards))
        (princ (show-card (get-card cards i)))
        (princ ", "))
    (newline))

(defun show-player (player)
    (format t "~s~%" (getf player :player-name))
    (show-cards "Hand      : " (getf player :hand))
    (show-cards "Face up   : " (getf player :face-up))
    (show-cards "Face down : " (getf player :face-down)))

(defun show-players (players)
    (dolist (player players)
        (show-player player)
        (newline)))

