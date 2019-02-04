;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;     REGOLE DI INFERENZA PER I FATTI RESULT FINALI     ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule infering-result
		(declare (salience ?*top-priority*))
		?f1 <- (infering-result (feature ?feature) (value ?value))
		(not (result (feature ?feature)))
		(last-question (question ?last))
		=>
		(retract ?f1)
		(assert (result (feature ?feature) (value ?value) (number ?last)))
		(if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Result: "(upcase ?feature) " " ?value))
)

(defrule not-infering-already-inferred-result
		(declare (salience ?*top-priority*))
		?f1 <- (infering-result (feature ?feature) (value ?value))
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
        (declare (salience ?*high-priority*))
        (info (feature game-wargame) (value "yes"))
        =>
        (assert (infering-result (feature wargame) (value T)))
)       

(defrule result-family 
        (declare (salience ?*high-priority*))
        (info (feature game-family) (value "yes"))
        =>
        (assert (infering-result (feature family) (value T)))
)       

(defrule result-party 
        (declare (salience ?*high-priority*))
        (info (feature game-players) (value "5" | "6" | "6+"))
        (or     (inferred (feature weight) (value facile))
                (inferred (feature weight) (value medio)))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))


        =>
        (assert (infering-result (feature party) (value T)))
)    



(defrule result-filler
        (declare (salience ?*high-priority*))
        (info (feature game-time) (value "<60"))
        (inferred (feature weight) (value facile))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))
        =>
        (assert (infering-result (feature filler) (value T)))
)

(defrule result-german
        (declare (salience ?*high-priority*))
        (info (feature game-wtdplacement) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (result (feature coop-comp) (value comp))
        =>
        (assert (infering-result (feature german) (value T)))
)

(defrule result-american 
        (declare (salience ?*high-priority*))
        (info (feature game-time) (value ">60"))
        (not(info (feature user-budget) (value "<18" | "19<33")))
        (info (feature game-thematic) (value "yes"))
        ;(not (inferred (feature weight) (value facile)))
        (not (info (feature game-wtdplacement) (value "yes")))
        (not(info (feature game-bidding) (value "yes")))
        =>
        (assert (infering-result (feature american) (value T)))

)

(defrule result-thematic
        (declare (salience ?*high-priority*))
        (info (feature  game-thematic) (value "yes"))
        =>
        (assert (infering-result (feature game-thematic) (value T)))
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

(defrule result-1players
        (declare (salience ?*highest-priority*))
        (inferred (feature 1players) (value T))
        =>
        (assert (infering-result (feature 1players) (value T)))
)

(defrule result-2players
        (declare (salience ?*highest-priority*))
        (inferred (feature 2players) (value T))
        =>
        (assert (infering-result (feature 2players) (value T)))
)


(defrule result-3players
        (declare (salience ?*highest-priority*))
        (inferred (feature 3players) (value T))
        =>
        (assert (infering-result (feature 3players) (value T)))
)

(defrule result-4players
        (declare (salience ?*highest-priority*))
        (inferred (feature 4players) (value T))
        =>
        (assert (infering-result (feature 4players) (value T)))
)

(defrule result-5players
        (declare (salience ?*highest-priority*))
        (inferred (feature 5players) (value T))
        =>
        (assert (infering-result (feature 5players) (value T)))
)

(defrule result-6players
        (declare (salience ?*highest-priority*))
        (inferred (feature 6players) (value T))
        =>
        (assert (infering-result (feature 6players) (value T)))
)

(defrule result-+6players
        (declare (salience ?*highest-priority*))
        (inferred (feature +6players) (value T))
        =>
        (assert (infering-result (feature 6players+) (value T)))
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
(defrule result-western
        (declare (salience ?*highest-priority*))
        (info (feature game-western) (value "yes"))
         =>
        (assert (infering-result (feature western )(value T)))

)
(defrule result-horror
        (declare (salience ?*highest-priority*))
        (info (feature game-horror) (value "yes"))
         =>
        (assert (infering-result (feature horror )(value T)))

)
(defrule result-gothic
        (declare (salience ?*highest-priority*))
        (info (feature game-gothic) (value "yes"))
         =>
        (assert (infering-result (feature gothic )(value T)))

)

(defrule result-lovecraft
        (declare (salience ?*highest-priority*))
        (info (feature game-lovecraft) (value "yes"))
         =>
        (assert (infering-result (feature lovecraft )(value T)))

)
(defrule result-war
        (declare (salience ?*highest-priority*))
        (info (feature game-war) (value "yes"))
         =>
        (assert (infering-result (feature war )(value T)))

)
(defrule result-abstract
        (declare (salience ?*highest-priority*))
        (info (feature game-abstract) (value "yes"))
         =>
        (assert (infering-result (feature abstract )(value T)))
)
(defrule result-fantasy
        (declare (salience ?*highest-priority*))
        (info (feature game-fantasy) (value "yes"))
         =>
        (assert (infering-result (feature fantasy )(value T)))

)
(defrule result-farms
        (declare (salience ?*highest-priority*))
        (info (feature game-farms) (value "yes"))
         =>
        (assert (infering-result(feature farms )(value T)))
)

(defrule result-futuristics
        (declare (salience ?*highest-priority*))
        (info (feature game-futuristics) (value "yes"))
         =>
        (assert (infering-result(feature futuristics )(value T)))
)
(defrule result-merchants
        (declare (salience ?*highest-priority*))
        (info (feature game-merchants) (value "yes"))
         =>
        (assert (infering-result(feature merchants )(value T)))

)
(defrule result-indians
        (declare (salience ?*highest-priority*))
        (info (feature game-indians) (value "yes"))
         =>
        (assert (infering-result (feature indians )(value T)))

)
(defrule result-fireworks
        (declare (salience ?*highest-priority*))
        (info (feature game-fireworks) (value "yes"))
         =>
        (assert (infering-result (feature fireworks )(value T)))

)
(defrule result-survival
        (declare (salience ?*highest-priority*))
        (info (feature game-survival) (value "yes"))
         =>
        (assert (infering-result(feature survival )(value T)))
)
(defrule result-forests
        (declare (salience ?*highest-priority*))
        (info (feature game-forests) (value "yes"))
         =>
        (assert (infering-result(feature forests )(value T)))

)
(defrule result-industry
        (declare (salience ?*highest-priority*))
        (info (feature game-industry) (value "yes"))
         =>
        (assert (infering-result(feature industry )(value T)))

)
(defrule result-numbers
        (declare (salience ?*highest-priority*))
        (info (feature game-numbers) (value "yes"))
         =>
        (assert (infering-result(feature numbers )(value T)))

)

(defrule result-castles
        (declare (salience ?*highest-priority*))
        (info (feature game-castles) (value "yes"))
         =>
        (assert (infering-result(feature castles )(value T)))

)
(defrule result-vampyric
        (declare (salience ?*highest-priority*))
        (info (feature game-vampyric) (value "yes"))
         =>
        (assert (infering-result(feature vampyric )(value T)))

)

(defrule result-renaissance-court
        (declare (salience ?*highest-priority*))
        (info (feature game-renaissance-court) (value "yes"))
          =>
        (assert (infering-result(feature renaissance-court )(value T)))

)
(defrule result-pirates
        (declare (salience ?*highest-priority*))
        (info (feature game-pirates) (value "yes"))
          =>
        (assert (infering-result(feature  pirates)(value T)))

)

(defrule result-witchcraft
        (declare (salience ?*highest-priority*))
        (info (feature game-witchcraft) (value "yes"))
          =>
        (assert (infering-result(feature  witchcraft)(value T)))

)


(defrule infering-oriental
        (declare (salience ?*highest-priority*))
        (info (feature game-oriental) (value "yes"))
          =>
        (assert (infering-result(feature  oriental)(value T)))

)


(defrule infering-glass
        (declare (salience ?*highest-priority*))
        (info (feature game-glass) (value "yes"))
          =>
        (assert (infering-result(feature  glass)(value T)))

)


(defrule infering-chemistry
        (declare (salience ?*highest-priority*))
        (info (feature game-chemistry) (value "yes"))
          =>
        (assert (infering-result(feature  chemistry)(value T)))

)

(defrule infering-lord-of-the-rings
        (declare (salience ?*highest-priority*))
        (info (feature game-lord-of-the-rings) (value "yes"))
          =>
        (assert (infering-result(feature  lord-of-the-rings)(value T)))

)


(defrule infering-tale
        (declare (salience ?*highest-priority*))
        (info (feature game-tale) (value "yes"))
          =>
        (assert (infering-result(feature  tale)(value T)))

)

(defrule infering-crime
        (declare (salience ?*highest-priority*))
        (info (feature game-crime) (value "yes"))
          =>
        (assert (infering-result(feature  crime)(value T)))

)

(defrule infering-restaurants
        (declare (salience ?*highest-priority*))
        (info (feature game-restaurants) (value "yes"))
          =>
        (assert (infering-result(feature  restaurants)(value T)))

)

(defrule infering-mafia
        (declare (salience ?*highest-priority*))
        (info (feature game-mafia) (value "yes"))
          =>
        (assert (infering-result(feature  mafia)(value T)))

)


(defrule infering-politics
        (declare (salience ?*highest-priority*))
        (info (feature game-politics) (value "yes"))
          =>
        (assert (infering-result(feature  politics)(value T)))

)




