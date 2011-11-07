(in-package :com.boothj5.lisphead.test-player)

(defun make-james ()
    (let ((player (make-player "James" 4)))
        (add-to-hand player (make-card 8 1))
        (add-to-hand player (make-card 4 2))
        (add-to-hand player (make-card 10 3))
        (add-to-hand player (make-card 5 2))
        player))

(defun make-bob ()
    (let ((player (make-player "Bob" 4)))
        (add-to-hand player (make-card 8 1))
        (add-to-hand player (make-card 9 2))
        (add-to-hand player (make-card 12 3))
        (add-to-hand player (make-card 14 2))
        player))
        
(defun make-dave ()
    (let ((player (make-player "Dave" 4)))
        (add-to-hand player (make-card 8 1))
        (add-to-hand player (make-card 9 2))
        (add-to-hand player (make-card 5 2))
        (add-to-hand player (make-card 14 2))
        player))
    
(define-test lowest-hand-card-returns-lowest
    (assert-equal (make-card 4 2) 
        (lowest-hand-card (make-james)))
    (assert-equal (make-card 8 1) 
        (lowest-hand-card (make-bob)))
    (assert-equal (make-card 5 2) 
        (lowest-hand-card (make-dave))))

(define-test player-with-lowest-returns-correct-player
    (assert-equal "James"
        (let* ((bob (make-bob)) (james (make-james)) (dave (make-dave))
              (players (list bob james dave)))
            (getf (player-with-lowest-in-hand players) :player-name))))
