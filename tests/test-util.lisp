(in-package :com.boothj5.lisphead.test-util)

(define-test parse-choice-parses
    (assert-equal '(4 3 1)
                  (parse-choice "5 4 2"))
    (assert-equal '(5 1 2 9)
                  (parse-choice "6,2, 3,  10"))
    (assert-equal '(12)
                  (parse-choice "13"))
    (assert-equal '(9)
                  (parse-choice "  10"))
    (assert-equal '(4)
                  (parse-choice ", 5")))

(define-test parse-choice-when-nothing-returns-nil
    (assert-equal nil (parse-choice ""))
    (assert-equal nil (parse-choice nil))
    (assert-equal nil (parse-choice "ab, r")))
