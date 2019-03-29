
(defrule find-hypotetical-final-board-game-filler-and-party-and-family-1players
        (declare (salience ?*sub-normal-priority*))
        
        
                (result (feature filler) (value T))
                (result (feature party) (value T))
                (result (feature family) (value T))
                (result (feature 1players) (value T))
                (game-players (player ?player))
        
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
        


        (general-kind (label ?label) (filler T) (party T) (family T))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (player $?players))
        (main-features (label ?label) (age ?age))
        (secondary-kind (label ?label) (thematic ?thematic) (challenging ?challenging) (investigative ?investigative) (bluff ?bluff))
        (thematic-environment (label ?label) (castles ?castles) (renaissance-court ?renaissance-court) (tale ?tale) (fantasy ?fantasy) (futuristic ?futuristic) (politics ?politics))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test  (member$ ?player $?players))
        (test (>=  ?min ?age))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler-and-party-and-family-1players)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler-and-party-and-family-1players:  " ?label " " ?board-game-name " (what board-game-filler-and-party-and-family-1players)"  crlf))
        
)




(defrule find-hypotetical-final-board-game-filler-and-party-and-family
        (declare (salience ?*sub-normal-priority*))
        
        
                (result (feature filler) (value T))
                (result (feature party) (value T))
                (result (feature family) (value T))
        
                (game-players (player ?player))
                (not (result (feature 1players) (value T)))
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
        


        (general-kind (label ?label) (filler T) (party T) (family T))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (player $?players))
        (main-features (label ?label) (age ?age) (coop-comp ?coop-comp))
        (secondary-kind (label ?label) (thematic ?thematic) (challenging ?challenging) (investigative ?investigative) (bluff ?bluff))
        (thematic-environment (label ?label) (castles ?castles) (renaissance-court ?renaissance-court) (tale ?tale) (fantasy ?fantasy) (futuristic ?futuristic) (politics ?politics))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test  (member$ ?player $?players))
        (test (>=  ?min ?age))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler-and-party-and-family)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler-and-party-and-family:  " ?label " " ?board-game-name "  "  crlf))
        
)

(defrule find-hypotetical-final-board-game-filler-and-family-1players
        (declare (salience ?*sub-normal-priority*))
        
        
                (result (feature filler) (value T))
                (result (feature family) (value T))
                (not (result (feature party) (value T)))
                (result (feature 1players) (value T))
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
            
                (game-players (player ?player))

        (general-kind (label ?label) (filler T) (party F) (family T))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (player  $?players))
        (main-features (label ?label) (age ?age) (length ?length))
        (secondary-kind (label ?label) (thematic ?thematic) (challenging ?challenging) (investigative ?investigative) (bluff ?bluff))
        (thematic-environment (label ?label) (castles ?castles) (renaissance-court ?renaissance-court) (tale ?tale) (fantasy ?fantasy) (futuristic ?futuristic) (politics ?politics))
        (test  (member$ ?player $?players))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler-and-family)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler-and-family:  " ?label " " ?board-game-name "  (what board-game-filler-and-family-1players)"  crlf))
        
)

(defrule find-hypotetical-final-board-game-filler-and-family
        (declare (salience ?*sub-normal-priority*))
        
        
                (result (feature filler) (value T))
                (result (feature family) (value T))
                (not (result (feature party) (value T)))
                (not (result (feature 1players) (value T)))
                (result (feature coop-comp) (value ?coop-comp))

                (result (feature thematic) (value ?thematic))
                
                (result (feature wtdplacement) (value ?wtdplacement))
              
               

                (result (feature gothic) (value ?gothic))
                (result (feature lovecraft) (value ?lovecraft))
                (result (feature castles) (value ?castles))
                (result (feature farms) (value ?farms))
                (result (feature indians) (value ?indians))
      
      
            
                (game-players (player ?player))

        (general-kind (label ?label) (filler T) (party F) (family T))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (player  $?players))
        (main-features (label ?label) (age ?age) (length ?length) (coop-comp ?coop-comp))
        (secondary-kind (label ?label) (thematic ?thematic) (wtdplacement ?wtdplacement))
        (thematic-environment (label ?label) (castles ?castles)  (lovecraft ?lovecraft) (gothic ?gothic) (farms ?farms) (indians ?indians))
        (test  (member$ ?player $?players))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler-and-family)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler-and-family:  " ?label " " ?board-game-name "  (what board-game-filler-and-family) "  crlf))
        
)

(defrule find-hypotetical-final-board-game-filler-1players
        (declare (salience ?*sub-normal-priority*))
        (result (feature filler) (value T))
        (not (result (feature party) (value T)))
        (not (result (feature family) (value T)))
                 
                (result (feature 1players) (value T))
                (result (feature weight) (value ?weight))
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
          
                (result (feature hmovement) (value ?hmovement))
                (result (feature investigative) (value ?investigative))
                (result (feature bidding) (value ?bidding))
                (result (feature bluff) (value ?bluff))
            

                (result (feature greece) (value ?greece))
                (result (feature abstract) (value ?abstract))
                (result (feature lovecraft) (value ?lovecraft))
                (result (feature gothic) (value ?gothic))
                (result (feature merchants) (value ?merchants))
                (result (feature horror) (value ?horror))
                
                (result (feature indians) (value ?indians))
                (result (feature fantasy) (value ?fantasy))
                (result (feature castles) (value ?castles))
                (result (feature futuristic) (value ?futuristic))
                (result (feature jewelry) (value ?jewelry))
                (result (feature lord-of-the-rings) (value ?lord-of-the-rings))
                (result (feature crime) (value ?crime))
                (game-players (player ?player))
        
        (general-kind (label ?label) (filler T) (party F) (family F))
        
        (main-features (label ?label) (weight ?weight) (age ?age))
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging)  (hmovement ?hmovement) (investigative ?investigative) (bidding ?bidding) (bluff ?bluff))
        (thematic-environment (label ?label) (greece ?greece) (horror ?horror) (lovecraft ?lovecraft) (gothic ?gothic) (merchants ?merchants) (indians ?indians) (fantasy ?fantasy) 
                (castles ?castles)(futuristic ?futuristic) (jewelry ?jewelry)  (lord-of-the-rings ?lord-of-the-rings) (crime ?crime))
        (players (label ?label) (player  $?players))
        (test  (member$ ?player $?players))
        (user-age (min-age ?min))
        (test (>=  ?min ?age))

        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler:  " ?label" (what board-game-filler-1players) "  crlf))
        
)

(defrule find-hypotetical-final-board-game-filler
        (declare (salience ?*sub-normal-priority*))
        (result (feature filler) (value T))
        (not (result (feature party) (value T)))
        (not (result (feature family) (value T)))
                 
                (not (result (feature 1players) (value T)))
                (result (feature coop-comp) (value ?coop-comp))
                (result (feature weight) (value ?weight))
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
              
                (result (feature hmovement) (value ?hmovement))
                (result (feature investigative) (value ?investigative))
                (result (feature bidding) (value ?bidding))
                (result (feature bluff) (value ?bluff))
            

                (result (feature greece) (value ?greece))
                (result (feature abstract) (value ?abstract))
                (result (feature lovecraft) (value ?lovecraft))
                (result (feature gothic) (value ?gothic))
                (result (feature merchants) (value ?merchants))
                (result (feature horror) (value ?horror))
                (result (feature indians) (value ?indians))
                (result (feature fantasy) (value ?fantasy))
                (result (feature castles) (value ?castles))
                (result (feature futuristic) (value ?futuristic))
                (result (feature jewelry) (value ?jewelry))
                (result (feature lord-of-the-rings) (value ?lord-of-the-rings))
                (result (feature crime) (value ?crime))
                (game-players (player ?player))
        
        (general-kind (label ?label) (filler T) (party F) (family F))
        
        (main-features (label ?label) (weight ?weight) (age ?age) (coop-comp ?coop-comp))
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging)  (hmovement ?hmovement) (investigative ?investigative) (bidding ?bidding) (bluff ?bluff))
        (thematic-environment (label ?label) (greece ?greece) (horror ?horror) (lovecraft ?lovecraft) (gothic ?gothic) (merchants ?merchants) (survival ?survival) (indians ?indians) (fantasy ?fantasy) 
                (castles ?castles)(futuristic ?futuristic) (jewelry ?jewelry)  (lord-of-the-rings ?lord-of-the-rings) (crime ?crime))
        (players (label ?label) (player  $?players))
        (test  (member$ ?player $?players))
        (user-age (min-age ?min))
        (test (>=  ?min ?age))

        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler:  " ?label" (what board-game-filler) "  crlf))
        
)


(defrule find-hypotetical-final-board-game-party
        (declare (salience ?*sub-normal-priority*))
        
        (not (result (feature 1players) (value T)))
        (not (result (feature filler) (value T)))
        (result (feature party) (value T))
        (not (result (feature family) (value T)))        
        (result (feature coop-comp) (value ?coop-comp))
        (result (feature thematic) (value ?thematic))
        (result (feature strategy) (value ?strategy))
        (result (feature challenging) (value ?challenging))
        (result (feature investigative) (value ?investigative))
        (result (feature bluff) (value ?bluff))
        (result (feature witchcraft) (value ?witchcraft))
        (result (feature horror) (value ?horror))
        (result (feature western) (value ?western))
        (result (feature pirates) (value ?pirates))
        (result (feature tale) (value ?tale))
        (result (feature fantasy) (value ?fantasy))
        (result (feature mafia) (value ?mafia))
        (game-players (player ?player))
        


        (general-kind (label ?label) (party T))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (player $?players))
        (main-features (label ?label) (age ?age) (length ?length) (coop-comp ?coop-comp))
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging) (investigative ?investigative)(bluff ?bluff))
        (thematic-environment (label ?label) (witchcraft ?witchcraft) (horror ?horror) (western ?western) (pirates ?pirates) (tale ?tale) (fantasy ?fantasy) (mafia ?mafia))
        (test  (member$ ?player $?players))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-party)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-party:  " ?label " " ?board-game-name "  (what board-game-party)"  crlf))
        
)

(defrule find-hypotetical-final-board-game-family-1players
        (declare (salience ?*sub-normal-priority*))
        
        
                (not (result (feature filler) (value T)))
                (not (result (feature party) (value T)))
                (result (feature family) (value T))
                (result (feature 1players) (value T))
              
                (result (feature 6players+) (value ?players6+))
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature wtdplacement) (value ?wtdplacement))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))
                (result (feature greece) (value ?greece))
                (result (feature western) (value ?western))
                (result (feature tailoring) (value ?tailoring))
                (result (feature abstract) (value ?abstract))
                (result (feature numbers) (value ?numbers))
                (result (feature trains) (value ?trains))
                (result (feature oriental) (value ?oriental))
                (result (feature glass) (value ?glass))
                (game-players (player ?player))
        

        (general-kind (label ?label) (family T))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (player  $?players))
        (main-features (label ?label) (age ?age) (length ?length) )
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging) (wtdplacement ?wtdplacement) (investigative ?investigative) (bluff ?bluff))
        (thematic-environment (label ?label) (greece ?greece) (western ?western) (tailoring ?tailoring) (abstract ?abstract) (numbers ?numbers) (trains ?trains) (oriental ?oriental) (glass ?glass))
        (test  (member$ ?player $?players))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler-and-party-and-family)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler-or-party-or-family:  " ?label " " ?board-game-name "  "  crlf))
        
)


(defrule find-hypotetical-final-board-game-family
        (declare (salience ?*sub-normal-priority*))
        
        
                (not (result (feature filler) (value T)))
                (not (result (feature party) (value T)))
                (result (feature family) (value T))
                (not (result (feature 1players) (value T)))
              
                (result (feature 6players+) (value ?players6+))
                (result (feature coop-comp) (value ?coop-comp))
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature wtdplacement) (value ?wtdplacement))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))
                (result (feature greece) (value ?greece))
                (result (feature western) (value ?western))
                (result (feature tailoring) (value ?tailoring))
                (result (feature abstract) (value ?abstract))
                (result (feature numbers) (value ?numbers))
                (result (feature trains) (value ?trains))
                (result (feature oriental) (value ?oriental))
                (result (feature glass) (value ?glass))
                (game-players (player ?player))
        

        (general-kind (label ?label) (family T))
        (board-game (label ?label) (board-game-name ?board-game-name) )
        (players (label ?label) (player  $?players))
        (main-features (label ?label) (age ?age) (length ?length) (coop-comp ?coop-comp))
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging) (wtdplacement ?wtdplacement) (investigative ?investigative) (bluff ?bluff))
        (thematic-environment (label ?label) (greece ?greece) (western ?western) (tailoring ?tailoring) (abstract ?abstract) (numbers ?numbers) (trains ?trains) (oriental ?oriental) (glass ?glass))
        (test  (member$ ?player $?players))
        (user-age (min-age ?min))
        (game-time (time ?time))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-filler-and-party-and-family)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-filler-or-party-or-family:  " ?label " " ?board-game-name "  "  crlf))
        
)

(defrule find-hypotetical-final-board-game-wargame-1players
        (declare (salience ?*sub-normal-priority*))
        (result (feature wargame) (value T))
        (result (feature roman ) (value ?roman))
        (game-players (player ?player))     
        (result (feature 1players) (value T))
        (general-kind (label ?label) (wargame T))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (player $?players))
        (main-features (label ?label) (age ?age) (length ?length))
        (thematic-environment (label ?label) (roman ?roman))
        
        (user-age (min-age ?min)) 
        (game-time (time ?time))
        (test  (member$ ?player $?players))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-wargame-1players)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-wargame:  " ?label " " ?board-game-name "  (what board-game-wargame-1players)"  crlf))
        
)


(defrule find-hypotetical-final-board-game-wargame
        (declare (salience ?*sub-normal-priority*))
        (result (feature wargame) (value T))
        (result (feature roman ) (value ?roman))
        (game-players (player ?player))     
        (not (result (feature 1players) (value T)))
        (general-kind (label ?label) (wargame T))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (player $?players))
        (main-features (label ?label) (age ?age) (length ?length))
        (thematic-environment (label ?label) (roman ?roman))
        
        (user-age (min-age ?min)) 
        (game-time (time ?time))
        (test  (member$ ?player $?players))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what board-game-wargame)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-wargame:  " ?label " " ?board-game-name "  (what board-game-wargame)"  crlf))
        
)

(defrule find-hypotetical-final-board-game-cardgame-1players
        (declare (salience ?*sub-normal-priority*))
        (result (feature cardgame) (value T))
        

         
        
                (result (feature coop-comp) (value ?coop-comp))
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature explorative) (value ?explorative))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))
                (result (feature 1players) (value T))
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature explorative) (value ?explorative))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))

        

                (result (feature lovecraft) (value ?lovecraft))
                (result (feature gothic) (value ?gothic))
                (result (feature abstract) (value ?abstract))
                (result (feature forests) (value ?forests))
                (result (feature fantasy) (value ?fantasy))
                (result (feature lord-of-the-rings) (value ?lord-of-the-rings))
                (game-players (player ?player))
        
        (general-kind (label ?label) (cardgame T))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (player $?players))
        (main-features (label ?label) (age ?age) (length ?length))
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging) (explorative ?explorative) (investigative ?investigative) (bluff ?bluff)) 
        (thematic-environment (label ?label) (abstract ?abstract) (lovecraft ?lovecraft) (gothic ?gothic)  (forests ?forests) (fantasy ?fantasy) (lord-of-the-rings ?lord-of-the-rings))
        (game-time (time ?time))
        (user-age (min-age ?min)) 
        (test  (member$ ?player $?players))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-cardgame-1players)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-cardgame:  " ?label " " ?board-game-name "  (what find-hypotetical-game-cardgame-1players)"  crlf))
        
)


(defrule find-hypotetical-final-board-game-cardgame
        (declare (salience ?*sub-normal-priority*))
        (result (feature cardgame) (value T))
        (not(result (feature 1players) (value T)))

         
        
                (result (feature coop-comp) (value ?coop-comp))
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature explorative) (value ?explorative))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))
        
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature explorative) (value ?explorative))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))

        

                (result (feature lovecraft) (value ?lovecraft))
                (result (feature gothic) (value ?gothic))
                (result (feature abstract) (value ?abstract))
                (result (feature forests) (value ?forests))
                (result (feature fantasy) (value ?fantasy))
                (result (feature lord-of-the-rings) (value ?lord-of-the-rings))
                (game-players (player ?player))
        
        (general-kind (label ?label) (cardgame T))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (player $?players))
        (main-features (label ?label) (age ?age) (length ?length) (coop-comp ?coop-comp))
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging) (explorative ?explorative) (investigative ?investigative) (bluff ?bluff)) 
        (thematic-environment (label ?label) (abstract ?abstract) (lovecraft ?lovecraft) (gothic ?gothic)  (forests ?forests) (fantasy ?fantasy) (lord-of-the-rings ?lord-of-the-rings))
        (game-time (time ?time))
        (user-age (min-age ?min)) 
        (test  (member$ ?player $?players))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-cardgame)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-cardgame:  " ?label " " ?board-game-name "  "  crlf))
        
)

(defrule find-hypotetical-final-board-game-american-1players
        (declare (salience ?*sub-normal-priority*))
        (result (feature american) (value T))
        
       

                (result (feature weight) (value ?weight))
                (result (feature 1players) (value T))
        
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature explorative) (value ?explorative))
                (result (feature hmovement) (value ?hmovement))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))
        
                (result (feature war) (value ?war))
                (result (feature lovecraft) (value ?lovecraft))
                (result (feature gothic) (value ?gothic))
                (result (feature vampyric) (value ?vampyric))
                (result (feature pirates) (value ?pirates))
                (result (feature futuristic) (value ?futuristic))
                (result (feature indians) (value ?indians))
                (result (feature western) (value ?western))
                (result (feature crime) (value ?crime))
                (result (feature survival) (value ?survival))
                (result (feature tale) (value ?tale))
                (result (feature fantasy) (value ?fantasy))
                (result (feature lord-of-the-rings) (value ?lord-of-the-rings))
                (game-players (player ?player))
        

        (general-kind (label ?label) (american T))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (player $?players) )
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging) (explorative ?explorative) (hmovement ?hmovement) (investigative ?investigative) (bluff ?bluff))
        (thematic-environment (label ?label) (war ?war) (lovecraft ?lovecraft) (gothic ?gothic)  (vampyric ?vampyric) (pirates ?pirates) (futuristic ?futuristic) (western ?western) (indians ?indians) (crime ?crime) (survival ?survival) (tale ?tale) (fantasy ?fantasy) (lord-of-the-rings ?lord-of-the-rings))
        (main-features (label ?label) (age ?age) (length ?length) (weight ?weight))
        (test  (member$ ?player $?players))
        (user-age (min-age ?min)) 
        (test (>=  ?min ?age))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-american)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-american:  " ?label " " ?board-game-name " (what find-hypotetical-game-american) "  crlf))
        
)

(defrule find-hypotetical-final-board-game-american
        (declare (salience ?*sub-normal-priority*))
        (result (feature american) (value T))
        (not(result (feature 1players) (value T)))
       

            
           
                (result (feature coop-comp) (value ?coop-comp))
                (result (feature weight) (value ?weight))
                
        

                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature challenging) (value ?challenging))
                (result (feature explorative) (value ?explorative))
                (result (feature hmovement) (value ?hmovement))
                (result (feature investigative) (value ?investigative))
                (result (feature bluff) (value ?bluff))
        

        
                (result (feature war) (value ?war))
                (result (feature lovecraft) (value ?lovecraft))
                (result (feature gothic) (value ?gothic))
                (result (feature vampyric) (value ?vampyric))
                (result (feature pirates) (value ?pirates))
                (result (feature futuristic) (value ?futuristic))
                (result (feature indians) (value ?indians))
                (result (feature western) (value ?western))
                (result (feature crime) (value ?crime))
                (result (feature survival) (value ?survival))
                (result (feature tale) (value ?tale))
                (result (feature fantasy) (value ?fantasy))
                (result (feature lord-of-the-rings) (value ?lord-of-the-rings))
                (game-players (player ?player))
        

        
        
        
        (thematic-environment (label ?label) (war ?war) (lovecraft ?lovecraft) (gothic ?gothic)  (vampyric ?vampyric) (pirates ?pirates) (futuristic ?futuristic) (western ?western) (indians ?indians) (crime ?crime) (survival ?survival) (tale ?tale) (fantasy ?fantasy) (lord-of-the-rings ?lord-of-the-rings))
        (secondary-kind (label ?label) (thematic ?thematic) (strategy ?strategy) (challenging ?challenging) (explorative ?explorative) (hmovement ?hmovement) (investigative ?investigative) (bluff ?bluff))
        (main-features (label ?label) (age ?age) (weight ?weight) (coop-comp ?coop-comp))
        (general-kind (label ?label) (american T))
        (board-game (label ?label) (board-game-name ?board-game-name))

        (players (label ?label) (player $?players) )
        (test  (member$ ?player $?players))
        (user-age (min-age ?min)) 
        (test (>=  ?min ?age))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-american)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-american:  " ?label " " ?board-game-name " (what find-hypotetical-game-american) "  crlf)
        (printout t crlf ?board-game-name ?war ?lovecraft ?gothic ?vampyric ?pirates ?futuristic ?western ?indians ?crime ?survival ?tale ?fantasy ?lord-of-the-rings  " " crlf))
)


(defrule find-hypotetical-final-board-game-german-1players
        (declare (salience ?*sub-normal-priority*))
        (result (feature german) (value T))
        (result (feature 1players) (value T))  
            
                
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature wtdplacement) (value ?wtdplacement))
                (result (feature bidding) (value ?bidding))
    
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
                (result (feature indians) (value ?indians))
                (result (feature lovecraft) (value ?lovecraft))
                (result (feature restaurants) (value ?restaurants))   
                (game-players (player ?player))

        (general-kind (label ?label) (german T))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (player $?players))
        (secondary-kind  (label ?label) (thematic ?thematic) (strategy ?strategy) (wtdplacement ?wtdplacement) (bidding ?bidding))
        (thematic-environment (label ?label) (farms ?farms) (merchants ?merchants) (greece ?greece) (castles ?castles) (war ?war) (fantasy ?fantasy) (gothic ?gothic) 
                (chemistry ?chemistry) (gala-hotel ?gala-hotel) (indians ?indians) (lovecraft ?lovecraft) (restaurants ?restaurants) (trains ?trains)) 
        (main-features (label ?label) (age ?age) (length ?length))
        (user-age (min-age ?min))
        (game-time (time ?time)) 
        (test  (member$ ?player $?players))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-german-1players)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-german:  " ?label " " ?board-game-name "  (what find-hypotetical-game-german-1players)"  crlf))

)

(defrule find-hypotetical-final-board-game-german
        (declare (salience ?*sub-normal-priority*))
        (result (feature german) (value T))
        (not(result (feature 1players) (value T)))  
            
                
                (result (feature thematic) (value ?thematic))
                (result (feature strategy) (value ?strategy))
                (result (feature wtdplacement) (value ?wtdplacement))
                (result (feature bidding) (value ?bidding))
    
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
                (result (feature indians) (value ?indians))
                (result (feature lovecraft) (value ?lovecraft))
                (result (feature restaurants) (value ?restaurants))   
                (game-players (player ?player))

        (general-kind (label ?label) (german T))
        (board-game (label ?label) (board-game-name ?board-game-name))
        (players (label ?label) (player $?players))
        (secondary-kind  (label ?label) (thematic ?thematic) (strategy ?strategy) (wtdplacement ?wtdplacement) (bidding ?bidding))
        (thematic-environment (label ?label) (farms ?farms) (merchants ?merchants) (greece ?greece) (castles ?castles) (war ?war) (fantasy ?fantasy) (gothic ?gothic) 
                (chemistry ?chemistry) (gala-hotel ?gala-hotel) (indians ?indians) (lovecraft ?lovecraft) (restaurants ?restaurants) (trains ?trains)) 
        (main-features (label ?label) (age ?age) (length ?length))
        (user-age (min-age ?min))
        (game-time (time ?time)) 
        (test  (member$ ?player $?players))
        (test (>=  ?min ?age))
        (test (>= ?length ?time))
        =>
        (assert (hypotetical-final-board-game (label ?label) (what find-hypotetical-game-german)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " ->  Final board-game-german:  " ?label " " ?board-game-name "  "  crlf))
        
)
