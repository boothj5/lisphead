(load "packages.lisp")
(in-package :com.boothj5.lisphead.game)

(setf *random-state* (make-random-state t))

;;; public functions

(defun make-game (player-names num-cards)
    (let ((players nil)
          (deck (make-deck (length player-names) num-cards)))
        (shuffle deck)
        (dolist (name player-names)
            (setf players (cons (make-player name num-cards) players)))
        (list :players players 
              :current-player 0 
              :deck deck
              :pile nil 
              :last-move ""
              :num-cards num-cards)))
           
(defun deal (game)
    (let ((players (getf game :players))
          (deck (getf game :deck))
          (num-cards (getf game :num-cards)))
        (dolist (player players)
            (dotimes (i num-cards)
                (add-to-hand player (pop-deck deck))
                (add-to-face-up player (pop-deck deck))
                (add-to-face-down player (pop-deck deck)))
            (sort-hand player))))

(defun deal-to-hand (player deck num)
    (dotimes (i num)
        (add-to-hand player (pop-deck deck))))

(defun get-current-player (game)
    (elt (getf game :players) (getf game :current-player))) 

(defun set-last-move (game cards)
    (let ((player (get-current-player game)))
    (setf (getf game :last-move)
          (format nil "~A laid ~A" (getf player :player-name) (show-cards cards)))))

(defun add-to-pile (game cards)
    (dolist (card cards)
        (push card (getf game :pile))))
    
(defun first-move (game)
    (let* ((player (player-with-lowest-in-hand (getf game :players)))
           (lowest (lowest-card (getf player :hand)))
           (to-lay nil))
        (setf (getf game :current-player) (position player (getf game :players)))
        (setf to-lay (get-cards-of-same-rank lowest (getf player :hand)))
        (hand-move game to-lay)
        (sort-hand player)))

(defun make-move (game choice)
    (let* ((player (get-current-player game))
           (hand (getf player :hand))
           (cards (get-cards-at choice hand)))
        (hand-move game cards)
        (sort-hand player)))

(defun valid-move (choice game)
    (let* ((player (get-current-player game))
           (hand (getf player :hand))
           (cards (get-cards-at choice hand)))
        (if (not (all-ranks-equal cards))
            nil
            (valid-move-on-pile (car cards) (getf game :pile)))))

(defun continue-game (game)
    (let ((num-players-with-cards 0))
        (dolist (player (getf game :players))
            (when (has-cards player)
                (incf num-players-with-cards)))
        (> num-players-with-cards 1)))

(defun playing-from-face-down (game)
    (let ((player (get-current-player game)))
        (and (not (has-cards-in-hand player))
             (not (has-cards-in-face-up player))
             (has-cards-in-face-down player))))

(defun can-play (game)
    (let ((player (get-current-player game)))
        (cond ((null (getf game :pile))
                    t)
              ((has-cards-in-hand player)
                    (can-move-with (getf player :hand) game))
              ((has-cards-in-face-up player)
                    (can-move-with (getf player :face-up) game))
              (t nil))))

;;; private functions

(defun hand-move (game cards)
    (play-from-hand game cards)
    (set-last-move game cards)
    (move-to-next-player game))

(defun move-to-next-player (game)
    (incf (getf game :current-player))
    (when (eql (getf game :current-player) (length (getf game :players)))
        (setf (getf game :current-player) 0)))

(defun play-from-hand (game to-lay)
    (let ((player (get-current-player game))
          (num-cards (length to-lay))
          (deck (getf game :deck)))
        (remove-from-hand player to-lay)
        (add-to-pile game to-lay)
        (deal-to-hand player deck num-cards)))

(defun can-move-with (hand game)
    (let ((can nil))
        (dotimes (i (hand-size hand))
            (when (valid-move-on-pile (get-card hand i) (getf game :pile))
                (setf can t)))
        can))

(defun valid-move-on-pile (card pile)
    (cond ((null pile) t)
          ((special-card card) t)
          ((invisible-card (car pile)) (valid-move-on-pile card (cdr pile)))
          (t (or (rank-gtr card (car pile)) (rank-equal card (car pile))))))
