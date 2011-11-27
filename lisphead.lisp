(load "packages.lisp")
(load "load.lisp")
(in-package :com.boothj5.lisphead)

(defvar *num-players*)
(defvar *num-cards-each*)
(defvar *player-names*)
(defvar *game*)

(defun main ()
    (clearscreen)
    (show-welcome-message)
    (setf *num-players* (request-num-players))
    (setf *num-cards-each* (request-num-cards))
    (setf *player-names* (request-player-names *num-players*))
    (setf *game* (make-game *player-names* *num-cards-each*))
    (deal *game*)
    
    (clearscreen)
    (show-players (getf *game* :players))
    (swap-cards)
    (first-move *game*)
    (show-game *game*)

    (loop while (continue-game *game*) do
        (cond ((playing-from-face-down *game*)
               (let* ((player (get-current-player *game*))
                      (choice (request-face-down-card player)))
                   (if (valid-move (list choice) *game*)
                       (progn
                           (show-face-down-win 
                               (get-card (getf player :face-down) choice))
                           (make-face-down-move *game* choice)
                           (show-game *game*))
                       (progn
                           (show-face-down-fail
                               (get-card (getf player :face-down) choice))
                           (pickup-with-card *game*
                               (get-card (getf player :face-down) choice))
                           (show-game *game*)))))
              ((can-play *game*)
               (let ((choice (request-move (get-current-player *game*))))
                   (if (valid-move choice *game*)
                       (progn
                           (make-move *game* choice)
                           (show-game *game*))
                       (show-invalid-move))))
              (t (progn
                    (show-pickup (get-current-player *game*))
                    (pickup *game*)
                    (clearscreen)
                    (show-game *game*))))))

(defun swap-cards ()
    (dolist (player (getf *game* :players))
        (let ((swap (request-swap player))
              (hand)
              (face-up))
            (loop until (not swap) do
                (setf hand (request-hand-swap))
                (setf face-up (request-face-up-swap))
                (do-swap player hand face-up)
                (setf swap (request-swap-more player))))))

(main)
