(load "packages.lisp")
(in-package :com.boothj5.lisphead.console)

;;; public functions

(defun newlines (num)
    (dotimes (i num) (terpri)))

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
        (setf name (read-line))
        (setf player-names (cons name player-names)))
    player-names)

(defun show-player (player)
    (format t "~A~%" (getf player :player-name))
    (show-hand "Hand      : " (getf player :hand))
    (show-hand "Face up   : " (getf player :face-up))
    (show-hand "Face down : " (getf player :face-down)))

(defun show-players (players)
    (dolist (player players)
        (show-player player)
        (terpri)))

(defun show-game (game)
    (clearscreen)
    (show-pile (getf game :pile))
    (terpri)
    (format t "~d on deck~%" (length (getf game :deck)))
    (terpri)
    (show-players (getf game :players))
    (princ (getf game :last-move))
    (terpri)
    (terpri))

(defun request-move (player)
    (format t "~A, please enter cards to lay:" (getf player :player-name))
    (parse-choice (read-line)))
    
;;; private functions

(defun show-hand (name cards)
    (format t name)
    (dotimes (i (hand-size cards))
        (princ (show-card (get-card cards i)))
        (princ ", "))
    (terpri))

(defun show-pile (pile)
    (format t "Pile :~%")
    (dolist (card pile)
        (format t "    ")
        (princ (show-card card))
        (terpri)))

(defun show-invalid-move ()
    (format t "You cannot do that!~%"))
