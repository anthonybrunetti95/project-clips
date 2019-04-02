;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;      REGOLE DI INFERENZA DEL GDT FINALE          ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule find-hypotetical-final-board-game
        (declare (salience ?*sub-normal-priority*))
        (not result (feature 1players) (value T)))
        (result (feature weight) (value ?weight))
        (result (feature coop-comp) (value ?coop-comp))
        (board-game (label ?label) (name ?name) (length ?length) (weight ?weight) (coop-comp ?coop-comp) (age ?age) (players $?players))
        (game-players (player ?player))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (printout t "si1" crlf crlf))
        (test  (member$ ?player $?players))
        (user-age (min-age ?min))
        (test (>=  ?min ?age))
        (test (printout t "si2" crlf crlf))
        (test (>= ?time ?length))
        (test (printout t "si3" crlf crlf))

        (general-kind (label ?label) (general-kind $?general-kind-feature))
        (object (general-kind $?general-kind&:(> (length$ ?general-kind) 0)))
        (object (general-kind $?general-kind&:(subsetp ?general-kind  ?general-kind-feature)))
        (test (printout t "si4 " ?label crlf))
        (secondary-kind (label ?label) (secondary-kind $?secondary-kind-feature))
        (object (secondary-kind $?secondary-kind&:(subsetp ?secondary-kind-feature ?secondary-kind )))
        (test (printout t "si5 " ?label crlf))     
        (thematic-environment (label ?label) (thematic-environment $?thematic-environment-feature))
        (object (thematic-environment $?thematic-environment&:(> (length$ ?thematic-environment) 0)))
        (test (printout t "si6 " ?label  ?thematic-environment crlf))
        (object (thematic-environment $?thematic-environment&:(subsetp ?thematic-environment-feature ?thematic-environment)))
        (test (printout t "si6 " ?label  ?thematic-environment crlf))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game:  " ?label" (what board-game) "  crlf))
        
)

(defrule find-hypotetical-final-board-game-1-player
        (declare (salience ?*sub-normal-priority*))
        (result (feature 1players) (value T))
        (result (feature weight) (value ?weight))
        (result (feature coop-comp) (value ?coop-comp))
        (board-game (label ?label) (name ?name) (length ?length) (weight ?weight) (age ?age) (players $?players))
        (game-players (player ?player))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (printout t "si1" crlf crlf))
        (test  (member$ ?player $?players))
        (user-age (min-age ?min))
        (test (>=  ?min ?age))
        (test (printout t "si2" crlf crlf))
        (test (>= ?time ?length))
        (test (printout t "si3" crlf crlf))

        (general-kind (label ?label) (general-kind $?general-kind-feature))
        (object (general-kind $?general-kind&:(> (length$ ?general-kind) 0)))
        (object (general-kind $?general-kind&:(subsetp ?general-kind  ?general-kind-feature)))
        (test (printout t "si4 " ?label crlf))
        (secondary-kind (label ?label) (secondary-kind $?secondary-kind-feature))
        (object (secondary-kind $?secondary-kind&:(subsetp ?secondary-kind-feature ?secondary-kind )))
        (test (printout t "si5 " ?label crlf))     
        (thematic-environment (label ?label) (thematic-environment $?thematic-environment-feature))
        (object (thematic-environment $?thematic-environment&:(> (length$ ?thematic-environment) 0)))
        (test (printout t "si6 " ?label  ?thematic-environment crlf))
        (object (thematic-environment $?thematic-environment&:(subsetp ?thematic-environment-feature ?thematic-environment)))
        (test (printout t "si6 " ?label  ?thematic-environment crlf))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game:  " ?label" (what board-game-1players) "  crlf))
        
)


(defrule find-final-board-game
        (declare (salience ?*low-priority*))
        ?hypotetical-final-board-game <- (hypotetical-final-board-game (label ?label) (what $?what))
        (test (= (length$ $?what) 1))
        (board-game (label ?label) (price ?price))
        (hypotetical-final-board-game (label ?label) (what $?what))
        (user-budget (min-budget ?min-budget) (max-budget ?max-budget)) 
        (test (>= ?price ?min-budget))
        (test (<= ?price ?max-budget))
        =>
        (retract ?hypotetical-final-board-game)
        (assert (final-board-game (label ?label)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Best Final Board-game: " ?label))
        (assert (ask-rejection))
)

(defrule no-final-board-game-but-hypotetical-final-board-game
        (declare (salience ?*lowest-priority*))
        (hypotetical-final-board-game (label ?label) (what $?what))
        (user-budget (min-budget ?min-budget) (max-budget ?max-budget))
        (board-game (label ?label) (price ?price))
        (board-game (label ?label) (name ?name))
        (last-question (question ?last))
        =>
        (print-hypotetical-final-board-game ?name ?price ?min-budget ?max-budget ?what)
        (ask-boolean want-to-see-hypotetical-final-board-game  ?last)
        (assert (want-to-see-hypotetical-final-board-game ?label))
)

(defrule want-to-see-hypotetical-final-board-game-yes
        (declare (salience ?*highest-priority*))
        ?f1 <- (want-to-see-hypotetical-final-board-game ?label)
        ?f2 <- (want-to-see yes)
        ?hypotetical-final-board-game <- (hypotetical-final-board-game (label ?label))
        =>
        (retract ?f1 ?f2 ?hypotetical-final-board-game)
        (assert (final-board-game (label ?label)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Best Final Board-game: " ?label))
        (assert (ask-rejection))
)

(defrule want-to-see-hypotetical-final-board-game-no
        (declare (salience ?*highest-priority*))
        ?f1 <- (want-to-see-hypotetical-final-board-game ?label)
        ?f2 <- (want-to-see no)
        ?f3 <- (hypotetical-final-board-game (label ?label))
        =>
        (retract ?f1 ?f2 ?f3)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;  REGOLE DI INFERENZA PER IL RIFIUTO DI UN GDT FINALE   ;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule rejection
        (declare (salience ?*highest-priority*))
        (last-question (question ?last))
        ?f1 <- (ask-rejection)
        =>
        (retract ?f1)
        (ask-boolean rejection ?last)
)

(defrule reject-final-board-game
        (declare (salience ?*highest-priority*))
        ?f1 <- (rejection)
        ?board-game <- (final-board-game (label ?label))
        =>
        (retract ?f1 ?board-game)        
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;  REGOLE DI INFERENZA PER GDT FINALE SCONOSCIUTO  ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule cant-find-any-final-board-game
        (declare (salience ?*bottom-priority*))
        (not (final-board-game))
        (not (hypotetical-final-board-game))
        
        =>
        (printout t crlf crlf crlf "  ")
        (printout t "Mi dispiace, ma non riesco a trovare nessun gico da tavolo adeguato alle tue esigenze." crlf)
        (assert (retraction))
        (assert (ask-retraction))
)