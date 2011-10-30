(defun newline () (format t "~%"))

(defun newlines (num)
    (loop 
        (newline)
        (setq num (- num 1))
        (when (eq num 0) (return))))

(defun show-welcome-message ()
    (format t "Welcome to LispHead!~%"))

(defun request-num-players ()
    (format t "Please enter number of players: ")
    (read))

(defun request-num-cards ()
    (format t "Please enter number of cards each: ")
    (read))


(newlines 100)

(show-welcome-message)

(setq num-players (request-num-players))
(setq num-cards-each (request-num-cards))

(setq player-names (make-array num-players :fill-pointer 0))

(setq i 0)
(loop
    (format t "Enter name for player ~d: " (+ i 1))
    (vector-push (read) player-names)
    (setq i (+ i 1))
    (when (eq i num-players) (return)))

(setq i 0)
(loop
    (format t "Player ~d name = ~s~%" (+ i 1) (elt player-names i))
    (setq i (+ i 1))
    (when (eq i num-players) (return)))
