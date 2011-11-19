(load "packages.lisp")
(in-package :com.boothj5.lisphead.card)

(defconstant +suits+ '("SPADES" "HEARTS" "CLUBS" "DIAMONDS"))
(defconstant +ranks+ '(nil nil "TWO" "THREE" "FOUR" "FIVE" "SIX" 
                        "SEVEN" "EIGHT" "NINE" "TEN" "JACK" "QUEEN" "KING" "ACE"))

(defun make-card (rank suit)
    (list :rank rank :suit suit))

(defun show-card (card)
    (concatenate 'string 
        (elt +ranks+ (getf card :rank)) 
        " of " 
        (elt +suits+ (getf card :suit))))

(defun show-cards (cards)
    (if (not cards)
        ""
        (concatenate 'string
            (concatenate 'string
                (show-card (car cards))
                ", ")
            (show-cards (cdr cards)))))

(defun lowest-card (cards)
    (let ((lowest (elt cards 0)))
        (dotimes (i (length cards))
            (when (< (getf (elt cards i) :rank) (getf lowest :rank)) 
                (setf lowest (elt cards i))))
        lowest))

(defun equal-rank (card1 card2)
    (equal (getf card1 :rank) (getf card2 :rank)))

(defun rank-gtr (card1 card2)
    (> (getf card1 :rank) (getf card2 :rank)))
