(in-package :com.boothj5.lisphead.test-card)

(define-test show-card-returns-correct-string
    (assert-equal "TEN of HEARTS" (show-card (make-card 10 1)))
    (assert-equal "ACE of DIAMONDS" (show-card (make-card 14 3)))
    (assert-equal "NINE of SPADES" (show-card (make-card 9 0)))
    (assert-equal "JACK of CLUBS" (show-card (make-card 11 2)))
)

(define-test lowest-card-returns-lowest
    (assert-equal (make-card 4 2) 
        (lowest-card
            (let ((cards (make-array 4 :fill-pointer 0)))
                (vector-push (make-card 8 1) cards)
                (vector-push (make-card 4 2) cards)
                (vector-push (make-card 10 3) cards)
                (vector-push (make-card 5 2) cards)
                cards)))
    (assert-equal (make-card 8 1) 
        (lowest-card
            (let ((cards (make-array 4 :fill-pointer 0)))
                (vector-push (make-card 8 1) cards)
                (vector-push (make-card 9 2) cards)
                (vector-push (make-card 12 3) cards)
                (vector-push (make-card 14 2) cards)
                cards)))
    (assert-equal (make-card 5 2) 
        (lowest-card
            (let ((cards (make-array 4 :fill-pointer 0)))
                (vector-push (make-card 8 1) cards)
                (vector-push (make-card 9 2) cards)
                (vector-push (make-card 5 2) cards)
                (vector-push (make-card 14 2) cards)
                cards)))
)
        
