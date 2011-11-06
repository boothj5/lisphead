(load "packages.lisp")
(in-package :com.boothj5.lisphead.deck)

(defconstant +deck-size+ 52)

(defun make-deck (num-players num-cards-each)
    (let* ((num-decks (calc-decks-needed num-players num-cards-each))
           (deck (make-array (* +deck-size+ num-decks) :fill-pointer 0))
           (new-deck (make-array 52 :fill-pointer 0)))
        (dotimes (i num-decks)
            (setf new-deck (create-single-deck))
            (dotimes (j (length new-deck))
                (vector-push (vector-pop new-deck) deck)))
        deck))

(defun create-single-deck ()
    (let ((deck (make-array +deck-size+ :fill-pointer 0))
          (rank))
        (dotimes (suit (length +suits+))
            (setf rank 2)
            (loop
                (vector-push (make-card rank suit) deck)
                (incf rank)
                (when (> rank 14) (return))))
        deck))

(defun calc-decks-needed (num-players num-cards-each)
    (let* ((cards-needed (* num-players num-cards-each 3))
           (div (floor cards-needed +deck-size+))
           (add (if (> (mod cards-needed +deck-size+) 0) 1 0)))
        (+ div add)))

(defun shuffle (deck)
    (map-into deck #'car
        (sort (map 'vector (lambda (x)
            (cons x (random 1d0))) deck)
                #'< :key #'cdr)))

(defun pop-deck (deck)
    (vector-pop deck))
