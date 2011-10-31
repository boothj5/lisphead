(defpackage :com.boothj5.lisphead.card
    (:use :common-lisp)
    (:export :+suits+ 
             :+ranks+
             :make-card
             :show-card))
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

