;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;       REGOLE PER LA FORMULAZIONE DELLE DOMANDE        ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                     SEZIONE UTENTE                    ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule ask-question
        (declare (salience ?*highest-priority*))
        ?f1 <- (asking-question (question ?question) (answers $?answers))
        ?f2 <- (last-question (question ?last))
        ?f3 <- (asked-questions (question $?asked))
        (test (not (member$ ?question ?asked)))
        =>
        (retract ?f1)
        (modify ?f2 (question (+ ?last 1)))
        (modify ?f3 (question ?asked ?question))
        (ask ?question (+ ?last 1) ?answers)
)

(defrule not-ask-already-asked-question
        (declare (salience ?*highest-priority*))
        ?f1 <- (asking-question (question ?question) (answers $?answers))
        (asked-questions (question $?asked))
        (test (member$ ?question ?asked))
        =>
        (retract ?f1)
)

;;====================================================;;

(defrule ask-user-age           
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-players) (value "1"))
        =>
        (assert (asking-question (question user-age) (answers 1 2 3 4 5 6 7 8)))
)

(defrule ask-group-age 
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-players) (value "2" | "3" | "4" | "5" | "6" |"6+"))
        =>
        (assert (asking-question (question group-age) (answers 1 2 3 4 5 6 7 8)))
)



(defrule ask-user-experience
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-players) (value "1"))
        (info (feature user-age))
        (not(inferred (feature age) (value child))) 
        =>
        (assert (asking-question (question user-experience) (answers 1 2 3 4)))
)

(defrule ask-group-experience
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-players) (value "2" | "3" | "4" | "5" | "6" | "6+" ))
        (info (feature group-age))
        (not(inferred (feature age) (value child)))        
        =>
        (assert (asking-question (question group-experience) (answers 1 2 3 4)))

)

(defrule ask-user-budget        
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question user-budget) (answers 1 2 3 4 5 6)))
)

(defrule ask-user-gift  
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question user-gift) (answers s n)))
)

(defrule ask-game-players
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        =>
        (assert (asking-question (question game-players) (answers 1 2 3 4 5 6 7))))


(defrule ask-game-time
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        =>
        (assert (asking-question (question game-time) (answers 1 2 ))))


(defrule ask-game-family
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (inferred (feature weight) (value difficile)))
        (not (info (feature game-wargame) (value "yes"))) 
        (not (info (feature game-cardgame) (value "yes")))
        (not (info (feature game-players) (value "1")))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"| "45<65"))
        (info (feature game-time) (value "<60"))
        =>
        (assert (asking-question (question game-family) (answers s n)))
)

(defrule ask-game-cardgame
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-family) (value "no"))
        (info (feature game-wargame) (value "no"))
        (info (feature game-filler) (value "no"))
        (not (info (feature game-players) (value "6" |"6+")))
        (inferred (feature weight) (value leggero | medio))
                  
        =>
        (assert (asking-question (question game-cardgame) (answers s n)))

)


(defrule ask-game-wargame
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))  
        (info (feature game-family) (value "no"))
        (info (feature game-cardgame) (value "no"))
        (info (feature game-filler) (value "no"))
        (not(info (feature game-players) (value "1")))
        (info (feature game-time) (value ">60"))
        (info (feature game-players) (value "2" | "3" | "4" | "5" | "6"))
       
        =>
        (assert (asking-question (question game-wargame) (answers s n)))
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule ask-game-comp
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not(info (feature game-players) (value "1")))
        (info (feature user-gift) (value "no"))
        (not(inferred (feature wargame) (value T)))
        =>
        (assert (asking-question (question game-comp) (answers s n)))
)


(defrule ask-game-coop
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not(info (feature game-players) (value "1")))
        (info (feature user-gift) (value "no"))
        (not(inferred (feature wargame) (value T)))
        =>
        (assert (asking-question (question game-coop) (answers s n)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule ask-game-thematic
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not(info (feature game-wargame) (value "yes")))
        =>
        (assert (asking-question (question game-thematic) (answers s n)))
)




(defrule ask-game-strategy
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature game-investigative) (value "yes")))
        (not (info (feature game-hmovement) (value "yes")))
        =>
        (assert (asking-question (question game-strategy) (answers s n)))
)

(defrule ask-game-challenging
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (inferred (feature wargame) (value T)))
        (not (info (feature game-bidding) (value "yes")))
        (not (info (feature game-wtdplacement) (value "yes")))
        (not (info (feature game-hmovement) (value "yes")))
        (not (info (feature game-bluff) (value "yes")))
        =>
        (assert (asking-question (question game-challenging) (answers s n)))
)

(defrule ask-game-explorative
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (not (info (feature game-wtdplacement) (value "yes")))
        (not (info (feature game-bidding) (value "yes")))
        (not (info (feature game-hmovement) (value "yes")))
        (not (info (feature game-bluff) (value "yes")))
        (not(info (feature game-bidding) (value "yes")))
        (info (feature user-gift) (value "no"))
        (info (feature game-thematic) (value "yes"))  
        =>
        (assert (asking-question (question game-explorative) (answers s n)))
)



(defrule ask-game-wtdplacement
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature game-hmovement) (value "yes")))
        (not (info (feature game-investigative) (value "yes")))
        (not (info (feature game-challenging) (value "yes")))
        (not (info (feature game-bluff) (value "yes")))
        (not (info (feature game-thematic) (value "yes")))
        =>
        (assert (asking-question (question game-wtdplacement) (answers s n)))
)


(defrule ask-game-hmvoment
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (not(info (feature game-explorative) (value "yes")))
        (not (info (feature game-strategy) (value "yes")))
        (not (info (feature game-bidding) (value "yes")))
        =>
        (assert (asking-question (question game-hmovement) (answers s n)))
)


(defrule ask-game-investigative
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not(inferred (feature wargame) (value T)))
        (info (feature game-thematic) (value "T"))
        (not (inferred (feature game-strategy) (value T)))
        (not (inferred (feature game-wtdplacement) (value T)))
        (not (inferred (feature game-bidding) (value T)))
        =>
        (assert (asking-question (question game-investigative) (answers s n)))
)



(defrule ask-game-bidding
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not(inferred (feature wargame) (value T)))
        (info (feature game-strategy) (value "T"))
        =>
        (assert (asking-question (question game-bidding) (answers s n)))
)

(defrule ask-game-bluff
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature game-wtdplacement) (value "yes")))
        (not (info (feature game-explorative) (value "yes")))
        ;(not (info (feature )))
        =>
        (assert (asking-question (question game-bluff) (answers s n)))
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




(defrule ask-game-hold-story
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (result (feature german) (value T))
                (result (feature filler) (value T))
                (result (feature family) (value T)))

        =>
        (assert (asking-question (question game-hold-story) (answers s n)))
)

(defrule ask-game-western
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (and    (result (feature american) (value T))
                        (info (feature game-bluff) (value "yes")))

                (and   (result (feature party) (value T))
                        (info (feature game-bluff) (value "yes")))

                (and    (result (feature family) (value T))
                        (result (feature coop-comp) (value comp))
                )        

        )  
        =>
        (assert (asking-question (question game-western) (answers s n)))
)

(defrule ask-game-horror
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (and    (result (feature filler) (value T))
                        (info (feature game-thematic) (value "yes"))
                        (result (feature coop-comp) (value comp)))
                (and    (result (feature party) (value T))
                        (info (feature game-challenging) (value "yes"))
                        (result (feature coop-comp) (value coop\comp)))
        )        
        =>
        (assert (asking-question (question game-horror) (answers s n)))
)

(defrule ask-game-gothic
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (and    (result (feature american) (value T))
                        (info (feature game-challenging) (value "yes")))
                (and    (result (feature german) (value T))
                        (info (feature game-thematic) (value "yes")))
                (and    (result (feature filler) (value T))
                        (or     (info (feature game-thematic) (value "yes"))
                                (info (feature game-strategy) (value "yes")))
                )
                (and    (result (feature cardgame) (value T))
                        (info (feature game-challenging) (value T)))

                (and    (result (feature family) (value T)) 
                        (info (feature game-thematic) (value T)))
        )         
        =>
        (assert (asking-question (question game-gothic) (answers s n)))
)

(defrule ask-game-lovecraft
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-gothic) (value "yes"))
        (or     (and    (result (feature german) (value T))
                        (info (feature game-thematic) (value "yes")))
                (and    (result (feature american) (value T))
                        (info (feature game-challenging) (value "yes")))
                (and    (result (feature filler) (value T))
                        (info (feature game-thematic) (value "yes")))
                (and    (result (feature cardgame) (value T))
                        (info (feature game-thematic) (value "yes"))
                        (info (feature game-challenging) (value "yes"))
                        (info (feature game-investigative) (value "yes")))

                (and    (result (feature family) (value T))
                        (info (feature game-thematic) (value T)))
        )


        =>
        (assert (asking-question (question game-lovecraft) (answers s n)))
)

(defrule ask-game-war
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (and    (result (feature american) (value T))
                        (info (feature game-challenging) (value "yes"))
                )
                
                (and    (result (feature german) (value T))
                        (info (feature game-thematic) (value "yes"))
                )
        )
        =>
        (assert (asking-question (question game-war) (answers s n)))
)

(defrule ask-game-abstract
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     
                (and    (result (feature filler) (value T))
                        (info  (game-thematic) (value "yes"))
                        (info (game-challenging) (value "yes")))

                (and    (result (feature cardgame) (value T))
                        (result (feature coop-comp) (value coop))
                        (info (feature game-thematic) (value "yes"))
                        (info (feature game-strategy) (value "yes"))
                        (info (feature game-challenging) (value "yes"))
                )
                (and    (result (feature family) (value T))
                        (result (feature coop-comp) (value comp)))
        )        
        =>
        (assert (asking-question (question game-abstract) (answers s n)))
)

(defrule ask-game-fantasy
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (and    (result (feature german) (value T))
                        (info (feature game-strategy) (value "yes")))
                (and    (result (feature american) (value T))
                        (info (feature game-challenging) (value "yes")))
                (and    (result (feature filler) (value T))
                        (or     (result (feature game-thematic) (value "yes"))     
                                (result (feature game-strategy) (value "yes"))
                        )
                (and    (result (feature cardgame) (value T))
                        (info (feature game-challenging) (value "yes")))

                (and    (result (feature party) (value T))
                        (or     (result (feature coop-comp) (value comp))
                                (result (feature coop-comp) (value coop-comp)))

                (and    (result (feature family) (value T))
                        (info (feature game-thematic) (value "yes"))
                )


        =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-farms
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or      (result (feature german) (value T))
                (result (feature filler) (value T))
                (result (feature family) (value T))
        )
        (info (feature "game-wtdplacement") (value "yes"))
        (result (feature coop-comp) (value comp))

        =>
        (assert (asking-question (question game-farms) (answers s n)))
)

(defrule ask-game-futuristics
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (and    (result (feature american) (value "yes"))
                        (info (feature game-thematic) (value "yes"))
                        (info (feature game-explorative) (value "yes"))
                        (result (feature coop-comp) (value coop\comp))
                )        
                (and    (result (feature filler) (value T))
                        (result (feature coop-comp) (value comp))
                        (result (feature game-bluff) (value "yes")))
                (or     (result (feature party) (value T))
                        (result (feature family) (value T)))
                        (and    (info (feature game-challenging) (value "yes"))
                                (info (feature game-bluff) (value "yes"))
                        )
                )
        )
        =>
        (assert (asking-question (question game-futuristics) (answers s n)))
)

(defrule ask-game-merchants
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or    (result (feature german) (value T))
                (result (feature filler) (value T))
        )

        =>
        (assert (asking-question (question game-merchants) (answers s n)))
)

(defrule ask-game-indians
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (result (feature german) (value T))
                (result (feature filler) (value T))
                (result (feature family) (value T)))
        =>
        (assert (asking-question (question game-indians) (answers s n)))
)

(defrule ask-game-fireworks
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))
 
        =>
        (assert (asking-question (question game-fireworks) (answers s n)))
)


(defrule ask-game-survival
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or (result (feature american) (value T))
                (result (feature filler) (value T)))
        =>
        (assert (asking-question (question game-survival) (answers s n)))
)


(defrule ask-game-forests
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature cardgame) (value T))

        =>
        (assert (asking-question (question game-forests) (answers s n)))
)


(defrule ask-game-industry
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))                 
        =>
        (assert (asking-question (question game-industry) (answers s n)))
)


(defrule ask-game-numbers
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature family) (value T))

        =>
        (assert (asking-question (question game-numbers) (answers s n)))
)

(defrule ask-game-castles
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (result (feature german) (value T))
                (result (feature filler) (value T))
                (result (feature party) (value T))
                (result (feature family) (value T)))

    
        =>
        (assert (asking-question (question game-castles) (answers s n)))
)

(defrule ask-game-vampyric
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature american) (value T))


        =>
        (assert (asking-question (question game-vampyric) (answers s n)))
)

(defrule ask-game-renaissance-court
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (result (feature german) (value T))                
                (result (feature filler) (value T))
                (result (feature party) (value T))
                (result (feature family) (value T)))
        =>
        (assert (asking-question (question game-renaissance-court) (answers s n)))
)


(defrule ask-game-pirates
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (result (feature american) (value T))
                (result (feature filler) (value T))
                (result (feature party) (value T)))


        =>
        (assert (asking-question (question game-pirates) (answers s n)))
)

(defrule ask-game-witchcraft
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))


        =>
        (assert (asking-question (question game-witchcraft) (answers s n)))
)

(defrule ask-game-oriental
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature family) (value T))

        =>
        (assert (asking-question (question game-oriental) (answers s n)))
)

(defrule ask-game-glass
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature family) (value T))
 
        =>
        (assert (asking-question (question game-glass) (answers s n)))
)

(defrule ask-game-chemistry
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))

        =>
        (assert (asking-question (question game-chemistry) (answers s n)))
)


(defrule ask-game-lord-of-the-rings
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-fantasy) (value "yes"))
        (or     (result (feature american) (value T))
                (result (feature filler) (value T))
                (result (feature cardgame) (value T)))        

        =>
        (assert (asking-question (question game-lord-of-the-rings) (answers s n)))
)

(defrule ask-game-tale
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (result (feature filler) (value T))
                (result (feature party) (value T))
                (result (feature family) (value T)))

        =>
        (assert (asking-question (question game-tale) (answers s n)))
)

(defrule ask-game-crime
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (result (feature american) (value T))
                (result (feature filler) (value T)))


        =>
        (assert (asking-question (question game-crime) (answers s n)))
)


(defrule ask-game-restaurants
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))

        =>
        (assert (asking-question (question game-restaurants) (answers s n)))
)


(defrule ask-game-mafia
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))
        

        =>
        (assert (asking-question (question game-mafia) (answers s n)))
)


(defrule ask-game-politics
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (result (feature filler) (value T))
                (result (feature filler) (value T))
                (result (feature family) (value T)))

        =>
        (assert (asking-question (question game-politics) (answers s n)))
)
