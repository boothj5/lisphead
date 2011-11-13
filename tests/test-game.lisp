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
            
(define-test deal-to-hand-adds-to-hand
    (assert-true (let* ((game (make-game (list "James") 4))
                        (player (get-current-player game))
                        (deck (make-array 5 :fill-pointer 0)))
                    (vector-push (make-card 10 3) deck)
                    (vector-push (make-card 4 3) deck)
                    (vector-push (make-card 2 1) deck)
                    (vector-push (make-card 14 2) deck)
                    (vector-push (make-card 7 0) deck)
                    (deal-to-hand player deck 3)
                    (and (find (make-card 7 0) (getf player :hand) :test #'equal)
                         (find (make-card 14 2) (getf player :hand) :test #'equal)
                         (find (make-card 2 1) (getf player :hand) :test #'equal)))))
                   
(define-test deal-to-hand-decrements-deck-size
    (assert-equal 2 (let* ((game (make-game (list "James") 4))
                           (player (get-current-player game))
                           (deck (make-array 5 :fill-pointer 0)))
                        (vector-push (make-card 10 3) deck)
                        (vector-push (make-card 4 3) deck)
                        (vector-push (make-card 2 1) deck)
                        (vector-push (make-card 14 2) deck)
                        (vector-push (make-card 7 0) deck)
                        (deal-to-hand player deck 3)
                        (length deck))))
     
