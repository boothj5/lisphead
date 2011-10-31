(load "card.lisp")
(defpackage :com.boothj5.lisphead.player
    (:use :common-lisp)
    (:export :make-player 
             :add-to-hand
             :add-to-face-up
             :add-to-face-down))
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
