(in-package :com.boothj5.lisphead.test-hand)

(define-test lowest-card-returns-lowest
    (assert-equal (make-card 4 2) 
        (lowest-card
            (let ((cards (make-hand 4)))
                (add-to-cards cards (make-card 8 1))
                (add-to-cards cards (make-card 4 2))
                (add-to-cards cards (make-card 10 3))
                (add-to-cards cards (make-card 5 2))
                cards)))
    (assert-equal (make-card 8 1) 
        (lowest-card
            (let ((cards (make-hand 4)))
                (add-to-cards cards (make-card 8 1))
                (add-to-cards cards (make-card 9 2))
                (add-to-cards cards (make-card 12 3))
                (add-to-cards cards (make-card 14 2))
                cards)))
    (assert-equal (make-card 5 2) 
        (lowest-card
            (let ((cards (make-hand 4)))
                (add-to-cards cards (make-card 8 1))
                (add-to-cards cards (make-card 9 2))
                (add-to-cards cards (make-card 5 2))
                (add-to-cards cards (make-card 14 2))
                cards)))
)
        
