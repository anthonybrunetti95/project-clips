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
        (result (feature  explorative |wtdplacement | hmovement | bidding) (value F))

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


(defrule result-no-family 
        (declare (salience ?*highest-priority*))
        (or
            (inferred (feature weight) (value difficile))
            (info (feature game-wargame) (value "yes"))
            (info (feature game-cardgame) (value "yes"))
            (info (feature game-players) (value "1"))
            (result (feature explorative | hmovement | bidding) (value T))
            (info (feature user-budget) (value "66<110" | "110<"))
            (info (feature game-time) (value ">60"))
            (result (feature coop-comp) (value coop\comp))
        )
        =>
        (assert (infering-result (feature family) (value F)))

)


(defrule result-american-1
        (declare (salience ?*highest-priority*))
        (info (feature game-time) (value ">60"))
        (info (feature user-budget) (value "34<44" | "45<65" | "66<110" | "110<"))
        (info (feature game-thematic) (value "yes"))
        (not (inferred (feature weight) (value facile)))
        (not (info(feature strategy) (value "yes")))
        (result (feature   wtdplacement) (value F))
        (result (feature bidding) (value F))
        (result (feature strategy) (value F))
        (not (result (feature american)))
        =>
        (assert (infering-result (feature american) (value T)))

)
(defrule result-american-2
        (declare (salience ?*highest-priority*))
        (info (feature game-time) (value ">60"))
        (info (feature user-budget) (value "34<44" | "45<65" | "66<110" | "110<"))
        (info (feature game-thematic) (value "yes"))
        (inferred (feature weight) (value facile))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-explorative) (value "yes"))
        (info (feature game-strategy) (value "yes"))

        (result (feature wtdplacement) (value F))
        (result (feature bidding) (value F))
        (result (feature strategy) (value F))
        (result (feature coop-comp) (value coop\comp))
        (not (result (feature american)))
        =>
        (assert (infering-result (feature american) (value T)))

)

(defrule result-1players
         (declare (salience ?*highest-priority*))
         (inferred (feature 1players) (value T))
         =>
         (assert (infering-result (feature 1players) (value T)))
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