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


        =>
        (assert (infering-result (feature party) (value T)))
)    



(defrule result-filler
        (declare (salience ?*highest-priority*))
        (info (feature game-time) (value "<60"))
        (inferred (feature weight) (value facile))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))
        (not (result (feature german) (value T)))
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

(defrule result-american-1 
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
(defrule result-american-2
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
        (info (feature  game-thematic) (value "no"))
        =>
        (assert (infering-result (feature thematic) (value F)))
)

(defrule result-no-strategy
        (declare (salience ?*high-priority*))
        (info (feature  game-strategy) (value "no"))
        =>
        (assert (infering-result (feature strategy) (value F)))
)


(defrule result-no-challenging
        (declare (salience ?*high-priority*))
        (info (feature  game-challenging) (value "no"))
        =>
        (assert (infering-result (feature challenging) (value F)))
)


(defrule result-no-explorative
        (declare (salience ?*high-priority*))
         (info (feature  game-explorative) (value "no"))
        =>
        (assert (infering-result   (feature explorative) (value F)))
)

(defrule result-no-wtdplacement
        (declare (salience ?*high-priority*))
         (info (feature  game-wtdplacement) (value "no"))
        =>
        (assert (infering-result (feature wtdplacement) (value F)))
)

(defrule result-no-hmovement
        (declare (salience ?*high-priority*))
         (info (feature  game-hmovement) (value "no"))
        =>
        (assert (infering-result   (feature hmovement) (value F)))
)

(defrule result-no-investigative
        (declare (salience ?*high-priority*))
         (info (feature  game-investigative) (value "no"))
        =>
        (assert (infering-result (feature investigative) (value F)))
)

(defrule result-no-bidding
        (declare (salience ?*high-priority*))
         (info (feature  game-bidding) (value "no"))
        =>
        (assert (infering-result (feature bidding) (value F)))
)

(defrule result-no-bluff
        (declare (salience ?*high-priority*))
         (info (feature  game-bluff) (value "no"))
        =>
        (assert (infering-result (feature bluff) (value F)))
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


(defrule  result-no-greece
        (declare (salience ?*highest-priority*))
        (info (feature game-greece) (value "no"))
        =>
        (assert (infering-result   (feature greece) (value F)))

)

(defrule result-no-roman
        (declare (salience ?*highest-priority*))
        (info (feature game-roman) (value "no"))
        =>
        (assert (infering-result   (feature roman )(value F)))

)
(defrule result-no-western
        (declare (salience ?*highest-priority*))
        (info (feature game-western) (value "no"))
         =>
        (assert (infering-result   (feature western )(value F)))

)
(defrule result-no-horror
        (declare (salience ?*highest-priority*))
        (info (feature game-horror) (value "no"))
         =>
        (assert (infering-result   (feature horror )(value F)))

)
(defrule  result-no-gothic
        (declare (salience ?*highest-priority*))
        (info (feature game-gothic) (value "no"))
         =>
        (assert (infering-result   (feature gothic )(value F)))

)

(defrule  result-no-lovecraft
        (declare (salience ?*highest-priority*))
        (info (feature game-lovecraft) (value "no"))
         =>
        (assert (infering-result   (feature lovecraft )(value F)))

)
(defrule  result-no-war
        (declare (salience ?*highest-priority*))
        (info (feature game-war) (value "no"))
         =>
        (assert (infering-result   (feature war )(value F)))

)
(defrule  result-no-abstract
        (declare (salience ?*highest-priority*))
        (info (feature game-abstract) (value "no"))
         =>
        (assert (infering-result   (feature abstract )(value F)))
)
(defrule  result-no-fantasy
        (declare (salience ?*highest-priority*))
        (info (feature game-fantasy) (value "no"))
         =>
        (assert (infering-result   (feature fantasy )(value F)))

)
(defrule  result-no-farms
        (declare (salience ?*highest-priority*))
        (info (feature game-farms) (value "no"))
         =>
        (assert (infering-result  (feature farms )(value F)))
)

(defrule  result-no-futuristics
        (declare (salience ?*highest-priority*))
        (info (feature game-futuristics) (value "no"))
         =>
        (assert (infering-result  (feature futuristics )(value F)))
)
(defrule  result-no-merchants
        (declare (salience ?*highest-priority*))
        (info (feature game-merchants) (value " no"))
         =>
        (assert (infering-result  (feature merchants )(value F)))

)
(defrule  result-no-indians
        (declare (salience ?*highest-priority*))
        (info (feature game-indians) (value " no"))
         =>
        (assert (infering-result   (feature indians )(value F)))

)
(defrule  result-no-fireworks
        (declare (salience ?*highest-priority*))
        (info (feature game-fireworks) (value " no"))
         =>
        (assert (infering-result   (feature fireworks )(value F)))

)
(defrule  result-no-survival
        (declare (salience ?*highest-priority*))
        (info (feature game-survival) (value "no"))
         =>
        (assert (infering-result  (feature survival )(value F)))
)
(defrule  result-no-forests
        (declare (salience ?*highest-priority*))
        (info (feature game-forests) (value "no"))
         =>
        (assert (infering-result  (feature forests )(value F)))

)
(defrule  result-no-industry
        (declare (salience ?*highest-priority*))
        (info (feature game-industry) (value "no"))
         =>
        (assert (infering-result  (feature industry )(value F)))

)
(defrule  result-no-numbers
        (declare (salience ?*highest-priority*))
        (info (feature game-numbers) (value "no"))
         =>
        (assert (infering-result  (feature numbers )(value F)))

)

(defrule  result-no-castles
        (declare (salience ?*highest-priority*))
        (info (feature game-castles) (value "no"))
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
