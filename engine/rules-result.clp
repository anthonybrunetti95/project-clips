;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;     REGOLE DI INFERENZA PER I FATTI RESULT FINALI     ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule infering-result
		(declare (salience ?*top-priority*))
		?f1 <- (infering-result (feature ?feature) (value ?flag))
		(not (result (feature ?feature)))
		(last-question (question ?last))
		=>
		(retract ?f1)
		(assert (result (feature ?feature) (value ?flag) (number ?last)))
		(if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Result: "(upcase ?feature) " " ?flag))
)

(defrule not-infering-already-inferred-result
		(declare (salience ?*top-priority*))
		?f1 <- (infering-result (feature ?feature) (value ?flag))
		(result (feature ?feature))
		=>
		(retract ?f1)
)

;;====================================================;;


(defrule result-cardgame
        (declare (salience ?*highest-priority*))
        (info (feature game-cardgame) (value  "yes"))

        =>
        (assert (infering-result (feature cardgame) (value T) ))
)

(defrule result-wargame 
        (declare (salience ?*highest-priority*))
        (info (feature game-wargame) (value "yes"))
        =>
        (assert (infering-result (feature wargame) (value T)))
)       

(defrule result-family 
        (declare (salience ?*highest-priority*))
        (info (feature game-family) (value "yes"))
        =>
        (assert (infering-result (feature family) (value T)))
)       

(defrule result-party 
        (declare (salience ?*highest-priority*))
        (info (feature game-players) (value "5" | "6" | "6+"))
        (or     (inferred (feature weight) (value facile))
                (inferred (feature weight) (value medio)))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))
        (result (feature wtdplacement) (value F))

        =>
        (assert (infering-result (feature party) (value T)))
)    



(defrule result-filler
        (declare (salience ?*highest-priority*))
        (info (feature game-time) (value "<60"))
        (inferred (feature weight) (value facile))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))
        (result (feature german) (value F))
        (not (info (feature game-explorative) (value "yes")))
        =>
        (assert (infering-result (feature filler) (value T)))
)

(defrule result-german
        (declare (salience ?*highest-priority*))
        (info (feature game-wtdplacement) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (result (feature coop-comp) (value comp))
        (not (result (feature filler) (value T)))
        =>
        (assert (infering-result (feature german) (value T)))
)

(defrule result-no-german
        (declare (salience ?*highest-priority*))
        (or (result (feature wtdplacement | strategy) (value F))
            (result (feature coop-comp) (value coop | coop-comp))
        )
        
        =>
        (assert (infering-result (feature german) (value F)))
)

(defrule result-american 
        (declare (salience ?*highest-priority*))
        (info (feature game-time) (value ">60"))
        (not(info (feature user-budget) (value "<18" | "19<33")))
        (info (feature game-thematic) (value "yes"))
        (not (inferred (feature weight) (value facile)))
        (info(feature strategy) (value "no"))
        (not (info (feature   game-wtdplacement | game-bidding | game-strategy) (value "yes")))
        (not (result (feature american)))
        =>
        (assert (infering-result (feature american) (value T)))

)
(defrule result-american-1
        (declare (salience ?*highest-priority*))
        (info (feature game-time) (value ">60"))
        (info (feature user-budget) (value "<18" | "19<33"))
        (info (feature game-thematic) (value "yes"))
        (inferred (feature weight) (value facile))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-explorative) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (not (info (feature game-wtdplacement | game-bidding | game-strategy) (value "yes")))
        (result (feature coop-comp) (value coop\comp))
        (not (result (feature american)))
        =>
        (assert (infering-result (feature american) (value T)))

)



(defrule result-weight
        (declare (salience ?*highest-priority*))
        (inferred (feature weight) (value ?weight))
        =>
        (assert (infering-result (feature weight) (value ?weight)))
)

(defrule result-coop
        (declare (salience ?*highest-priority*))
        (info (feature game-coop) (value "yes"))
        (info (feature game-comp) (value "no"))
        =>
        (assert (infering-result (feature coop-comp) (value coop)))
)

(defrule result-comp
        (declare (salience ?*highest-priority*))
        (info (feature game-comp) (value "yes"))
        (info (feature game-coop) (value "no"))
        =>
        (assert (infering-result (feature coop-comp) (value comp)))
)

(defrule result-coop-comp
        (declare (salience ?*highest-priority*))
        (info (feature game-coop) (value "yes"))
        (info (feature game-comp) (value "yes"))
        =>
        (assert (infering-result (feature coop-comp) (value coop\comp)))
)


(defrule result-thematic
        (declare (salience ?*high-priority*))
        (info (feature  game-thematic) (value "yes"))
        =>
        (assert (infering-result (feature thematic) (value T)))
)

(defrule result-strategy
        (declare (salience ?*high-priority*))
        (info (feature  game-strategy) (value "yes"))
        =>
        (assert (infering-result (feature strategy) (value T)))
)


(defrule result-challenging
        (declare (salience ?*high-priority*))
        (info (feature  game-challenging) (value "yes"))
        =>
        (assert (infering-result (feature challenging) (value T)))
)


(defrule result-explorative
        (declare (salience ?*high-priority*))
         (info (feature  game-explorative) (value "yes"))
        =>
        (assert (infering-result (feature explorative) (value T)))
)

(defrule result-wtdplacement
        (declare (salience ?*high-priority*))
         (info (feature  game-wtdplacement) (value "yes"))
        =>
        (assert (infering-result (feature wtdplacement) (value T)))
)

(defrule result-hmovement
        (declare (salience ?*high-priority*))
         (info (feature  game-hmovement) (value "yes"))
        =>
        (assert (infering-result (feature hmovement) (value T)))
)

(defrule result-investigative
        (declare (salience ?*high-priority*))
         (info (feature  game-investigative) (value "yes"))
        =>
        (assert (infering-result (feature investigative) (value T)))
)

(defrule result-bidding
        (declare (salience ?*high-priority*))
         (info (feature  game-bidding) (value "yes"))
        =>
        (assert (infering-result (feature bidding) (value T)))
)

(defrule result-bluff
        (declare (salience ?*high-priority*))
         (info (feature  game-bluff) (value "yes"))
        =>
        (assert (infering-result (feature bluff) (value T)))
)

(defrule result-no-thematic
        (declare (salience ?*high-priority*))
        (or (info (feature  game-thematic) (value "no"))
            (info (feature game-wargame) (value "yes")))
        
        =>
        (assert (infering-result (feature thematic) (value F)))
)

(defrule result-no-strategy-1
        (declare (salience ?*high-priority*))
        (info (feature  game-strategy) (value "no"))

        (not (result (feature strategy)))
        =>
        (assert (infering-result (feature strategy) (value F)))
)

(defrule result-no-strategy-2
        (declare (salience ?*high-priority*))
        (info (feature game-players) (value "1"))
        (info (feature game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes") )
        (not (result (feature strategy)))
              =>
        (assert (infering-result (feature strategy) (value F)))
)

(defrule result-no-strategy-3
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value comp))
        (info (feature game-explorative | game-hmovement | game-investigative ) (value "yes"))
        (not (result (feature strategy)))
        =>
        (assert (infering-result (feature strategy) (value F)))
)

(defrule result-no-strategy-4
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value coop))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff ) (value "yes"))
        (not (result (feature strategy)))
        =>
        (assert (infering-result (feature strategy) (value F)))
)

(defrule result-no-strategy-5
        (declare (salience ?*high-priority*)) 
        (result (feature coop-comp) (value coop\comp))
            (or    (info (feature game-thematic) (value "no"))
                (info (feature game-challenging) (value "no"))
                (info (feature game-explorative) (value "no"))
                (info (feature game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff ) (value "yes"))
            )
        (not (result (feature strategy)))
        =>
        (assert (infering-result (feature strategy) (value F)))
)

(defrule result-no-strategy-6
        (declare (salience ?*high-priority*)) 
        (result (feature coop-comp) (value comp))
        (result (feature filler) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (not (result (feature strategy)))
        =>
        (assert (infering-result (feature strategy) (value F)))
)

(defrule result-no-challenging-1
        (declare (salience ?*high-priority*))
        (or (info (feature  game-challenging) (value "no"))
            (inferred (feature wargame) (value T))
            (info (feature game-wtdplacement | game-bidding) (value "yes"))
        )
        (not (result (feature challenging)))

        =>
        (assert (infering-result (feature challenging) (value F)))
)

(defrule result-no-challenging-2
        (declare (salience ?*high-priority*))
        (info (feature game-players) (value "1"))
        (info (feature  game-hmovement ) (value "yes"))
        (not (result (feature challenging)))
        =>
        (assert (infering-result (feature challenging) (value F)))
)

(defrule result-no-challenging-3
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value comp))
        (info (feature game-explorative | game-hmovement) (value "yes"))
        (not (result (feature challenging)))
        =>
        (assert (infering-result (feature challenging) (value F)))
)

(defrule result-no-challenging-4
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value coop))
        (info (feature game-hmovement | game-bluff) (value "yes"))
        (not (result (feature challenging)))
        =>
        (assert (infering-result (feature challenging) (value F)))
)

(defrule result-no-challenging-5
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value comp))
        (result (feature filler) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (not (result (feature challenging)))
        =>
        (assert (infering-result (feature challenging) (value F)))
)


(defrule result-no-explorative-1
        (declare (salience ?*high-priority*))
        (or     (info (feature  game-explorative) (value "no"))
                (info (feature game-wtdplacement | game-hmovement | game-bidding | game-bluff) (value "yes"))
                (result (feature german | filler | family | party) (value T)))
        (not (result (feature explorative)))
        =>
        (assert (infering-result (feature explorative) (value F)))
)

(defrule result-no-explorative-2
        (declare (salience ?*high-priority*))
        (info (feature game-players) (value "1"))
        (or
            (info (feature game-thematic) (value "no"))
            (info (feature game-challenging) (value "no"))
        )
        (not (result (feature explorative)))
        =>
        (assert (infering-result (feature explorative) (value F)))
)

(defrule result-no-explorative-3
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value coop))
        (or (info (feature game-thematic | game-challenging ) (value "no"))
            (info (feature game-strategy) (value "yes"))
        )
        (not (result (feature explorative)))
        =>
        (assert (infering-result (feature explorative) (value F)))
)

(defrule result-no-explorative-4
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-thematic) (value "no"))
        (not (result (feature explorative)))
        =>
        (assert (infering-result (feature explorative) (value F)))
)


(defrule result-no-wtdplacement-1
        (declare (salience ?*high-priority*))
        (or (info (feature  game-wtdplacement) (value "no"))
            (info (feature game-challenging | game-explorative | game-hmovement | game-investigative | game-bluff) (value "yes"))
            (result (feature coop-comp) (value coop | coop\comp))
        )
        (not (result (feature wtdplacement)))
        =>
        (assert (infering-result (feature wtdplacement) (value F)))
)



(defrule result-no-hmovement-1
        (declare (salience ?*high-priority*))
        (or (info (feature  game-hmovement) (value "no"))
            (info (feature game-thematic) (value "no"))
            (info (feature game-challenging) (value "no"))
            (info (feature game-bluff) (value "no"))
            (info (feature game-strategy | game-explorative | game-wtdplacement | game-bidding) (value "yes"))
        )    
        (not (result (feature hmovement)))
        =>
        (assert (infering-result   (feature hmovement) (value F)))
)

(defrule result-no-investigative-1
        (declare (salience ?*high-priority*))
        (or (info (feature  game-investigative) (value "no"))
            (inferred (feature wargame) (value T))
            (info (feature game-strategy | game-wtdplacement | game-bidding) (value "yes"))
            (info (feature game-thematic))
        )
        (not (result (feature investigative)))
        =>
        (assert (infering-result (feature investigative) (value F)))
)

(defrule result-no-investigative-2
        (declare (salience ?*high-priority*))
        (info (feature game-players) (value "1"))
        (or 
            (info (feature game-thematic) (value "no"))
            (info (feature game-challenging) (value "no"))

        )    
        (not (result (feature investigative)))
        =>
        (assert (infering-result (feature investigative) (value F)))
)

(defrule result-no-investigative-3
        (declare (salience ?*high-priority*))
        (or
            (info (feature game-thematic) (value "no"))
            (info (feature game-challenging) (value "no"))
            (info (feature game-bluff) (value "no"))
            (info (feature game-explorative  | game-hmovement ) (value "yes"))
        )
        (result (feature coop-comp) (value comp))
        (not (result (feature investigative)))
        =>
        (assert (infering-result (feature investigative) (value F)))
)

(defrule result-no-investigative-4
        (declare (salience ?*high-priority*))
        (or
            (info (feature game-thematic) (value "no"))
            (info (feature game-challenging) (value "no"))
            (info (feature  game-hmovement | game-bluff) (value "yes"))
        )
        (result (feature coop-comp) (value coop))
        (not (result (feature investigative)))
        =>
        (assert (infering-result (feature investigative) (value F)))
)

(defrule result-no-investigative-5
        (declare (salience ?*high-priority*))
        (or
            (info (feature game-thematic) (value "no"))
            (info (feature   game-wtdplacement | game-bidding ) (value "yes"))
        )
        (result (feature coop-comp) (value coop\comp))
        (not (result (feature investigative)))
        =>
        (assert (infering-result (feature investigative) (value F)))
)


(defrule result-no-bidding
        (declare (salience ?*high-priority*))
        (or (info (feature  game-bidding) (value "no"))
            (inferred (feature wargame) (value T))
            (info (feature game-strategy) (value "no"))
            (result (feature challenging | explorative | hmovement | investigative ) (value T))
            (result (feature coop-comp) (value coop | coop\comp))
            (info (feature game-players)  (value "1"| "6+"))
        )
        
        =>
        (assert (infering-result (feature bidding) (value F)))
)

(defrule result-no-bluff-1
        (declare (salience ?*high-priority*))
        (or (info (feature  game-bluff) (value "no"))
            (result (feature wargame) (value T))
            (info (feature game-explorative | game-wtdplacement ) (value "yes"))
            (result (feature coop-comp) (value coop))
        )

        (not (result (feature bluff)))
        =>
        (assert (infering-result (feature bluff) (value F)))
)

(defrule result-no-bluff-2
        (declare (salience ?*high-priority*))
        (info (feature  game-hmovement) (value "yes"))
        (result (feature coop-comp) (value comp))
        (not (result (feature bluff)))
        =>
        (assert (infering-result (feature bluff) (value F)))
)

(defrule result-no-bluff-3
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-strategy | game-bidding) (value "yes"))
        (not (result (feature bluff)))
        =>
        (assert (infering-result (feature bluff) (value F)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule result-greece
        (declare (salience ?*highest-priority*))
        (info (feature game-greece) (value "yes"))
        =>
        (assert (infering-result (feature greece) (value T)))

)

(defrule result-roman
        (declare (salience ?*highest-priority*))
        (info (feature game-roman) (value "yes"))
        =>
        (assert (infering-result (feature roman )(value T)))

)
(defrule  result-western
        (declare (salience ?*highest-priority*))
        (info (feature game-western) (value "yes"))
         =>
        (assert (infering-result (feature western )(value T)))

)
(defrule  result-horror
        (declare (salience ?*highest-priority*))
        (info (feature game-horror) (value "yes"))
         =>
        (assert (infering-result (feature horror )(value T)))

)
(defrule  result-gothic
        (declare (salience ?*highest-priority*))
        (info (feature game-gothic) (value "yes"))
         =>
        (assert (infering-result (feature gothic )(value T)))

)

(defrule  result-lovecraft
        (declare (salience ?*highest-priority*))
        (info (feature game-lovecraft) (value "yes"))
         =>
        (assert (infering-result (feature lovecraft )(value T)))

)
(defrule  result-war
        (declare (salience ?*highest-priority*))
        (info (feature game-war) (value "yes"))
         =>
        (assert (infering-result (feature war )(value T)))

)
(defrule  result-abstract
        (declare (salience ?*highest-priority*))
        (info (feature game-abstract) (value "yes"))
         =>
        (assert (infering-result (feature abstract )(value T)))
)
(defrule  result-fantasy
        (declare (salience ?*highest-priority*))
        (info (feature game-fantasy) (value "yes"))
         =>
        (assert (infering-result (feature fantasy )(value T)))

)
(defrule  result-farms
        (declare (salience ?*highest-priority*))
        (info (feature game-farms) (value "yes"))
         =>
        (assert (infering-result (feature farms )(value T)))
)

(defrule  result-futuristics
        (declare (salience ?*highest-priority*))
        (info (feature game-futuristics) (value "yes"))
         =>
        (assert (infering-result (feature futuristics )(value T)))
)
(defrule  result-merchants
        (declare (salience ?*highest-priority*))
        (info (feature game-merchants) (value "yes"))
         =>
        (assert (infering-result (feature merchants )(value T)))

)
(defrule  result-indians
        (declare (salience ?*highest-priority*))
        (info (feature game-indians) (value "yes"))
         =>
        (assert (infering-result (feature indians )(value T)))

)
(defrule  result-fireworks
        (declare (salience ?*highest-priority*))
        (info (feature game-fireworks) (value "yes"))
         =>
        (assert (infering-result (feature fireworks )(value T)))

)
(defrule  result-survival
        (declare (salience ?*highest-priority*))
        (info (feature game-survival) (value "yes"))
         =>
        (assert (infering-result  (feature survival )(value T)))
)
(defrule  result-forests
        (declare (salience ?*highest-priority*))
        (info (feature game-forests) (value "yes"))
         =>
        (assert (infering-result  (feature forests )(value T)))

)
(defrule  result-industry
        (declare (salience ?*highest-priority*))
        (info (feature game-industry) (value "yes"))
         =>
        (assert (infering-result  (feature industry )(value T)))

)
(defrule  result-numbers
        (declare (salience ?*highest-priority*))
        (info (feature game-numbers) (value "yes"))
         =>
        (assert (infering-result  (feature numbers )(value T)))

)

(defrule  result-castles
        (declare (salience ?*highest-priority*))
        (info (feature game-castles) (value "yes"))
         =>
        (assert (infering-result  (feature castles )(value T)))

)
(defrule  result-vampyric
        (declare (salience ?*highest-priority*))
        (info (feature game-vampyric) (value "yes"))
         =>
        (assert (infering-result  (feature vampyric )(value T)))

)

(defrule  result-renaissance-court
        (declare (salience ?*highest-priority*))
        (info (feature game-renaissance-court) (value "yes"))
          =>
        (assert (infering-result  (feature renaissance-court )(value T)))

)
(defrule  result-pirates
        (declare (salience ?*highest-priority*))
        (info (feature game-pirates) (value "yes"))
          =>
        (assert (infering-result  (feature  pirates)(value T)))

)

(defrule  result-witchcraft
        (declare (salience ?*highest-priority*))
        (info (feature game-witchcraft) (value "yes"))
          =>
        (assert (infering-result  (feature  witchcraft)(value T)))

)


(defrule result-oriental
        (declare (salience ?*highest-priority*))
        (info (feature game-oriental) (value "yes"))
          =>
        (assert (infering-result  (feature  oriental)(value T)))

)


(defrule infering-result-glass
        (declare (salience ?*highest-priority*))
        (info (feature game-glass) (value "yes"))
          =>
        (assert (infering-result  (feature  glass)(value T)))

)


(defrule infering-result-chemistry
        (declare (salience ?*highest-priority*))
        (info (feature game-chemistry) (value "yes"))
          =>
        (assert (infering-result  (feature  chemistry)(value T)))

)

(defrule result-lord-of-the-rings
        (declare (salience ?*highest-priority*))
        (info (feature game-lord-of-the-rings) (value "yes"))
          =>
        (assert (infering-result  (feature  lord-of-the-rings)(value T)))

)


(defrule result-tale
        (declare (salience ?*highest-priority*))
        (info (feature game-tale) (value "yes"))
          =>
        (assert (infering-result  (feature  tale)(value T)))

)

(defrule result-crime
        (declare (salience ?*highest-priority*))
        (info (feature game-crime) (value "yes"))
          =>
        (assert (infering-result  (feature  crime)(value T)))

)

(defrule result-restaurants
        (declare (salience ?*highest-priority*))
        (info (feature game-restaurants) (value "yes"))
          =>
        (assert (infering-result  (feature  restaurants)(value T)))

)

(defrule result-mafia
        (declare (salience ?*highest-priority*))
        (info (feature game-mafia) (value "yes"))
          =>
        (assert (infering-result  (feature  mafia)(value T)))

)


(defrule result-politics
        (declare (salience ?*highest-priority*))
        (info (feature game-politics) (value "yes"))
          =>
        (assert (infering-result  (feature  politics)(value T)))

)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule  result-no-greece-1
        (declare (salience ?*highest-priority*))
        (or 
            (info (feature game-greece) (value "no"))
            (result (feature coop-comp) (value coop\comp | coop))
            (result (feature thematic  | explorative | hmovement | investigative | bluff) (value T))
            (result (feature  american | cardgame | party | wargame) (value T)) 
            )
        (not (result(feature greece)))
        =>
        (assert (infering-result (feature greece) (value F)))

)

(defrule result-no-greece-2
        (declare (salience ?*highest-priority*))
        (result (feature german) (value T))
        (or
            (info (feature game-players) (value "6" | ">6"))        
            (info (feature game-challenging | game-explorative | game-hmovement | game-investigative | game-bluff) (value "yes"))
            (info (feature game-industry | game-renaissance-court | game-merchants | game-indians | game-war | game-fantasy | game-chemistry | game-gala-hotel | game-gothic | game-lovecraft | game-trains) (value "yes"))
        )
        (not (result(feature greece)))
        =>
        (assert (infering-result (feature greece) (value F)))
)

(defrule  result-no-greece-3
        (declare (salience ?*highest-priority*))
        (result (feature filler) (value T))
        (or
            (info (feature game-players) (value "1" | "3" | "4" | "5" | "6"))
            (info (feature game-strategy) (value "no"))
            (info (feature game-thematic) (value "no"))
            (result (feature coop-comp) (value coop | coop-comp))
            (info (feature game-abstract | game-lovecraft | game-gothic | game-fantasy | game-merchants | game-indians | game-survival | game-horror | game-castles | game-jewelry | game-renaissance-court | game-fantasy | game-futuristics | game-politics | game-indians | game-politics | game-crime | game-farms) (value "yes"))
            (info (feature game-explorative) (value "yes"))
        )            
        (not (result(feature greece)))
        =>
        (assert (infering-result (feature greece) (value F)))
)

(defrule  result-no-greece-4
        (declare (salience ?*highest-priority*))
        (result (feature family) (value T))
        (or
            (info (feature game-strategy) (value "no"))
            (info (feature game-thematic) (value "no"))
            (result (feature coop-comp) (value coop | coop-comp))
            (info (feature game-western | game-tailoring | game-abstract | game-numbers | game-castles | game-trains | game-oriental | game-abstract | game-glass | game-farms | game-gothic | game-lovecraft | game-renaissance-court | game-fantasy | game-futuristics | game-politics | game-indians) (value "yes"))
            (info (feature game-thematic | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes"))
            (info (feature game-explorative) (value "yes"))
        )            
        (not (result(feature greece)))
        =>
        (assert (infering-result (feature greece) (value F)))
)

(defrule result-no-roman
        (declare (salience ?*highest-priority*))
        (info (feature game-roman) (value "no"))
        (or (feature wargame) (value F)
            (feature weight) (value facile | medio))        
        =>
        (assert (infering-result   (feature roman )(value F)))

)
(defrule result-no-western-1
        (declare (salience ?*highest-priority*))
        (or (info (feature game-western) (value "no"))
            (result (feature coop-comp) (value coop))
            (result (feature wargame) (value T))
            (result (feature filler) (value T))
            (result (feature cardgame) (value T))
            (result (feature strategy | challenging | explorative | wtdplacement | hmovement | investigative | bidding) (value T))
            (info (feature game-players) (value "1"))

        )
        (not (feature western))   
         =>
        (assert (infering-result   (feature western )(value F)))

)

(defrule result-no-western-2
        (declare (salience ?*highest-priority*))
        (result (feature american) (value T))
        (or 
            (info (feature user-budget) (value "<18" | "19<33" | "34<44" | "45<65" | "66<110"))
            (result (feature war | fantasy | gothic | futrstics | lovecraft | fantasy | vampyric | pirates | lord-of-the-rings | survival | indians | tale | crime) (value T))
            (result (feature strategy | challenging | explorative | wtdplacement | hmovement | investigative | bidding) (value T))
            (info (feature game-players) (value "1"))
        )   
        (info (feature game-bluff) (value "no"))
        (not (feature western)) 
         =>
        (assert (infering-result (feature western )(value F)))

)

(defrule result-no-western-3
        (declare (salience ?*highest-priority*))
        (result (feature family) (value T))
        (result (feature coop-comp) (value coop | coop\comp))
        (info (feature game-players) (value "1" | "5" | "6" | "6+"))
        (result (feature thematic |strategy | challenging | explorative | wtdplacement | hmovement | investigative | bidding | bluff) (value T))
        (not (feature western)) 
         =>
        (assert (infering-result (feature western )(value F)))

)

(defrule result-no-western-4
        (declare (salience ?*highest-priority*))
        (result (feature party) (value T))
        (or
                    (info (feature game-players) (value "1"))
                    (info (feature game-bluff) (value "no"))
                    (result (feature strategy | challenging | explorative | wtdplacement | hmovement | investigative | bidding) (value T))
                    (result (feature witchcraft | horror | fireworks | castles | pirates | tale | renaissance-court | mafia | tale | fantasy | mafia | futrstics | politics ) (value T))

        )
        (not (feature western)) 
         =>
        (assert (infering-result (feature western )(value F)))

)



(defrule result-no-horror-1
        (declare (salience ?*highest-priority*))
        (or (info (feature game-horror) (value "no"))
            (result (feature explorative | wtdplacement | hmovement | investigative | bidding | bluff) (value T))
            (result (feature german | american | cardgame | wargame | family) (value T))
            (result (feature coop-comp) (value coop))
        )    
        (not (result (feature horror)))
         =>
        (assert (infering-result   (feature horror )(value F)))

)

(defrule result-no-horror-2
        (declare (salience ?*highest-priority*))
        (result (feature filler) (value T))
        (or (info (feature game-thematic) (value "no"))
             (result (feature coop-comp) (value coop | coop-comp))
             (info (feature game-greece | game-abstract | game-lovecraft | game-farms | game-lord-of-the-rings  | game-crime| game-merchants | game-indians | game-castles | game-futuristics | game-jewelry| game-tale | game-renaissance-court | game-politics) (value "yes"))
        )
        (not (result (feature horror)))    
         =>
        (assert (infering-result (feature horror )(value F)))

)

(defrule result-no-horror-3 
        (declare (salience ?*highest-priority*))  
        (result (feature party) (value T))
        (or (info (feature game-challenging) (value "yes"))
            (info (feature game-players) (value "4" | "5"| "6"| "6+"))
             (result (feature coop-comp) (value coop | comp))
             (info (feature game-witchcraft | game-horror | game-fireworks | game-castles | game-pirates | game-tale | game-fantasy | game-renaissance-court | game-mafia | game-tale | game-futuristics | game-politics) (value "yes"))
        )
        (not (result (feature horror))) 
        =>
        (assert (infering-result   (feature horror )(value F)))
)



(defrule  result-no-gothic-1
        (declare (salience ?*highest-priority*))
        (or (info (feature game-gothic) (value "no"))
            (result (feature party | wargame) (value T))
            (info (feature game-bidding) (value "yes"))
        )
        (not (result (feature gothic)))
         =>
        (assert (infering-result   (feature gothic )(value F)))

)

(defrule  result-no-gothic-2
        (declare (salience ?*highest-priority*))
        (result (feature american) (value T))
        (or (result (feature game-strategy | game-wtdplacement | game-bidding) (value T))
            (info (feature  game-pirates | game-gothic | game-survival | game-indians | game-tale | game-western) (value "yes")))
        =>
        (assert (infering-result   (feature gothic )(value F)))

)

(defrule  result-no-gothic-3
        (declare (salience ?*highest-priority*))
        (result (feature german) (value T))
        (or (info (feature game-thematic) (value "no"))
            (info (feature game-strategy) (value "no"))
            (info (feature game-wtdplacement) (value "no"))
            (info (feature game-greece | game-renaissance-court | game-merchants | game-indians | game-war | game-fantasy |game-castles |  game-chemistry | game-gala-hotel | game-trains) (value "yes"))
            (result (feature game-challenging | game-explorative | game-hmovement | game-investigative | game-bidding | game-bluff) (value T ))
            (info (feature game-gothic)) 
         )
        (not (result (feature gothic)))      
         =>
        (assert (infering-result   (feature gothic )(value F)))

)

(defrule  result-no-gothic-4
        (declare (salience ?*highest-priority*))
        (result (feature filler) (value T))

        (or 
            (info (feature game-explorative | game-wtdplacement | game-hmovement | game-bidding | game-bluff) (value "yes"))
            (info (feature game-greece | game-abstract | game-merchants | game-indians | game-castles | game-futuristics | game-jewelry| game-tale | game-renaissance-court | game-politics) (value "yes"))
        )
        (not (result (feature gothic)))  
         =>
        (assert (infering-result   (feature gothic )(value F)))

)




(defrule  result-no-gothic-5
        (declare (salience ?*highest-priority*))
        (result (feature game-cardgame) (value T))
        (or 
            (result (feature explorative| hmovement | bidding | bluff) (value T))
            (info (feature game-abstract| game-forests) (value "yes"))
        )
        (not (result (feature gothic)))  
         =>
        (assert (infering-result (feature gothic )(value F)))

)

(defrule  result-no-gothic-6
        (declare (salience ?*highest-priority*))
        (result (feature family) (value T)) 
        (or     (info (feature game-thematic) (value "yes"))
                (result (feature explorative| hmovement | bidding | bluff) (value T))
                (info (feature game-greece | game-abstract | game-merchants | game-indians | game-survival | game-castles | game-jewelry | game-renaissance-court | game-tale | game-politics | game-futuristics) (value "yes"))
        )
        (not (result (feature gothic)))  
         =>
        (assert (infering-result (feature gothic )(value F)))

)





(defrule  result-no-lovecraft-1
        (declare (salience ?*highest-priority*))
        (or (info (feature game-lovecraft) (value "no"))
            (result (feature party | wargame) (value T))
            (result (feature hmovement | bidding) (value T))
            (info (feature gothic) (value "yes"))
            (info (feature game-gothic) (value "no"))
        )
        (not (result (feature lovecraft)))
         =>
        (assert (infering-result   (feature lovecraft )(value F)))

)

(defrule  result-no-lovecraft-2
        (declare (salience ?*highest-priority*))
         (info (feature game-gothic) (value "yes"))
        (result (feature german) (value T))
        (or (info (feature game-thematic) (value "no"))
            (info (feature game-players) (value "5" | "6" | "6+"))
            (info (feature  game-greece | game-farms |game-industry | game-renaissance-court | game-merchants | game-indians | game-war | game-fantasy | game-chemistry | game-gala-hotel | game-trains) (value "yes"))
            (result (feature challenging | explorative| hmovement | bidding | bluff) (value T))
        )
        (result (feature coop-comp) (value comp))
        (not (result (feature lovecraft)))
         =>
        (assert (infering-result   (feature lovecraft )(value F)))

)
(defrule  result-no-lovecraft-3
        (declare (salience ?*highest-priority*))
        (result (feature american) (value T))
        (or 
            (result (feature strategy | wtdplacement | hmovement | bidding) (value T))
            (info (feature game-investigative) (value "no"))
            (info (feature game-challenging) (value "no"))
            (info (feature game-fantasy) (value "no"))
            (info (feature game-lovecraft) (value "no"))
            (info (feature game-war | game-vampyric | game-pirates | game-lord-of-the-rings | game-western | game-tale | game-gothic) (value "yes"))
            
        )
        (not (result (feature lovecraft)))
         =>
        (assert (infering-result   (feature lovecraft )(value F)))

)

(defrule  result-no-lovecraft-4
        (declare (salience ?*highest-priority*))        
        (result (feature filler) (value T))
        (or 
            (info (feature game-thematic) (value "no"))
            (info (feature game-strategy) (value "no"))
            (info (feature game-challenging) (value "no"))
            (result (feature explorative | wtdplacement | hmovement | investigative  | bidding | bluff) (value T))
            (info (feature game-greece | game-abstract | game-merchants | game-indians | game-horror | game-survival | game-castles | game-jewelry | game-lord-of-the-rings | game-politics | game-crime) (value "yes"))
        )
        (not (result (feature lovecraft)))
         =>
        (assert (infering-result   (feature lovecraft )(value F)))

)

(defrule  result-no-lovecraft-5
        (declare (salience ?*highest-priority*))
        (info (feature game-lovecraft) (value "no"))
        (result (feature cardgame) (value T))
        (or
                    
                    (info (feature game-thematic) (value "no"))
                    (info (feature game-challenging) (value "no"))
                    (info (feature game-investigative) (value "no"))
                    (info (feature game-gothic) (value "no"))
                    (info (feature game-fantasy) (value "no"))
                    (result (feature strategy | explorative | wtdplacement | hmovement | bidding | bluff) (value T))
                    (info (feature game-dream | game-abstract | game-lord-of-the-rings) (value "yes"))
        )

        (not (result (feature lovecraft)))
         =>
        (assert (infering-result   (feature lovecraft )(value F)))

)

(defrule  result-no-lovecraft-6
        (declare (salience ?*highest-priority*))
        (result (feature family) (value T))
        (result (feature filler) (value T))
        (or
            (info (feature game-thematic) (value "no"))
            (result (feature strategy | explorative | wtdplacement | hmovement | bidding | bluff) (value T)) 
            (info (feature game-greece | game-abstract | game-merchants | game-indians | game-survival | game-castles | game-lord-of-the-rings | game-jewelry | game-tale | game-crime) (value "yes"))
        )
        (not (result (feature lovecraft)))
         =>
        (assert (infering-result   (feature lovecraft )(value F)))
)

(defrule  result-no-war-1
        (declare (salience ?*highest-priority*))
        (or (info (feature game-war) (value "no"))
            (result (feature filler | cardgame | party | family) (value T))
            (info (feature game-explorative | game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes"))
        )
        (not(result (feature war)))    
         =>
        (assert (infering-result   (feature war )(value F)))

)

(defrule  result-no-war-2
        (declare (salience ?*highest-priority*))
        (result (feature american) (value T))
        (or (info (feature game-challenging) (value "no"))
            (result (feature strategy | explorative | wtdplacement | hmovement | investigative | bidding | bluff) (value T))
            (info (feature game-players) (value "1" | "2" | "3" | "4" | "5" ))
        )
        (not(result (feature war)))
         =>
        (assert (infering-result   (feature war )(value F)))

)

(defrule  result-no-war-3
        (declare (salience ?*highest-priority*))
        (result (feature german) (value T))
        (or 
        (info (feature game-thematic) (value "yes"))
         (info (feature  game-greece |game-industry | game-renaissance-court | game-merchants | game-indians | game-castles| game-chemistry | game-gala-hotel | game-trains) (value "yes"))
         (result (feature explorative | hmovement | investigative | bidding | bluff) (value T))
        )
        (not (result (feature war)))    
         =>
        (assert (infering-result   (feature war )(value F)))

)
(defrule  result-no-abstract-1
        (declare (salience ?*highest-priority*))
        (or (info (feature game-abstract) (value "no"))
            (result (feature explorative | hmovement | investigative | investigative | bidding | bluff) (value T))
            (result (feature german | american | party | wargame) (value T))
        )
        (not (result (feature abstract)))
         =>
        (assert (infering-result   (feature abstract )(value F)))
)

(defrule  result-no-abstract-2
        (declare (salience ?*highest-priority*))
        (result (feature filler) (value T))
        (or (info  (feature game-thematic) (value "no"))
            (info (feature game-challenging) (value "no"))
            (info (feature game-players) (value  "3" | "4" | "5" | "6" | "6+"))
            (info (feature game-greece | game-lovecraft | game-fantasy | game-merchants | game-indians | game-survival | game-gothic | game-horror | game-castles | game-jewelry | game-lord-of-the-rings | game-renaissance-court | game-tale | game-futuristics | game-politics | game-crime) (value "yes"))
            (result (feature  explorative | wtdplacement | hmovement | investigative | bidding | bluff) (value T))
        )        

        (not (result (feature abstract)))
         =>
        (assert (infering-result   (feature abstract )(value F)))
)

(defrule  result-no-abstract-3
        (declare (salience ?*highest-priority*))
        
        (result (feature cardgame) (value T))
        (or (result (feature coop-comp) (value comp | coop\comp))
            (info (feature game-thematic) (value "no"))
            (info (feature game-strategy) (value "no"))
            (info (feature game-challenging) (value "no"))
            (info (feature game-players) (value  "3" | "4" | "5" | "6" | "6+"))
            (info (feature game-gothic | game-lovecraft | game-gothic | game-lord-of-the-rings ) (value "yes"))
            (info (feature abstract))
          
        )

        (not (result (feature abstract)))
         =>
        (assert (infering-result   (feature abstract )(value F)))
)

(defrule  result-no-abstract-4
        (declare (salience ?*highest-priority*))
        (result (feature family) (value T))
        (or 
            (result (feature coop-comp) (value coop | coop\comp))
            (info (feature game-players) (value  "5" | "6" | "6+" ))
            (info (feature game-strategy | game-challenging |game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding | game-bluff) (value "yes"))
            (info (feature game-greece | game-western | game-numbers | game-castles | game-trains | game-oriental | game-farms | game-renaissance-court | game-fantasy | game-futuristics | game-politics | game-indians | game-lovecraft | game-gothic) (value "yes"))
         )
        (not (result (feature abstract)))
         =>
        (assert (infering-result   (feature abstract )(value F)))
)

(defrule  result-no-fantasy-1
        (declare (salience ?*highest-priority*))
        (or (info (feature game-fantasy) (value "no"))
            (result (feature wargame) (value T)))
        (not (result (feature fantasy)))
         =>
        (assert (infering-result   (feature fantasy )(value F)))

)

(defrule  result-no-fantasy-2
        (declare (salience ?*highest-priority*))
        (result (feature german) (value T))
        (or (info (feature game-strategy) (value "no"))
            (info (feature game-indians) (value "yes"))
            (info (feature game-players) (value  "6" | "6+"))
            (result (feature lovecraft  | gothic | greece  | industry | renaissance-court | castles | merchants | indians | chemistry | gala-hotel | trains) (value T))
            (result (feature challenging | explorative | hmovement | investigative | bidding | bluff) (value T))
        )    
        (not (result (feature fantasy)))
         =>
        (assert (infering-result   (feature fantasy )(value F)))

)

(defrule  result-no-fantasy-3
        (declare (salience ?*highest-priority*))
        (result (feature american) (value T))
        (or 
            (info (feature game-challenging) (value "no"))
            (result (feature strategy |  wtdplacement  | bidding) (value T))
            (info (feature game-indians | game-pirates | game-survival | game-crime | game-western | game-crime ) (value "yes"))

        )
        (not (result (feature fantasy)))
         =>
        (assert (infering-result   (feature fantasy )(value F)))

)

(defrule  result-no-fantasy-4
        (declare (salience ?*highest-priority*))
        (result (feature filler) (value T))
        (or (result (feature explorative | wtdplacement | hmovement | bidding ) (value T))
            (info (feature game-greece | game-abstract | game-merchants | game-indians | game-survival |  game-futuristics | game-jewelry | game-farms | game-renaissance-court | game-futuristics | game-politics | game-crime ) (value "yes"))
        )
        (not (result (feature fantasy)))
         =>
        (assert (infering-result   (feature fantasy )(value F)))

)

(defrule  result-no-fantasy-5
        (declare (salience ?*highest-priority*))
        (result (feature cardgame) (value T))

        (or (info (feature game-challenging) (value "no"))
            (result (feature  wtdplacement | hmovement |bidding ) (value T))
            (info (feature game-indians | game-abstract| game-forests ) (value "yes"))
        )
       
        (not (result (feature fantasy)))
         =>
        (assert (infering-result   (feature fantasy )(value F)))

)

(defrule  result-no-fantasy-6
        (declare (salience ?*highest-priority*))
        (result (feature party) (value T))
        (or 
            (info (feature game-players) (value "3" | "4" | "5" | "6" | "6+"))
            (result (feature strategy | challenging | explorative | wtdplacement | hmovement | bidding ) (value T))
            (info (feature game-witchcraft | game-horror | game-fireworks | game-castles | game-western | game-pirates | game-renaissance-court | game-futuristics | game-politics) (value "yes"))
        )

        (not (result (feature fantasy)))
         =>
        (assert (infering-result   (feature fantasy )(value F)))

)

(defrule  result-no-fantasy-7
        (declare (salience ?*highest-priority*))
        (result (feature family) (value T))
        (or
            (info (feature game-thematic) (value "no"))
            (result (feature strategy  | explorative | wtdplacement | hmovement |bidding | bluff ) (value T))
            (info (feature game-witchcraft | game-horror | game-fireworks | game-castles | game-western | game-pirates | game-renaissance-court | game-mafia |  game-futuristics | game-politics) (value "yes"))
        )
        (not (result (feature fantasy)))
         =>
        (assert (infering-result   (feature fantasy )(value F)))

)


(defrule  result-no-farms-1
        (declare (salience ?*highest-priority*))
        (or (info (feature game-farms) (value "no"))
            (result (feature challenging | explorative | hmovement | investigative | bluff) (value T))
            (result (feature american | cardgame | party | wargame) (value T))
            (result (feature filler | family) (value F))
        )
        (not (result (feature farms)))    
         =>
        (assert (infering-result  (feature farms )(value F)))
)

(defrule  result-no-farms-2
        (declare (salience ?*highest-priority*))
        (result (feature german) (value T))
        (or (result (feature challenging | explorative | hmovement | investigative | bidding ) (value T))
            (info (feature game-greece | game-renaissance-court | game-merchants | game-chemistry | game-gala-hotel | game-restaurants | game-trains) (value "yes"))
            (info (feature game-wtdplacement) (value "no"))
            (result (feature coop-comp) (value coop | coop\comp))
        )    
        (not (result (feature farms)))
         =>
        (assert (infering-result  (feature farms )(value F)))
)

(defrule  result-no-farms-3
        (declare (salience ?*highest-priority*))
        (result (feature filler) (value T))
        (result (feature family) (value T))
        (or 
            (result (feature coop-comp) (value coop\comp | coop))
            (result (feature challenging | explorative | hmovement | investigative | bidding | bluff ) (value T))
            (info (feature game-castles | game-renaissance-court | game-tale | game-futuristics | game-politics | game-fantasy | game-indians | game-lovecraft | game-gothic ) (value "yes"))
            (info (feature game-wtdplacement) (value "no"))   
        )
        (not (result (feature farms)))
         =>
        (assert (infering-result  (feature farms )(value F)))
)

(defrule  result-no-futuristics-1
        (declare (salience ?*highest-priority*))
        (or (info (feature game-futuristics) (value "no"))
            (result (feature german | cardgame | wargame) (value T))
            (result (feature wtdplacement | hmovement | investigative) (value T))
            (info (feature game-players) (value "6+"))

        )    
        (not (result (feature futuristics)))
         =>
        (assert (infering-result  (feature futuristics )(value F)))
)

(defrule  result-no-futuristics-2
        (declare (salience ?*highest-priority*))
        (result (feature american) (value T))
        (or
           (info (feature game-thematic) (value "no"))
           (info (feature game-explorative) (value "no"))
           (result (feature strategy | challenging) (value F)) 
           (info (feature game-war | game-vampyric | game-pirates | game-lord-of-the-rings | game-war | game-survival | game-indians | game-western | game-crime | game-lovecraft) (value "yes"))
        )
        (not (result (feature futuristics)))
         =>
        (assert (infering-result  (feature futuristics )(value F)))
)

(defrule  result-no-futuristics-3
        (declare (salience ?*highest-priority*))
        (result (feature filler) (value T))
        (or (result (feature thematic | strategy) (value T))
            (info (feature game-strategy) (value "no"))
            (info (feature game-greece | game-abstract | game-lovecraft | game-gothic | game-fantasy | game-merchants | game-indians | game-survival | game-gothic | game-castles | game-jewelry | game-farms | game-renaissance-court | game-tale | game-indians | game-crime ) (value "yes"))
            (result (feature bluff | bidding )  (value F))
            
        )
        (not (result (feature futuristics)))
         =>
        (assert (infering-result  (feature futuristics )(value F)))
)


(defrule  result-no-futuristics-4
        (declare (salience ?*highest-priority*))
        (result (feature filler) (value T))
        (result (feature party) (value T))
        (result (feature family) (value T))
        (or (info (feature thematic) (value "yes"))
            (info (feature strategy) (value "yes"))
            (result (feature challenging | bluff ) (value F))
            (info (feature game-castles | game-renaissance-court | game-tale | game-fantasy) (value "yes"))
        )
        (not (result (feature futuristics)))
         =>
        (assert (infering-result  (feature futuristics )(value F)))
)



(defrule  result-no-merchants-1
        (declare (salience ?*highest-priority*))
        (or (info (feature game-merchants) (value "no"))
            (info (feature game-players) (value "6" | "6+"))
            (result (feature american | cardgame | party | wargame | family) (value T))
            (result (feature coop-comp) (value coop | coop\comp))
        )
        (not (result (feature merchants)))
         =>
        (assert (infering-result  (feature merchants )(value F)))
)


(defrule  result-no-merchants-2
        (declare (salience ?*highest-priority*))
        (result (feature filler) (value T))
        (or 
            (result (feature thematic | strategy | challenging | explorative | wtdplacement | hmovement | investigative | bidding | bluff) (value T))
            (info (feature game-greece | game-abstract | game-lovecraft | game-gothic | game-fantasy | game-merchants | game-indians | game-survival | game-castles | game-jewelry | game-farms | game-renaissance-court | game-merchants | game-tale | game-politics  | game-crime ) (value "yes"))
                
        )
        (not (result (feature merchants)))
         =>
        (assert (infering-result  (feature merchants )(value F)))

)

(defrule  result-no-merchants-3
        (declare (salience ?*highest-priority*))
        (result (feature german) (value T))
        (or 
            (result (feature thematic | challenging | explorative | hmovement | investigative | bidding | bluff) (value T))
            (info (feature game-farms | game-industry | game-renaissance-court | game-greece | game-castles | game-war | game-fantasy | game-industry | game-gothic | game-lovecraft | game-indians | game-merchants | game-restaurants | game-trains ) (value "yes"))
            
        )
        (not (result (feature merchants)))
         =>
        (assert (infering-result  (feature merchants )(value F)))

)
(defrule  result-no-indians-1
        (declare (salience ?*highest-priority*))
        (or (info (feature game-indians) (value " no"))
            (result (feature cardgame | party | wargame) (value T))
            (result (feature explorative | hmovement | investigative | bidding | bluff ) (value T))
        )
        (not (result (feature indians)))
         =>
        (assert (infering-result   (feature indians )(value F)))

)

(defrule  result-no-indians-2
        (declare (salience ?*highest-priority*))
        (result (feature german) (value T))
        (or
             (info (feature game-fantasy) (value "yes"))
             (info (feature game-gothic) (value "yes"))
             (result (feature challenging) (value T))
             (info (feature  game-greece  |game-industry | game-renaissance-court | game-castles | game-merchants | game-gothic | game-lovecraft| game-fantasy | game-chemistry | game-gala-hotel | game-trains) (value "yes"))  
        )
        (not (result (feature indians)))
         =>
        (assert (infering-result   (feature indians )(value F)))

)

(defrule  result-no-indians-3
        (declare (salience ?*highest-priority*))
        (result (feature american) (value T))
        (or
            (info (feature game-challenging) (value "no"))
            (result (feature coop-comp) (value coop))
            (info (feature game-fantasy) (value "yes"))
            (info (feature game-gothic) (value "yes"))
            (result (feature  strategy | explorative | wtdplacement | hmovement | investigative | bidding |  bluff ) (value T))
            (info (feature game-war | game-fantasy | game-gothic | game-fantasy | game-futuristics | game-vampyric | game-pirates | game-lord-of-the-rings | game-tale | game-western | game-crime | game-lovecraft) (value "yes"))
        )
        (not (result (feature indians)))
         =>
        (assert (infering-result   (feature indians )(value F)))

)

(defrule  result-no-indians-4
        (declare (salience ?*highest-priority*))
        (result (feature filler) (value T))
        (not (result (feature family) (value T)))
        (or
         
            (result (feature coop-comp) (value coop | coop\comp))
            (info (feature game-fantasy) (value "yes"))
            (info (feature game-gothic) (value "yes"))
            (info (feature  game-explorative | game-hmovement | game-investigative | game-bidding |  game-bluff ) (value "yes"))
            (info (feature game-greece | game-abstract | game-lovecraft | game-gothic | game-fantasy | game-merchants | game-indians | game-survival | game-castles | game-jewelry | game-farms | game-renaissance-court | game-merchants | game-tale | game-politics  | game-crime ) (value "yes"))
        )
        (not (result (feature indians)))
         =>
        (assert (infering-result   (feature indians )(value F)))

)

(defrule  result-no-indians-4
        (declare (salience ?*highest-priority*))
        (result (feature filler) (value T))
        (result (feature family) (value T))
        (or
            (info (feature game-thematic) (value "no"))
            (info (feature game-strategy) (value "no"))
            (info (feature  game-strategy | game-challenging | game-explorative | game-hmovement | game-investigative | game-bidding |  game-bluff ) (value "yes"))
            (info (feature game-castles | game-farms | game-gothic | game-lovecraft | game-renaissance-court | game-tale | game-fantasy | game-futuristics ) (value "yes"))
            (info (feature game-fantasy) (value "yes"))
            (info (feature game-gothic) (value "yes"))
        
        )
        (not (result (feature indians)))
         =>
        (assert (infering-result   (feature indians )(value F)))

)

(defrule  result-no-fireworks
        (declare (salience ?*highest-priority*))
        (or (info (feature game-fireworks) (value " no"))
            (result (feature coop-comp) (value comp | coop\comp))
            (info (feature  game-thematic | game-strategy | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "yes"))
            (result (feature american | german | cardgame | filler | wargame | family) (value T))
        ) 
         =>
        (assert (infering-result   (feature fireworks )(value F)))

)
(defrule  result-no-survival-1
        (declare (salience ?*highest-priority*))
        (or     (info (feature game-survival) (value "no"))
                (result (feature german | cardgame | party | wargame | family) (value T))
                (result (feature explorative | wtdplacement | hmovement | investigative | bidding | bluff) (value T))
        )  
         =>
        (assert (infering-result  (feature survival )(value F)))
)

(defrule  result-no-survival-2
        (declare (salience ?*highest-priority*))
        (result (feature filler) (value T))
        (or 
            (not (info (feature game-players) (value "1")))
                 (info (feature game-thematic) (value "no"))
                 (info (feature game-strategy) (value "no"))
                 (info (feature game-challenging) (value "no"))
                 (info (feature game-indians ) (value  "no"))
                 (result (feature  explorative | hmovement | wtdplacement | investigative | bidding |  bluff ) (value T))
                 (info (feature game-greece | game-abstract | game-lovecraft | game-gothic | game-fantasy | game-merchants | game-indians | game-survival | game-castles | game-jewelry | game-farms | game-renaissance-court | game-merchants | game-tale | game-politics  | game-crime ) (value "yes"))
        )
         =>
        (assert (infering-result  (feature survival )(value F)))
)

(defrule  result-no-survival-3
        (declare (salience ?*highest-priority*))
        (result (feature american) (value T))
        (or 
            (info (feature game-challenging) (value "no"))
            (result (feature coop-comp) (value comp | coop\comp))
            (info (feature game-indians ) (value  "no"))
            (info (feature game-strategy | game-explorative | game-hmovement | game-wtdplacement | game-investigative |game-bidding |  game-bluff ) (value "yes")) 
            (info (feature game-war | game-fantasy | game-gothic | game-fantasy | game-futuristics | game-vampyric | game-pirates | game-lord-of-the-rings | game-tale | game-western | game-crime | game-lovecraft) (value "yes"))
        )
         =>
        (assert (infering-result  (feature survival )(value F)))
)


(defrule  result-no-forests
        (declare (salience ?*highest-priority*))
        (or (info (feature game-forests) (value "no"))
                    (result (feature german | american | filler | party | wargame | family) (value T))
                    (info (feature game-thematic) (value "no"))
                    (info (feature game-strategy) (value "no"))
                    (info (feature game-challenging) (value "no"))
                    (result (feature coop-comp) (value comp | coop\comp))
                    (info (feature game-abstract) (value "no"))
                    (not (info (feature game-players) (value "1" | "2")))
                     (info (feature  game-explorative | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "yes"))
        )
         =>
        (assert (infering-result  (feature forests )(value F)))

)
(defrule  result-no-industry
        (declare (salience ?*highest-priority*))
        (or (info (feature game-industry) (value "no"))

            (result (feature american | filler | cardgame | party | wargame | family) (value T))
            (not (info (feature user-budget) (value "45<65")))
            (info (feature game-challenging | game-explorative | game-hmovement | game-investigative | game-bluff )(value "yes")) 
            (info (feature  game-greece | game-merchants | game-restaurants | game-renaissance-court | game-castles | game-merchants | game-gothic | game-lovecraft| game-fantasy | game-chemistry | game-gala-hotel | game-trains) (value "yes"))
            (info (feature game-players) (value "6+"))                

        )    
         =>
        (assert (infering-result  (feature industry )(value F)))

)
(defrule  result-no-numbers
        (declare (salience ?*highest-priority*))
        (or     (info (feature game-numbers) (value "no"))
                (result (feature german | american |  filler | cardgame | party | wargame ) (value T))
                (result (feature coop-comp) (value comp | coop\comp))
                (info (feature  game-thematic | game-strategy | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "yes"))
                (info (feature game-players) (value "6" | "6+"))
        )
         =>
        (assert (infering-result  (feature numbers )(value F)))

)

(defrule  result-no-castles-1
        (declare (salience ?*highest-priority*))
        (or (info (feature game-castles) (value "no"))
            (result (feature explorative | hmovement) (value T))
            (result (feature coop-comp) (value comp))
            (info (feature game-players) (value "1" | "6+"))
        )    
         =>
        (assert (infering-result  (feature castles )(value F)))

)

(defrule  result-no-castles-2
        (declare (salience ?*highest-priority*))
        (result (feature german) (value T))
        (or 
            (result (feature weight) (value legerro | alto ))
            (not (info (feature user-budget) (value "34<44")))
            (info (feature  game-greece  | game-indians | game-renaissance-court | game-war | game-merchants | game-gothic | game-lovecraft| game-fantasy | game-indians | game-chemistry | game-gala-hotel | game-trains) (value "yes"))        
            (info (feature  game-thematic | game-challenging | game-explorative |  game-hmovement | game-investigative  |  game-bluff ) (value "yes")) 
        )
         =>
        (assert (infering-result  (feature castles )(value F)))

)

(defrule  result-no-castles-3
        (declare (salience ?*highest-priority*))
         (result (feature filler) (value T))
        (not (result  (feature party) (value T)))
        (not (result (feature family) (value T)))
        (or
             (info (feature  game-thematic | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff ) (value "yes"))
             (info (feature game-greece | game-abstract | game-lovecraft | game-gothic | game-fantasy | game-merchants | game-indians | game-survival | game-horror | game-futuristics | game-jewelry | game-lord-of-the-rings | game-renaissance-court | game-tale | game-politics | game-crime | game-farms) (value "yes"))
             (not (info (feature user-budget) (value  "<18" |"19<33"))) 
            (result (feature weight) (value medio | difficile))
        )
         =>
        (assert (infering-result  (feature castles )(value F)))

)

(defrule  result-no-castles-4
        (declare (salience ?*highest-priority*))
        
         =>
        (assert (infering-result  (feature castles )(value F)))

)

(defrule  result-no-vampyric
        (declare (salience ?*highest-priority*))
        (info (feature game-vampyric) (value "no"))
         =>
        (assert (infering-result  (feature vampyric )(value F)))

)

(defrule  result-no-renaissance-court
        (declare (salience ?*highest-priority*))
        (info (feature game-renaissance-court) (value "no"))
          =>
        (assert (infering-result  (feature renaissance-court )(value F)))

)
(defrule  result-no-pirates
        (declare (salience ?*highest-priority*))
        (info (feature game-pirates) (value "no"))
          =>
        (assert (infering-result  (feature  pirates )(value F)))

)

(defrule  result-no-witchcraft
        (declare (salience ?*highest-priority*))
        (info (feature game-witchcraft) (value "no"))
          =>
        (assert (infering-result  (feature  witchcraft)(value F)))

)


(defrule result-no-oriental
        (declare (salience ?*highest-priority*))
        (info (feature game-oriental) (value "no"))
          =>
        (assert (infering-result  (feature  oriental)(value F)))

)


(defrule result-no-glass
        (declare (salience ?*highest-priority*))
        (info (feature game-glass) (value "no"))
          =>
        (assert (infering-result  (feature  glass)(value F)))

)


(defrule result-no-chemistry
        (declare (salience ?*highest-priority*))
        (info (feature game-chemistry) (value "no"))
          =>
        (assert (infering-result  (feature  chemistry)(value F)))

)

(defrule result-no-lord-of-the-rings
        (declare (salience ?*highest-priority*))
        (info (feature game-lord-of-the-rings) (value "no"))
          =>
        (assert (infering-result  (feature  lord-of-the-rings)(value F)))

)


(defrule result-no-tale
        (declare (salience ?*highest-priority*))
        (info (feature game-tale) (value "no"))
          =>
        (assert (infering-result  (feature  tale)(value F)))

)

(defrule result-no-crime
        (declare (salience ?*highest-priority*))
        (info (feature game-crime) (value "no"))
          =>
        (assert (infering-result  (feature  crime)(value F)))

)

(defrule result-no-restaurants
        (declare (salience ?*highest-priority*))
        (info (feature game-restaurants) (value "no"))
          =>
        (assert (infering-result  (feature  restaurants)(value F)))

)

(defrule result-no-mafia
        (declare (salience ?*highest-priority*))
        (info (feature game-mafia) (value "no"))
          =>
        (assert (infering-result  (feature  mafia)(value F)))

)


(defrule result-no-politics
        (declare (salience ?*highest-priority*))
        (info (feature game-politics) (value "no"))
          =>
        (assert (infering-result  (feature  politics)(value F)))

)
