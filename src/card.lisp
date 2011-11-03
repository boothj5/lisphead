(load "packages.lisp")
(in-package :com.boothj5.lisphead.card)

(defconstant +suits+ '("SPADES" "HEARTS" "CLUBS" "DIAMONDS"))
(defconstant +ranks+ '(nil nil "TWO" "THREE" "FOUR" "FIVE" "SIX" 
                        "SEVEN" "EIGHT" "NINE" "TEN" "JACK" "QUEEN" "KING" "ACE"))

(defun make-card (rank suit)
    (list :rank rank :suit suit))

(defun show-card (card)
    (concatenate 'string (elt +ranks+ (getf card :rank)) 
        " of " 
        (elt +suits+ (getf card :suit))))

(defun lowest-card (cards)
    (let ((lowest (elt cards 0)))
        (dotimes (i (length cards))
            (when (< (getf (elt cards i) :rank) (getf lowest :rank)) 
                (setf lowest (elt cards i))))
        lowest))
