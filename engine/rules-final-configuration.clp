;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;      REGOLE DI INFERENZA DEL GDT FINALE          ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule find-hypotetical-final-board-game-filler-and-party-and-family
        (declare (salience ?*sub-normal-priority*))
        
        (result (feature filler) (value ?filler))
        (result (feature party) (value ?party))
        (result (feature family) (value ?family))
        (or     (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature 6players+) (value ?players6+))
        )


        (general-kind (label ?label) (filler ?filler) (party ?party) (family ?family))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (1players  ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+))
        (main-features (label ?label) (age ?age) (length ?length))
        (user-age (min-age ?min))
        (test (>=  ?min ?age))

        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler-and-party-and-family)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler-and-party-and-family:  " ?label " " ?board-game-name "  "  crlf))
        
)

(defrule find-hypotetical-final-board-game-filler
        (declare (salience ?*sub-normal-priority*))
        (result (feature filler) (value ?filler))
        

        (or     (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature 6players+) (value ?players6+))
        )
        (general-kind (label ?label) (filler ?filler))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (1players  ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+))
        (main-features (label ?label) (age ?age))
        (user-age (min-age ?min))
        (test (>=  ?min ?age))

        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler:  " ?label " " ?board-game-name "  "  crlf))
        
)

(defrule find-hypotetical-final-board-game-family
        (declare (salience ?*sub-normal-priority*))
        (result (feature family) (value ?family))

        (or     (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature 6players+) (value ?players6+))
        )
        (general-kind (label ?label) (family ?family))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (1players  ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+))
        (main-features (label ?label) (age ?age) (length ?length))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-family)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-family:  " ?label " " ?board-game-name "  "  crlf))
        
)


(defrule find-hypotetical-final-board-game-party
        (declare (salience ?*sub-normal-priority*))
        (result (feature party) (value ?party))

        (or     (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature 6players+) (value ?players6+))
        )
        (general-kind (label ?label) (party ?party))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (1players  ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+))
        (main-features (label ?label) (age ?age) (length ?length))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-party)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-party:  " ?label " " ?board-game-name "  "  crlf))
        
)

(defrule find-hypotetical-final-board-game-wargame
        (declare (salience ?*sub-normal-priority*))
        (result (feature party) (value ?wargame))

        (or     
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                
        )
        (general-kind (label ?label) (party ?wargame))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) )
        (main-features (label ?label) (age ?age) (length ?length))
        (user-age (min-age ?min)) 
        (test (>=  ?min ?age))

        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-wargame)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-wargame:  " ?label " " ?board-game-name "  "  crlf))
        
)



(defrule find-hypotetical-final-board-game-cardgame
        (declare (salience ?*sub-normal-priority*))
        (result (feature party) (value ?cardgame))

        (or     
                (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                
        )
        (general-kind (label ?label) (party ?cardgame))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (1players ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) )
        (main-features (label ?label) (age ?age) (length ?length))
        (user-age (min-age ?min)) 
        (test (>=  ?min ?age))

        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-cardgame)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-cardgame:  " ?label " " ?board-game-name "  "  crlf))
        
)



(defrule find-hypotetical-final-board-game-american
        (declare (salience ?*sub-normal-priority*))
        (result (feature american) (value ?american))

        (or     
                (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                
        )
        (general-kind (label ?label) (american ?american))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (1players ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) )
        (main-features (label ?label) (age ?age) (length ?length))
        (user-age (min-age ?min)) 
        (test (>=  ?min ?age))

        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-american)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-american:  " ?label " " ?board-game-name "  "  crlf))
        
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