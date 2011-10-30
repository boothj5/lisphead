(defpackage :com.boothj5.lisphead.card
    (:use :common-lisp)
    (:export :suits 
             :ranks
             :show-card
             :create-deck
             :create-decks))
(in-package :com.boothj5.lisphead.card)

(defconstant +deck-size+ 52)
(defconstant +suits+ '("SPADES" "HEARTS" "CLUBS" "DIAMONDS"))
(defconstant +ranks+ '(nil nil "TWO" "THREE" "FOUR" "FIVE" "SIX" 
                        "SEVEN" "EIGHT" "NINE" "TEN" "JACK" "QUEEN" "KING" "ACE"))

(defun show-card (card)
    (concatenate 'string (elt +ranks+ (car card)) 
        " of " 
        (elt +suits+ (car (cdr card)))))

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
           (deck (make-array (* +deck-size+ num-decks) :fill-pointer 0)))
        (dotimes (i num-decks)
            (setf deck (concatenate 'list deck (create-deck))))
    deck))
