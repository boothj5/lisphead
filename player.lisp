(load "card.lisp")
(defpackage :com.boothj5.lisphead.player
    (:use :common-lisp)
    (:export :make-player 
             :get-name
             :get-hand
             :get-face-up
             :get-face-down
             :add-to-hand))
(in-package :com.boothj5.lisphead.player)

(defun make-player (name num-cards)
    (let ((hand (make-array num-cards :fill-pointer 0))
          (face-up (make-array num-cards :fill-pointer 0))
          (face-down (make-array num-cards :fill-pointer 0)))
        (list name hand face-up face-down )))

(defun get-name (player)
    (car player))

(defun get-hand (player)
    (car (cdr player)))

(defun get-face-up (player)
    (car (cdr (cdr player))))

(defun get-face-down (player)
    (car (cdr (cdr (cdr player)))))

(defun add-to-hand (player card)
    (vector-push card (get-hand player)))
