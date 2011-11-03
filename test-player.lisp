(in-package :com.boothj5.lisphead.test-player)

(define-test lowest-hand-card-returns-lowest
    (assert-equal (make-card 4 2) 
        (lowest-hand-card
            (let ((player (make-player "James" 4)))
                (add-to-hand player (make-card 8 1))
                (add-to-hand player (make-card 4 2))
                (add-to-hand player (make-card 10 3))
                (add-to-hand player (make-card 5 2))
                player)))
    (assert-equal (make-card 8 1) 
        (lowest-hand-card
            (let ((player (make-player "James" 4)))
                (add-to-hand player (make-card 8 1))
                (add-to-hand player (make-card 9 2))
                (add-to-hand player (make-card 12 3))
                (add-to-hand player (make-card 14 2))
                player)))
    (assert-equal (make-card 5 2) 
        (lowest-hand-card
            (let ((player (make-player "James" 4)))
                (add-to-hand player (make-card 8 1))
                (add-to-hand player (make-card 9 2))
                (add-to-hand player (make-card 5 2))
                (add-to-hand player (make-card 14 2))
                player)))
)
        
