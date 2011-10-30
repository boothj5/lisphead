(load "card.lisp")
(defpackage :com.boothj5.lisphead.player
    (:use :common-lisp)
    (:export :make-player 
             :get-name))
(in-package :com.boothj5.lisphead.player)

(defun make-player (name num-cards)
    (defvar hand (make-array num-cards :fill-pointer 0))
    (defvar face-up (make-array num-cards :fill-pointer 0))
    (defvar face-down (make-array num-cards :fill-pointer 0))
    (list name hand face-up face-down ))

(defun get-name (player)
    (car player))
