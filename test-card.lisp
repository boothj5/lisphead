(load "card.lisp")
(load "lisp-unit.lisp")
(defpackage :com.boothj5.lisphead.test-card
    (:use :common-lisp :lisp-unit :com.boothj5.lisphead.card))
(in-package :com.boothj5.lisphead.test-card)

(define-test show-card-returns-correct-string
    (assert-equal "TEN of HEARTS" (show-card (make-card 10 1)))
    (assert-equal "ACE of DIAMONDS" (show-card (make-card 14 3)))
    (assert-equal "NINE of SPADES" (show-card (make-card 9 0)))
    (assert-equal "JACK of CLUBS" (show-card (make-card 11 2)))
)


