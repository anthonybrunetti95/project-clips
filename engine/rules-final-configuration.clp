;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;      REGOLE DI INFERENZA DEL GDT FINALE          ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule find-hypotetical-final-board-game-filler-or-party-or-family
        (declare (salience ?*sub-normal-priority*))
        
        
        (or     (result (feature filler) (value ?filler))
                (result (feature party) (value ?party))
                (result (feature family) (value ?family))
        )
        (or     (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature 6players+) (value ?players6+))
                (result (feature coop-comp) (value ?coop-comp))
        )


        (general-kind (label ?label) (filler ?filler) (party ?party) (family ?family))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (1players  ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+))
        (main-features (label ?label) (age ?age) (length ?length) (coop-comp ?coop-comp))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))

        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler-or-party-or-family)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler-or-party-or-family:  " ?label " " ?board-game-name "  "  crlf))
        
)


(defrule find-hypotetical-final-board-game-wargame
        (declare (salience ?*sub-normal-priority*))
        (result (feature wargame) (value ?wargame))

        (or     
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                
        )
        (general-kind (label ?label) (wargame ?wargame))
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
        (result (feature cardgame) (value ?cardgame))
        

        (or     
                (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature coop-comp) (value ?coop-comp))
                
        )
        (general-kind (label ?label) (cardgame ?cardgame))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (1players ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) )
        (main-features (label ?label) (age ?age) (length ?length) (coop-comp ?coop-comp))
        (user-age (min-age ?min)) 
        (test (>=  ?min ?age))

        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-cardgame)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-cardgame:  " ?label " " ?board-game-name "  "  crlf))
        
)



(defrule find-hypotetical-final-board-game-american
        (declare (salience ?*sub-normal-priority*))
        (result (feature american) (value ?american))
        (result (feature weight) (value ?weight))
       

        (or     
                (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature +6players) (value ?players6+))
                (result (feature coop-comp) (value ?coop-comp))
                
        )
        (general-kind (label ?label) (american ?american))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (1players ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+) )
        (main-features (label ?label) (age ?age) (weight ?weight) (coop-comp ?coop-comp))
        (user-age (min-age ?min)) 
        (test (>=  ?min ?age))

        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-american)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-american:  " ?label " " ?board-game-name "  "  crlf))
        
)


(defrule find-hypotetical-final-board-game-german
        (declare (salience ?*sub-normal-priority*))
        (result (feature german) (value ?german))

        (or     
                (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature +6players) (value ?players6+))
                
        )
        (general-kind (label ?label) (german ?german))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (1players ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+) )
        (main-features (label ?label) (age ?age) (length ?length))
        (user-age (min-age ?min)) 
        (test (>=  ?min ?age))

        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-german)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-german:  " ?label " " ?board-game-name "  "  crlf))
        
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