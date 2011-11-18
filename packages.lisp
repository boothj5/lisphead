(defpackage :com.boothj5.lisphead.card
    (:use :common-lisp)
    (:export :+suits+
             :+ranks+
             :make-card
             :equal-rank
             :show-card
             :show-cards))

(defpackage :com.boothj5.lisphead.hand
    (:use :common-lisp
          :com.boothj5.lisphead.card)
    (:export :make-hand
             :hand-size
             :add-to-cards
             :get-card
             :set-card
             :get-cards-of-same-rank
             :remove-cards
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
             :remove-from-hand
             :has-cards-in-hand
             :has-cards-in-face-up
             :has-cards-in-face-down
             :has-cards
             :do-swap))

(defpackage :com.boothj5.lisphead.util
    (:use :common-lisp)
    (:export :parse-choice))

(defpackage :com.boothj5.lisphead.console
    (:use :common-lisp 
          :com.boothj5.lisphead.card 
          :com.boothj5.lisphead.util
          :com.boothj5.lisphead.hand
          :com.boothj5.lisphead.player)
    (:export :newline
             :newlines
             :clearscreen
             :show-welcome-message
             :request-num-players
             :request-num-cards
             :request-player-names
             :request-swap
             :request-swap-more
             :request-hand-swap
             :request-face-up-swap
             :request-move
             :show-player
             :show-game
             :show-players))

(defpackage :com.boothj5.lisphead.game
    (:use :common-lisp 
          :com.boothj5.lisphead.player 
          :com.boothj5.lisphead.deck
          :com.boothj5.lisphead.hand
          :com.boothj5.lisphead.card)
    (:export :make-game
             :deal
             :first-move
             :make-move
             :add-to-pile
             :set-last-move
             :deal-to-hand
             :continue-game
             :get-current-player))

(defpackage :com.boothj5.lisphead
    (:use :common-lisp
          :com.boothj5.lisphead.console
          :com.boothj5.lisphead.game
          :com.boothj5.lisphead.player))
