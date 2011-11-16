(defpackage :com.boothj5.lisphead.test-util
    (:use :common-lisp :lisp-unit
          :com.boothj5.lisphead.util))

(defpackage :com.boothj5.lisphead.test-card
    (:use :common-lisp :lisp-unit 
          :com.boothj5.lisphead.card))

(defpackage :com.boothj5.lisphead.test-hand
    (:use :common-lisp :lisp-unit
          :com.boothj5.lisphead.card
          :com.boothj5.lisphead.hand))

(defpackage :com.boothj5.lisphead.test-deck
    (:use :common-lisp :lisp-unit
          :com.boothj5.lisphead.card
          :com.boothj5.lisphead.deck))

(defpackage :com.boothj5.lisphead.test-player
    (:use :common-lisp :lisp-unit
          :com.boothj5.lisphead.card
          :com.boothj5.lisphead.hand
          :com.boothj5.lisphead.player))

(defpackage :com.boothj5.lisphead.test-game
    (:use :common-lisp :lisp-unit
          :com.boothj5.lisphead.card
          :com.boothj5.lisphead.game))
