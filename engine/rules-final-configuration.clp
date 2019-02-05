;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;      REGOLE DI INFERENZA DEL GDT FINALE          ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule find-hypotetical-final-board-game-filler-and-party-and-family
        (declare (salience ?*sub-normal-priority*))
        
        
                (result (feature filler) (value T))
                (result (feature party) (value T))
                (result (feature family) (value T))
        
        (or     (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature 6players+) (value ?players6+))
                (result (feature coop-comp) (value ?coop-comp))
                (result (feature thematic) (value ?thematic))
                (result (feature challenging) (value ?challenging))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))
                (result (feature castles) (value ?castles))
                (result (feature renaissance-court) (value ?renaissance-court))
                (result (feature tale) (value ?tale))
                (result (feature fantasy) (value ?fantasy))
                (result (feature futuristic) (value ?futuristic))
                (result (feature politics) (value ?politics))
        )


        (general-kind (label ?label) (filler T) (party T) (family T))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (1players  ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+))
        (main-features (label ?label) (age ?age) (coop-comp ?coop-comp))
        (secondary-kind (label ?label) (thematic ?thematic) (challenging ?challenging) (investigative ?investigative) (bluff ?bluff))
        (thematic-environment (label ?label) (castles ?castles) (renaissance-court ?renaissance-court) (tale ?tale) (fantasy ?fantasy) (futuristic ?futuristic) (politics ?politics))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (>=  ?min ?age))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler-and-party-and-family)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler-and-party-and-family:  " ?label " " ?board-game-name "  "  crlf))
        
)

(defrule find-hypotetical-final-board-game-filler-and-family
        (declare (salience ?*sub-normal-priority*))
        
        
                (result (feature filler) (value T))
                (result (feature family) (value T))
                (not (result (feature party) (value T)))
        
        (or     (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature 6players+) (value ?players6+))
                (result (feature coop-comp) (value ?coop-comp))
                (result (feature thematic) (value ?thematic))
                (result (feature challenging) (value ?challenging))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))
        )
                
        (or     (result (feature castles) (value ?castles))
                (result (feature renaissance-court) (value ?renaissance-court))
                (result (feature tale) (value ?tale))
                (result (feature fantasy) (value ?fantasy))
                (result (feature futuristic) (value ?futuristic))
                (result (feature politics) (value ?politics))
        )


        (general-kind (label ?label) (filler T) (party F) (family T))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (1players  ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+))
        (main-features (label ?label) (age ?age) (length ?length) (coop-comp ?coop-comp))
        (secondary-kind (label ?label) (thematic ?thematic) (challenging ?challenging) (investigative ?investigative) (bluff ?bluff))
        (thematic-environment (label ?label) (castles ?castles) (renaissance-court ?renaissance-court) (tale ?tale) (fantasy ?fantasy) (futuristic ?futuristic) (politics ?politics))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler-and-family)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler-and-family:  " ?label " " ?board-game-name "  "  crlf))
        
)

(defrule find-hypotetical-final-board-game-filler
        (declare (salience ?*sub-normal-priority*))
        
        
                (result (feature filler) (value T))
                (not (result (feature party) (value T)))
                (not (result (feature family) (value T)))
(or   
                (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature 6players+) (value ?players6+))
                (result (feature coop-comp) (value ?coop-comp))

                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature wtdplacement) (value ?wtdplacement))
                (result (feature hmovement) (value ?hmovement))
                (result (feature investigative) (value ?investigative))
                (result (feature bidding) (value ?bidding))
                (result (feature bluff) (value ?bluff))
)     



 (or     (result (feature greece) (value ?greece))
                (result (feature abstract) (value ?abstract))
                (result (feature lovecraft) (value ?lovecraft))
                (result (feature gothic) (value ?gothic))
                (result (feature merchants) (value ?merchants))
                (result (feature survival) (value ?survival))
                (result (feature indians) (value ?indians))
                (result (feature fantasy) (value ?fantasy))
                (result (feature castles) (value ?castles))
                (result (feature futuristic) (value ?futuristic))
                (result (feature jewelry) (value ?jewelry))
                (result (feature lord-of-the-rings) (value ?lord-of-the-rings))
                (result (feature crime) (value ?crime))
)

    


        (general-kind (label ?label) (filler T) (party F) (family F))
        (players (label ?label) (1players  ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+))
        (main-features (label ?label) (age ?age) (coop-comp ?coop-comp))
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging) (wtdplacement ?wtdplacement) (hmovement ?hmovement) (investigative ?investigative) (bidding ?bidding) (bluff ?bluff))
        (thematic-environment (label ?label) (greece ?greece) (lovecraft ?lovecraft) (gothic ?gothic) (merchants ?merchants) (survival ?survival) (indians ?indians) (fantasy ?fantasy) 
                (castles ?castles)(futuristic ?futuristic) (jewelry ?jewelry)  (lord-of-the-rings ?lord-of-the-rings) (crime ?crime))
        (user-age (min-age ?min))
        (test (>=  ?min ?age))
        
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler:  " ?label" (what board-game-filler) "  crlf)
            (printout t crlf " ->  Final board-game-filler:  " ?label "  players " ?players3   crlf))
        
)
(defrule find-hypotetical-final-board-game-party
        (declare (salience ?*sub-normal-priority*))
        
        
                (not (result (feature filler) (value T)))
                (result (feature party) (value T))
                (not (result (feature family) (value T)))
        
        (or    
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature 6players+) (value ?players6+))
                (result (feature coop-comp) (value ?coop-comp))

                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))
        )

        (or
                (result (feature witchcraft) (value ?witchcraft))
                (result (feature horror) (value ?horror))
                (result (feature fireworks) (value ?fireworks))
                (result (feature western) (value ?western))
                (result (feature pirates) (value ?pirates))
                (result (feature tale) (value ?tale))
                (result (feature fantasy) (value ?fantasy))
                (result (feature mafia) (value ?mafia))

        )


        (general-kind (label ?label) (party T))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+))
        (main-features (label ?label) (age ?age) (length ?length) (coop-comp ?coop-comp))
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging) (investigative ?investigative)(bluff ?bluff))
        (thematic-environment (label ?label) (witchcraft ?witchcraft) (horror ?horror) (fireworks ?fireworks) (western ?western) (pirates ?pirates) (tale ?tale) (fantasy ?fantasy) (mafia ?mafia))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-party)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-party:  " ?label " " ?board-game-name "  "  crlf))
        
)
(defrule find-hypotetical-final-board-game-family
        (declare (salience ?*sub-normal-priority*))
        
        
                (not (result (feature filler) (value T)))
                (not (result (feature party) (value T)))
                (result (feature family) (value T))
        
        (or     (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature 6players+) (value ?players6+))
                (result (feature coop-comp) (value ?coop-comp))
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature wtdplacement) (value ?wtdplacement))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))
        )

         (or    (result (feature greece) (value ?greece))
                (result (feature western) (value ?western))
                (result (feature tailoring) (value ?tailoring))
                (result (feature abstract) (value ?abstract))
                (result (feature numbers) (value ?numbers))
                (result (feature trains) (value ?trains))
                (result (feature oriental) (value ?oriental))
                (result (feature glass) (value ?glass))
        )

        (general-kind (label ?label) (family T))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (1players  ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+))
        (main-features (label ?label) (age ?age) (length ?length) (coop-comp ?coop-comp))
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging) (wtdplacement ?wtdplacement) (investigative ?investigative) (bluff ?bluff))
        (thematic-environment (label ?label) (greece ?greece) (western ?western) (tailoring ?tailoring) (abstract ?abstract) (numbers ?numbers) (trains ?trains) (oriental ?oriental) (glass ?glass))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler-and-party-and-family)))
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
                (result (feature roman ) (value ?roman))
                
        )
        (general-kind (label ?label) (wargame ?wargame))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) )
        (main-features (label ?label) (age ?age) (length ?length))
        (thematic-environment (label ?label) (roman ?roman))
        (user-age (min-age ?min)) 
        (game-time (time ?time))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
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
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature explorative) (value ?explorative))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))
        )

        (or
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature explorative) (value ?explorative))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))

        )
        (or     
              
                (result (feature lovecraft) (value ?lovecraft))
                (result (feature gothic) (value ?gothic))
                (result (feature abstract) (value ?abstract))
                (result (feature forests) (value ?forests))
                (result (feature fantasy) (value ?fantasy))
                (result (feature lord-of-the-rings) (value ?lord-of-the-rings))
        )
        (general-kind (label ?label) (cardgame ?cardgame))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (1players ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) )
        (main-features (label ?label) (age ?age) (length ?length) (coop-comp ?coop-comp))
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging) (explorative ?explorative) (investigative ?investigative) (bluff ?bluff)) 
        (thematic-environment (label ?label) (abstract ?abstract) (lovecraft ?lovecraft) (gothic ?gothic)  (forests ?forests) (fantasy ?fantasy) (lord-of-the-rings ?lord-of-the-rings))
        (game-time (time ?time))
        (user-age (min-age ?min)) 
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-cardgame)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-cardgame:  " ?label " " ?board-game-name "  "  crlf))
        
)



(defrule find-hypotetical-final-board-game-american
        (declare (salience ?*sub-normal-priority*))
        (result (feature american) (value T))
        
       

        (or     
                (result (feature 1players) (value ?players1))
                (result (feature 2players) (value ?players2))
                (result (feature 3players) (value ?players3))
                (result (feature 4players) (value ?players4))
                (result (feature 5players) (value ?players5))
                (result (feature 6players) (value ?players6))
                (result (feature +6players) (value ?players6+))
                (result (feature coop-comp) (value ?coop-comp))
                (result (feature weight) (value ?weight))
                
        )

        (or     (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature explorative) (value ?explorative))
                (result (feature hmovement) (value ?hmovement))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))
        )

        (or 
                (result (feature war) (value ?war))
                (result (feature lovecraft) (value ?lovecraft))
                (result (feature gothic) (value ?gothic))
                (result (feature vampyric) (value ?vampyric))
                (result (feature pirates) (value ?pirates))
                (result (feature indians) (value ?indians))
                (result (feature western) (value ?western))
                (result (feature crime) (value ?crime))
                (result (feature survival) (value ?survival))
                (result (feature tale) (value ?tale))
                (result (feature fantasy) (value ?fantasy))
                (result (feature lord-of-the-rings) (value ?lord-of-the-rings))
        )

        (general-kind (label ?label) (american T))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (1players ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+) )
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging) (explorative ?explorative) (hmovement ?hmovement) (investigative ?investigative) (bluff ?bluff))
        (thematic-environment (label ?label) (war ?war) (lovecraft ?lovecraft) (gothic ?gothic)  (vampyric ?vampyric) (pirates ?pirates) (indians ?indians) (western ?western) (crime ?crime) (survival ?survival) (tale ?tale) (fantasy ?fantasy) (lord-of-the-rings ?lord-of-the-rings))
        (main-features (label ?label) (age ?age) (length ?length) (weight ?weight) (coop-comp ?coop-comp))
        (user-age (min-age ?min)) 
        (test (>=  ?min ?age))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-american)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-american:  " ?label " " ?board-game-name " (what find-hypotetical-game-american) "  crlf))
        
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
        (or     (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature wtdplacement) (value ?wtdplacement))
                (result (feature bidding) (value ?bidding))
        )

        (or   
                (result (feature farms) (value ?farms))
                (result (feature industry) (value ?industry))
                (result (feature merchants) (value ?merchants))
                (result (feature greece) (value ?greece))
                (result (feature castles) (value ?castles))
                (result (feature war) (value ?war))
                (result (feature fantasy) (value ?fantasy))
                (result (feature castles) (value ?castles))
                (result (feature gothic) (value ?gothic))
                (result (feature chemistry) (value ?chemistry))
                (result (feature gala-hotel) (value ?gala-hotel))
                (result (feature indians) (value ?indians))
                (result (feature lovecraft) (value ?lovecraft))
                (result (feature restaurants) (value ?restaurants))
                (result (feature trains) (value ?trains))   
        )

        (general-kind (label ?label) (german ?german))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (1players ?players1) (2players ?players2) (3players ?players3) (4players ?players4) (5players ?players5) (6players ?players6) (6players+ ?players6+) )
        (secondary-kind  (label ?label) (thematic ?thematic) (strategy ?strategy) (wtdplacement ?wtdplacement) (bidding ?bidding))
        (thematic-environment (label ?label) (farms ?farms) (merchants ?merchants) (greece ?greece) (castles ?castles) (war ?war) (fantasy ?fantasy) (gothic ?gothic) 
                (chemistry ?chemistry) (gala-hotel ?gala-hotel) (indians ?indians) (lovecraft ?lovecraft) (restaurants ?restaurants) (trains ?trains)) 
        (main-features (label ?label) (age ?age) (length ?length))
        (user-age (min-age ?min))
        (game-time (time ?time)) 
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
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