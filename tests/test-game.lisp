(in-package :com.boothj5.lisphead.test-game)

(define-test add-to-pile-adds-cards
    (assert-true (let ((game (make-game (list "James") 4))
                       (cards (list (make-card 10 3) (make-card 2 3)))) 
                    (add-to-pile game cards)
                    (and (find (make-card 10 3) (getf game :pile) :test #'equal)
                         (find (make-card 2 3) (getf game :pile) :test #'equal)))))

(define-test add-to-pile-decrements-size
    (assert-equal 2 (let ((game (make-game (list "James") 4))
                          (cards (list (make-card 10 3) (make-card 2 3)))) 
                        (add-to-pile game cards)
                        (length (getf game :pile)))))

(define-test set-last-move-sets-correct-string
    (assert-equal "James laid THREE of SPADES, SEVEN of DIAMONDS, "
        (let ((game (make-game (list "James") 4))
              (cards (list (make-card 3 0) (make-card 7 3))))
            (set-last-move game cards)
            (getf game :last-move))))
            
