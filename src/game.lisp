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

(defun get-current-player (game)
    (elt (getf game :players) (getf game :current-player))) 

(defun add-to-pile (game cards)
    (dolist (card cards)
        (push card (getf game :pile))))
    
(defun first-move (game)
    (let* ((player (player-with-lowest-in-hand (getf game :players)))
           (lowest (lowest-card (getf player :hand)))
           (to-lay nil))
        (setf (getf game :current-player) (position player (getf game :players)))
        (push lowest to-lay)
        (dotimes (i (hand-size (getf player :hand)))
            (let ((card (get-card (getf player :hand) i)))
                (when (and (equal-rank card (car to-lay)) 
                           (not (eql card (car to-lay))))
                    (push card to-lay))))
        (remove-from-hand player to-lay)
        (add-to-pile game to-lay)
        (setf (getf game :last-move) 
              (format nil "~s laid ~s" (getf player :player-name) to-lay))))

