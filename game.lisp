(load "player.lisp")
(load "card.lisp")
(defpackage :com.boothj5.lisphead.game
    (:use :common-lisp :com.boothj5.lisphead.player :com.boothj5.lisphead.card)
    (:export :make-game 
             :deal
             :get-players))
(in-package :com.boothj5.lisphead.game)

(defconstant +deck-size+ 52)

(defun calc-decks-needed (num-players num-cards-each)
    (let* ((cards-needed (* num-players num-cards-each 3))
           (div (floor cards-needed +deck-size+))
           (add (if (> (mod cards-needed +deck-size+) 0) 1 0)))
        (+ div add)))

(defun create-deck ()
    (let ((deck (make-array +deck-size+ :fill-pointer 0))
          (rank))
        (dotimes (suit (length +suits+))
            (setf rank 2)
            (loop
                (vector-push (cons rank (cons suit ())) deck)
                (incf rank)
                (when (> rank 14) (return))))
        deck))

(defun create-decks (num-players num-cards-each)
    (let* ((num-decks (calc-decks-needed num-players num-cards-each))
           (deck (make-array (* +deck-size+ num-decks) :fill-pointer 0))
           (new-deck (make-array 52 :fill-pointer 0)))
        (dotimes (i num-decks)
            (setf new-deck (create-deck))
            (dotimes (j (length new-deck))
                (vector-push (vector-pop new-deck) deck)))
        (princ (length deck))
        deck))

(defun make-game (player-names num-cards)
    (let ((players nil)
          (deck (create-decks (list-length player-names) num-cards)))
        (random-shuffle deck)
        (dolist (name player-names)
            (setf players (cons (make-player name num-cards) players)))
        (list players deck num-cards)))
           
(defun get-players (game)
    (car game))

(defun get-deck (game)
    (car (cdr game)))

(defun get-num-cards-each (game)
    (car (cdr (cdr game))))

(defun deal (game)
    (let ((players (get-players game))
          (deck (get-deck game))i
          (num-each (get-num-cards-each game)))
        (dolist (player players)
            (dotimes (i num-each)
                (add-to-hand player (vector-pop deck))
                (add-to-face-up player (vector-pop deck))
                (add-to-face-down player (vector-pop deck))))))

(defun random-shuffle (seq)
    (map-into seq #'car
        (sort (map 'vector (lambda (x) 
            (cons x (random 1d0))) seq)
                #'< :key #'cdr)))
