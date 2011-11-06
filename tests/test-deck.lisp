(in-package :com.boothj5.lisphead.test-deck)

(define-test correct-size
    (assert-equal 52 (length (make-deck 2 3)))
    (assert-equal 104 (length (make-deck 2 10))))

(define-test pop-deck-decrements-size
    (assert-equal 51 
        (let ((deck (make-deck 2 3)))
            (pop-deck deck)
            (length deck))))
