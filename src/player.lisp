(load "packages.lisp")
(in-package :com.boothj5.lisphead.player)

;;; public functions

(defun make-player (name num-cards)
    (let ((hand (make-hand num-cards))
          (face-up (make-hand num-cards))
          (face-down (make-hand num-cards)))
        (list :player-name name :hand hand :face-up face-up :face-down face-down)))

(defun add-to-hand (player card)
    (add-to-cards (getf player :hand) card))

(defun add-to-face-up (player card)
    (add-to-cards (getf player :face-up) card))

(defun add-to-face-down (player card)
    (add-to-cards (getf player :face-down) card))

(defun do-swap (player hand-choice face-up-choice)
    (let ((temp (get-card (getf player :face-up) face-up-choice)))
        (set-card (getf player :face-up) 
                  face-up-choice
                  (get-card (getf player :hand) hand-choice))
        (set-card (getf player :hand) 
                  hand-choice
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

(defun remove-from-hand (player cards)
    (setf (getf player :hand)
          (remove-cards (getf player :hand) cards)))

(defun remove-from-face-up (player cards)
    (setf (getf player :face-up)
          (remove-cards (getf player :face-up) cards)))

(defun remove-from-face-down (player cards)
    (setf (getf player :face-down)
          (remove-cards (getf player :face-down) cards)))

(defun has-cards-in-hand (player)
    (has-cards (getf player :hand)))

(defun has-cards-in-face-up (player)
    (has-cards (getf player :face-up)))

(defun has-cards-in-face-down (player)
    (has-cards (getf player :face-down)))

(defun player-has-cards (player)
    (or (has-cards-in-hand player)
        (has-cards-in-face-up player)
        (has-cards-in-face-down player)))

(defun sort-hand (player)
    (setf (getf player :hand)
          (sort (getf player :hand) #'sh-cmp)))
