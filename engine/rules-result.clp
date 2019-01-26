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
		(if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Result: "(upcase ?feature)  ?value))
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

(defrule inferred-wargame 
        (declare (salience ?*high-priority*))
        (info (feature game-wargame) (value "yes"))
        =>
        (assert (infering-result (feature wargame) (value T)))
)       

(defrule inferred-family 
        (declare (salience ?*high-priority*))
        (info (feature game-family) (value "yes"))
        =>
        (assert (infering-result (feature family) (value T)))
)       

(defrule inferred-party 
        (declare (salience ?*high-priority*))
        (info (feature game-players) (value "5" | "6" | "+6"))
        (or     (info (feature user-experience) (value "facile" | "medio"))
                (info (feature group-experience) (value "facile" | "medio")))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))


        =>
        (assert (infering-result (feature party) (value T)))
)       

(defrule inferred-filler
        (declare (salience ?*high-priority*))
        (info (feature game-time) (value "<60"))
        (inferred (feature experience) (value facile))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))
        =>
        (assert (infering-result (feature filler) (value T)))
)

(defrule inferred-german
        (declare (salience ?*high-priority*))
        (info (feature game-wtdplacement) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-comp) (value "yes"))
        =>
        (assert (infering-result (feature german) (value T)))
)

(defrule inferred-american 
        (declare (salience ?*high-priority*))
        (info (feature game-time) (value ">60"))
        (info (feature user-budget) (value "<18" | "19<33"))
        (info (feature game-thematic) (value "yes"))
        (not (inferred (feature weight) (value facile)))
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
        (assert (infering-result (feature 2players)) (value T))
)


(defrule infering-3players
        (declare (salience ?*highest-priority*))
        (inferred (feature 3players) (value T))
        =>
        (assert (infering-result (feature 3players)) (value T))
)

(defrule infering-4players
        (declare (salience ?*highest-priority*))
        (inferred (feature 4players) (value T))
        =>
        (assert (infering-result (feature 4players)) (value T))
)

(defrule infering-5players
        (declare (salience ?*highest-priority*))
        (inferred (feature 5players) (value T))
        =>
        (assert (infering-result (feature 5players)) (value T))
)

(defrule infering-6players
        (declare (salience ?*highest-priority*))
        (inferred (feature 6players) (value T))
        =>
        (assert (infering-result (feature 6players)) (value T))
)

(defrule infering-+6players
        (declare (salience ?*highest-priority*))
        (inferred (feature +6players) (value T))
        =>
        (assert (infering-result (feature +6players)) (value T))
)





