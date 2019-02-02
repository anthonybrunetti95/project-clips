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

(
(defrule infering-cardgame
        (declare (salience ?*highest-priority*))
        (info (feature game-cardgame) (value  "yes"))

        =>
        (assert (infering-result (feature cardgame) (value T) ))
)

(defrule infering-wargame 
        (declare (salience ?*high-priority*))
        (info (feature game-wargame) (value "yes"))
        =>
        (assert (infering-result (feature wargame) (value T)))
)       

(defrule infering-family 
        (declare (salience ?*high-priority*))
        (info (feature game-family) (value "yes"))
        =>
        (assert (infering-result (feature family) (value T)))
)       

(defrule infering-party 
        (declare (salience ?*high-priority*))
        (info (feature game-players) (value "5" | "6" | "6+"))
        (or     (inferred (feature weight) (value facile))
                (inferred (feature weight) (value medio)))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))


        =>
        (assert (infering-result (feature party) (value T)))
)       

(defrule infering-filler
        (declare (salience ?*high-priority*))
        (info (feature game-time) (value "<60"))
        (inferred (feature weight) (value facile))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))
        =>
        (assert (infering-result (feature filler) (value T)))
)

(defrule infering-german
        (declare (salience ?*high-priority*))
        (info (feature game-wtdplacement) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (result (feature coop-comp) (value comp))
        =>
        (assert (infering-result (feature german) (value T)))
)

(defrule infering-american 
        (declare (salience ?*high-priority*))
        (info (feature game-time) (value ">60"))
        (not(info (feature user-budget) (value "<18" | "19<33")))
        (info (feature game-thematic) (value "yes"))
        (not (inferred (feature weight) (value facile)))
        (not (info (feature game-wtdplacement) (value "yes")))
        =>
        (assert (infering-result (feature american) (value T)))

)

(defrule infering-1players
        (declare (salience ?*highest-priority*))
        (inferred (feature 1players) (value T))
        =>
        (assert (infering-result (feature 1players) (value T)))
)

(defrule infering-2players
        (declare (salience ?*highest-priority*))
        (inferred (feature 2players) (value T))
        =>
        (assert (infering-result (feature 2players) (value T)))
)


(defrule infering-3players
        (declare (salience ?*highest-priority*))
        (inferred (feature 3players) (value T))
        =>
        (assert (infering-result (feature 3players) (value T)))
)

(defrule infering-4players
        (declare (salience ?*highest-priority*))
        (inferred (feature 4players) (value T))
        =>
        (assert (infering-result (feature 4players) (value T)))
)

(defrule infering-5players
        (declare (salience ?*highest-priority*))
        (inferred (feature 5players) (value T))
        =>
        (assert (infering-result (feature 5players) (value T)))
)

(defrule infering-6players
        (declare (salience ?*highest-priority*))
        (inferred (feature 6players) (value T))
        =>
        (assert (infering-result (feature 6players) (value T)))
)

(defrule infering-+6players
        (declare (salience ?*highest-priority*))
        (inferred (feature +6players) (value T))
        =>
        (assert (infering-result (feature 6players+) (value T)))
)


(defrule infering-weight
        (declare (salience ?*highest-priority*))
        (inferred (feature weight) (value ?weight))
        =>
        (assert (infering-result (feature weight) (value ?weight)))
)

(defrule infering-coop
        (declare (salience ?*highest-priority*))
        (info (feature game-coop) (value "yes"))
        (info (feature game-comp) (value "no"))
        =>
        (assert (infering-result (feature coop-comp) (value coop)))
)

(defrule infering-comp
        (declare (salience ?*highest-priority*))
        (info (feature game-comp) (value "yes"))
        (info (feature game-coop) (value "no"))
        =>
        (assert (infering-result (feature coop-comp) (value comp)))
)

(defrule infering-coop-comp
        (declare (salience ?*highest-priority*))
        (info (feature game-coop) (value "yes"))
        (info (feature game-comp) (value "yes"))
        =>
        (assert (infering-result (feature coop-comp) (value coop\comp)))
)


(defrule infering-greece
        (declare (salience ?*highest-priority*))
        (info (feature game-greece) (value "yes"))
        =>
        (assert (infering-result (feature greece) (value T)))

)

(defrule infering-roman
        (declare (salience ?*highest-priority*))
        (info (feature game-roman) (value "yes"))
        =>
        (assert (infering-result (feature roman )(value T)))

)
(defrule infering-western
        (declare (salience ?*highest-priority*))
        (info (feature game-western) (value "yes"))
         =>
        (assert (infering-result (feature western )(value T)))

)
(defrule infering-horror
        (declare (salience ?*highest-priority*))
        (info (feature game-horror) (value "yes"))
         =>
        (assert (infering-result (feature horror )(value T)))

)
(defrule infering-gothic
        (declare (salience ?*highest-priority*))
        (info (feature game-gothic) (value "yes"))
         =>
        (assert (infering-result (feature gothic )(value T)))

)

(defrule infering-lovecraft
        (declare (salience ?*highest-priority*))
        (info (feature game-lovecraft) (value "yes"))
         =>
        (assert (infering-result (feature lovecraft )(value T)))

)
(defrule infering-war
        (declare (salience ?*highest-priority*))
        (info (feature game-war) (value "yes"))
         =>
        (assert (infering-result (feature war )(value T)))

)
(defrule infering-abstract
        (declare (salience ?*highest-priority*))
        (info (feature game-abstract) (value "yes"))
         =>
        (assert (infering-result (feature abstract )(value T)))
)
(defrule infering-fantasy
        (declare (salience ?*highest-priority*))
        (info (feature game-fantasy) (value "yes"))
         =>
        (assert (infering-result (feature fantasy )(value T)))

)
(defrule infering-farms
        (declare (salience ?*highest-priority*))
        (info (feature game-farms) (value "yes"))
         =>
        (assert (infering-result(feature farms )(value T)))
)

(defrule infering-futuristics
        (declare (salience ?*highest-priority*))
        (info (feature game-futuristics) (value "yes"))
         =>
        (assert (infering-result(feature futuristics )(value T)))
)
(defrule infering-merchants
        (declare (salience ?*highest-priority*))
        (info (feature game-merchants) (value "yes"))
         =>
        (assert (infering-result(feature merchants )(value T)))

)
(defrule infering-indians
        (declare (salience ?*highest-priority*))
        (info (feature game-indians) (value "yes"))
         =>
        (assert (infering-result (feature indians )(value T)))

)
(defrule infering-fireworks
        (declare (salience ?*highest-priority*))
        (info (feature game-fireworks) (value "yes"))
         =>
        (assert (infering-result (feature fireworks )(value T)))

)
(defrule infering-survival
        (declare (salience ?*highest-priority*))
        (info (feature game-survival) (value "yes"))
         =>
        (assert (infering-result(feature survival )(value T)))
)
(defrule infering-forests
        (declare (salience ?*highest-priority*))
        (info (feature game-forests) (value "yes"))
         =>
        (assert (infering-result(feature forests )(value T)))

)
(defrule infering-industry
        (declare (salience ?*highest-priority*))
        (info (feature game-industry) (value "yes"))
         =>
        (assert (infering-result(feature industry )(value T)))

)
(defrule infering-numbers
        (declare (salience ?*highest-priority*))
        (info (feature game-numbers) (value "yes"))
         =>
        (assert (infering-result(feature numbers )(value T)))

)

(defrule infering-castles
        (declare (salience ?*highest-priority*))
        (info (feature game-castles) (value "yes"))
         =>
        (assert (infering-result(feature castles )(value T)))

)
(defrule infering-vampyric
        (declare (salience ?*highest-priority*))
        (info (feature game-vampyric) (value "yes"))
         =>
        (assert (infering-result(feature vampyric )(value T)))

)

(defrule infering-renaissance-court
        (declare (salience ?*highest-priority*))
        (info (feature game-renaissance-court) (value "yes"))
          =>
        (assert (infering-result(feature renaissance-court )(value T)))

)
(defrule infering-pirates
        (declare (salience ?*highest-priority*))
        (info (feature game-pirates) (value "yes"))
          =>
        (assert (infering-result(feature  pirates)(value T)))

)

(defrule infering-witchcraft
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




