(load "packages.lisp")
(in-package :com.boothj5.lisphead.hand)

(defun make-hand (num-cards)
    (make-array num-cards :fill-pointer 0))

(defun hand-size (cards)
    (length cards))

(defun add-to-cards (hand card)
    (vector-push card hand))

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
