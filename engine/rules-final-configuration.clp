;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;      REGOLE DI INFERENZA DEL GDT FINALE          ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule find-hypotetical-final-board-game-main-feautures
        (declare (salience ?*sub-normal-priority*))
        (or     ( or (result (feature wargame) (value ?wargame))
                (result (feature cardgame) (value ?cardgame)))
                (result (feature family) (value ?family)))
        ;;(result (feature filler) (value ?filler))
        ;;(result (feature party) (value ?party))
        
        (general-kind (label ?label) (wargame ?wargame) (cardgame ?cardgame) (family ?family) (filler ?filler) (party ?party))
        (board-game (label ?label) (board-game-name ?board-game-name))
        =>
        (assert (hypotetical-final-board-game (label ?label) ))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game:  " ?label " " ?board-game-name    crlf))
        
)


(defrule find-final-board-game
        (declare (salience ?*low-priority*))
        ?hypotetical-final-board-game <- (hypotetical-final-board-game (label ?label) (what $?what))
        (test (= (length$ $?what) 1))
        (main-features (label ?label) (price ?price))
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
        (main-features (label ?label) (price ?price))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (last-question (question ?last))
        =>
        (print-hypotetical-final-board-game ?board-game-name ?price ?min-budget ?max-budget ?what)
        (ask-boolean want-to-see-hypotetical-final-board-game ?last)
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