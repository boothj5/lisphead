(defpackage :com.boothj5.lisphead.card
    (:use :common-lisp)
    (:export :suits 
             :ranks
             :show-card))
(in-package :com.boothj5.lisphead.card)

(setq suits '("SPADES" "HEARTS" "CLUBS" "DIAMONDS"))
(setq ranks '(nil nil "TWO" "THREE" "FOUR" "FIVE" "SIX" "SEVEN" "EIGHT" "NINE" "TEN"
             "JACK" "QUEEN" "KING" "ACE"))

(defun int-to-string (num)
    (format nil "~d" num))

(defun show-card (card)
    (concatenate 'string (elt ranks (car card)) 
        " of " 
        (elt suits (car (cdr card)))))
