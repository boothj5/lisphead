(in-package :com.boothj5.lisphead.test-hand)

(defun make-hand1 ()
    (let ((cards (make-hand 4)))
        (add-to-cards cards (make-card 8 1))
        (add-to-cards cards (make-card 4 2))
        (add-to-cards cards (make-card 10 3))
        (add-to-cards cards (make-card 5 2))
        cards))

(defun make-hand2 ()
    (let ((cards (make-hand 4)))
        (add-to-cards cards (make-card 8 1))
        (add-to-cards cards (make-card 9 2))
        (add-to-cards cards (make-card 12 3))
        (add-to-cards cards (make-card 14 2))
        cards))
    
(defun make-hand3 ()
    (let ((cards (make-hand 4)))
        (add-to-cards cards (make-card 8 1))
        (add-to-cards cards (make-card 9 2))
        (add-to-cards cards (make-card 5 2))
        (add-to-cards cards (make-card 14 2))
        cards))

(defun make-hand4 ()
    (let ((cards (make-hand 4)))
        (add-to-cards cards (make-card 8 3))
        (add-to-cards cards (make-card 9 2))
        (add-to-cards cards (make-card 8 2))
        (add-to-cards cards (make-card 8 1))
        (add-to-cards cards (make-card 4 0))
        cards))

(define-test lowest-card-returns-lowest
    (assert-equal (make-card 4 2) 
        (lowest-card (make-hand1)))
    (assert-equal (make-card 8 1) 
        (lowest-card (make-hand2)))
    (assert-equal (make-card 5 2) 
        (lowest-card (make-hand3))))

(define-test remove-cards-decrements-size
    (assert-equal 3
        (let ((hand (make-hand1)))
            (length (remove-cards hand (list (make-card 4 2))))))
    (assert-equal 2
        (let ((hand (make-hand1)))
            (length (remove-cards hand
                                  (list (make-card 4 2)
                                        (make-card 10 3)))))))

(define-test remove-cards-removes-cards
    (assert-false
        (let* ((hand (make-hand1))
               (result (remove-cards hand (list (make-card 4 2)))))
            (find (make-card 4 2) result :test #'equal)))
    (assert-false
        (let* ((hand (make-hand1))
               (result (remove-cards hand
                                    (list (make-card 4 2)
                                          (make-card 10 3)))))
            (or (find (make-card 4 2) result :test #'equal)
                (find (make-card 10 3) result :test #'equal)))))

(define-test get-of-similar-rank-gets-all
    (assert-true
        (let ((hand (make-hand4))
              (card (make-card 8 0))
              (result nil))
            (setf result (get-cards-of-same-rank card hand))
            (and (find (make-card 8 0) result :test #'equal)
                 (find (make-card 8 1) result :test #'equal)
                 (find (make-card 8 2) result :test #'equal)
                 (find (make-card 8 3) result :test #'equal)))))
            
            
