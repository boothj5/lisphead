(load "packages.lisp")
(in-package :com.boothj5.lisphead.card)

(defconstant +suits+ '("SPADES" "HEARTS" "CLUBS" "DIAMONDS"))
(defconstant +ranks+ '(nil nil "TWO" "THREE" "FOUR" "FIVE" "SIX" 
                        "SEVEN" "EIGHT" "NINE" "TEN" "JACK" "QUEEN" "KING" "ACE"))

;;; public functions

(defun make-card (rank suit)
    (list :rank rank :suit suit))

(defun show-card (card)
    (concatenate 'string 
        (elt +ranks+ (getf card :rank)) 
        " of " 
        (elt +suits+ (getf card :suit))))

(defun show-cards (cards)
    (if (not cards)
        ""
        (concatenate 'string
            (concatenate 'string
                (show-card (car cards))
                (if (eql (length cards) 1)
                    ""
                    ", "))
            (show-cards (cdr cards)))))

(defun rank-equal (card1 card2)
    (equal (getf card1 :rank) (getf card2 :rank)))

(defun rank-gtr (card1 card2)
    (> (getf card1 :rank) (getf card2 :rank)))

(defun invisible-card (card)
    (eql (getf card :rank) 7))

(defun reset-card (card)
    (eql (getf card :rank) 2))

(defun burn-card (card)
    (eql (getf card :rank) 10))

(defun miss-a-go-card (card)
    (eql (getf card :rank) 8))

(defun special-card (card)
    (or (reset-card card)
        (invisible-card card)
        (burn-card card)))

(defun sh-cmp (card1 card2)
    (cond 
        ((and (not (special-card card1)) (special-card card2)) t)
        ((and (special-card card1) (special-card card2)) nil)
        ((and (special-card card1) (not (special-card card2))) nil)
        (t (rank-gtr card2 card1))))

(defun all-ranks-equal (cards)
    (let ((card1 (car cards))
          (result t))
        (dolist (card cards)
            (when (not (rank-equal card1 card)) (setf result nil)))
        result))
