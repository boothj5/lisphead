(load "packages.lisp")
(in-package :com.boothj5.lisphead.util)

(defun choice-tok (str test start)
    (let ((p1 (position-if test str :start start)))
        (if p1
            (let ((p2 (position-if #'(lambda (c)
                                        (not (funcall test c)))
                                   str :start p1)))
                (cons (subseq str p1 p2)
                      (if p2
                        (choice-tok str test p2)
                        nil)))
            nil)))  

(defun parse-choice (str)
    (mapcar #'(lambda (s)
                (- (parse-integer s) 1))
            (choice-tok str #'digit-char-p 0)))
            
