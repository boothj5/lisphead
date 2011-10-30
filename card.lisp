(defpackage :com.boothj5.lisphead.card
    (:use :common-lisp)
    (:export :+suits+ 
             :+ranks+
             :show-card))
(in-package :com.boothj5.lisphead.card)

(defconstant +suits+ '("SPADES" "HEARTS" "CLUBS" "DIAMONDS"))
(defconstant +ranks+ '(nil nil "TWO" "THREE" "FOUR" "FIVE" "SIX" 
                        "SEVEN" "EIGHT" "NINE" "TEN" "JACK" "QUEEN" "KING" "ACE"))

(defun show-card (card)
    (concatenate 'string (elt +ranks+ (car card)) 
        " of " 
        (elt +suits+ (car (cdr card)))))

