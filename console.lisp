(defpackage :com.boothj5.lisphead.console
    (:use :common-lisp)
    (:export :newline 
             :newlines 
             :show-welcome-message
             :request-num-players
             :request-num-cards
             :request-player-names))
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

