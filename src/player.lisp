(load "packages.lisp")
(in-package :com.boothj5.lisphead.player)

(defun make-player (name num-cards)
    (let ((hand (make-array num-cards :fill-pointer 0))
          (face-up (make-array num-cards :fill-pointer 0))
          (face-down (make-array num-cards :fill-pointer 0)))
        (list :player-name name :hand hand :face-up face-up :face-down face-down)))

(defun add-to-hand (player card)
    (vector-push card (getf player :hand)))

(defun add-to-face-up (player card)
    (vector-push card (getf player :face-up)))

(defun add-to-face-down (player card)
    (vector-push card (getf player :face-down)))

(defun do-swap (player hand-choice face-up-choice)
    (let ((temp (elt (getf player :face-up) face-up-choice)))
        (setf 
            (elt (getf player :face-up) face-up-choice) 
            (elt (getf player :hand) hand-choice))
        (setf 
            (elt (getf player :hand) hand-choice) 
            temp)))

(defun lowest-hand-card (player)
    (lowest-card (getf player :hand)))

(defun player-with-lowest-in-hand (players)
    (let ((lowest (car players)))
        (dolist (player players)
            (when (< (getf (lowest-hand-card player) :rank) 
                     (getf (lowest-hand-card lowest) :rank))
                (setf lowest player)))
        lowest))
