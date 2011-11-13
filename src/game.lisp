(load "packages.lisp")
(in-package :com.boothj5.lisphead.game)

(setf *random-state* (make-random-state t))

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
                (add-to-face-down player (pop-deck deck))))))

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
        (remove-from-hand player to-lay)
        (add-to-pile game to-lay)
        (deal-to-hand (get-current-player game) (getf game :deck) (length to-lay))
        (set-last-move game to-lay))
        (move-to-next-player game))

(defun move-to-next-player (game)
    (setf (getf game :current-player) (+ (getf game :current-player) 1))
    (when (eql (getf game :current-player) (length (getf game :players)))
        (setf (getf game :current-player) 0)))

(defun continue-game (game)
    (let ((num-players-with-cards 0))
        (dolist (player (getf game :players))
            (when (has-cards player)
                (setf num-players-with-cards (+ num-players-with-cards 1))))
        (> num-players-with-cards 1)))
