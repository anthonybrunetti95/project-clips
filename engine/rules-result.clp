;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;     REGOLE DI INFERENZA PER I FATTI RESULT FINALI     ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule infer-result
		(declare (salience ?*top-priority*))
		?f1 <- (infering-result (feature ?feature) (value ?value))
		(not (result (feature ?feature)))
		(last-question (question ?last))
		=>
		(retract ?f1)
		(assert (result (feature ?feature) (value ?value) (number ?last)))
		(if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Result: "(upcase ?feature) " " ?value))
)

(defrule not-infer-already-inferred-result
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
        (info (feature game-comp) (value "yes"))
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

(defrule infering-comp
        (declare (salience ?*highest-priority*))
        (info (feature game-coop) (value "yes"))
        (info (feature game-comp) (value "yes"))
        =>
        (assert (infering-result (feature coop-comp) (value coop\comp)))
)

