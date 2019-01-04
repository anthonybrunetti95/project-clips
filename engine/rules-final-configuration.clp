;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;      REGOLE DI INFERENZA DEL GDT FINALE          ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule find-final-board-game
        (declare (salience ?*sub-normal-priority*))
        (info (feature gothic) (value "T"))
        (result (feature board-game-name) (value ?game-name)) 
        (board-game (label ?label) (board-game-name ?game-name) )
        =>
        (assert (final-board-game (label ?label) )
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game: " ?label))
        (assert (ask-rejection)))
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
        (not (hypotetical-final-board-game-without-detail))
        =>
        (printout t crlf crlf crlf "  ")
        (printout t "Mi dispiace, ma non riesco a trovare nessun gico da tavolo adeguato alle tue esigenze." crlf)
        (assert (retraction))
        (assert (ask-retraction))
)