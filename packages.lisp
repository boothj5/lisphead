(defpackage :com.boothj5.lisphead.card
    (:use :common-lisp)
    (:export :+suits+
             :+ranks+
             :make-card
             :show-card))

(defpackage :com.boothj5.lisphead.hand
    (:use :common-lisp
          :com.boothj5.lisphead.card)
    (:export :make-hand
             :hand-size
             :add-to-cards
             :get-card
             :set-card
             :lowest-card))

(defpackage :com.boothj5.lisphead.deck
    (:use :common-lisp
          :com.boothj5.lisphead.card)
    (:export :make-deck
             :shuffle
             :pop-deck))

(defpackage :com.boothj5.lisphead.player
    (:use :common-lisp
          :com.boothj5.lisphead.card
          :com.boothj5.lisphead.hand)
    (:export :make-player
             :add-to-hand
             :add-to-face-up
             :add-to-face-down
             :lowest-hand-card
             :player-with-lowest-in-hand
             :do-swap))

(defpackage :com.boothj5.lisphead.console
    (:use :common-lisp 
          :com.boothj5.lisphead.card 
          :com.boothj5.lisphead.hand
          :com.boothj5.lisphead.player)
    (:export :newline
             :newlines
             :show-welcome-message
             :request-num-players
             :request-num-cards
             :request-player-names
             :request-swap
             :request-swap-more
             :request-hand-swap
             :request-face-up-swap
             :show-player
             :show-players))

(defpackage :com.boothj5.lisphead.game
    (:use :common-lisp 
          :com.boothj5.lisphead.player 
          :com.boothj5.lisphead.deck
          :com.boothj5.lisphead.card)
    (:export :make-game
             :deal
             :get-current-player))

(defpackage :com.boothj5.lisphead
    (:use :common-lisp
          :com.boothj5.lisphead.console
          :com.boothj5.lisphead.game
          :com.boothj5.lisphead.player))
