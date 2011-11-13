(load "packages.lisp")
(in-package :com.boothj5.lisphead.hand)

(defun make-hand (num-cards)
    (make-array num-cards :fill-pointer 0 :adjustable t))

(defun hand-size (cards)
    (length cards))

(defun add-to-cards (hand card)
    (vector-push-extend card hand))

(defun lowest-card (hand)
    (let ((lowest (elt hand 0)))
        (dotimes (i (length hand))
            (if (< (getf (elt hand i) :rank) (getf lowest :rank))
                (setf lowest (elt hand i))))
        lowest))

(defun get-card (hand i)
    (elt hand i))

(defun set-card (hand i card)
    (setf (elt hand i) card))

(defun remove-card (hand card)
    (let ((pointer (fill-pointer hand)))
        (make-array (- (length hand) 1)
            :initial-contents (remove card hand :test #'equal)
            :fill-pointer (- pointer 1)
            :adjustable t)))


(defun remove-cards (hand cards)
    (let ((result hand))
        (dolist (card cards)
            (setf result (remove-card result card)))
        result))

(defun get-cards-of-same-rank (card hand)
    (let ((to-lay nil))
        (push card to-lay)
        (dotimes (i (hand-size hand))
            (let ((test-card (get-card hand i)))
                (when (and (equal-rank test-card (car to-lay)) 
                           (not (eql test-card (car to-lay))))
                    (push test-card to-lay))))
        to-lay))




