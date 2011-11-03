(load "packages.lisp")
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

(defun request-hand-swap ()
    (format t "Please choose a hand card: ")
    (- (read) 1))

(defun request-face-up-swap ()
    (format t "Please choose a face up card: ")
    (- (read) 1))

(defun request-swap (player)
    (newlines 100)
    (show-player player)
    (y-or-n-p "Do you want to swap cards? "))

(defun request-swap-more (player)
    (newlines 100)
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

(defun show-player (player)
    (format t "~s~%" (getf player :player-name))
    (format t "Hand      : ")
    (dotimes (i (length (getf player :hand)))
        (princ (show-card (elt (getf player :hand) i)))
        (princ ", "))
    (newline)
    (format t "face up   : ")
    (dotimes (i (length (getf player :face-up)))
        (princ (show-card (elt (getf player :face-up) i)))
        (princ ", "))
    (newline)
    (format t "face down : ")
    (dotimes (i (length (getf player :face-down)))
        (princ (show-card (elt (getf player :face-down) i)))
        (princ ", "))
    (newline))

(defun show-players (players)
    (dolist (player players)
        (show-player player)
        (newline)))

