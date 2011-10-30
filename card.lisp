(defpackage :com.boothj5.lisphead.card
    (:use :common-lisp)
    (:export :suits 
             :ranks
             :show-card
             :create-deck
             :create-decks))
(in-package :com.boothj5.lisphead.card)

(setq suits '("SPADES" "HEARTS" "CLUBS" "DIAMONDS"))
(setq ranks '(nil nil "TWO" "THREE" "FOUR" "FIVE" "SIX" "SEVEN" "EIGHT" "NINE" "TEN"
             "JACK" "QUEEN" "KING" "ACE"))

(defun show-card (card)
    (concatenate 'string (elt ranks (car card)) 
        " of " 
        (elt suits (car (cdr card)))))

(defun create-deck ()
    (setq deck (make-array 52 :fill-pointer 0))
    (setq suit 0)
    (loop
        (setq rank 2)
        (loop
            (vector-push (cons rank (cons suit ())) deck)
            (setq rank (+ rank 1))
            (when (> rank 14) (return)))
        (setq suit (+ suit 1))
        (when (> suit 3) (return)))
    deck)

(defun create-decks (num-decks)
    (setq deck (make-array (* 52 num-decks) :fill-pointer 0))
    (setq i 0)
    (loop
        (setq deck (concatenate 'list deck (create-deck)))
        (setq i (+ i 1))
        (when (eq i num-decks) (return)))
    deck)
