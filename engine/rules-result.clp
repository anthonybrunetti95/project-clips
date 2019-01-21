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

(defrule infering-wargame
        (declare (salience ?*highest-priority*))
        (inferred (feature wargame) (value ?wargame))

        =>
        (assert (infering-result (feature wargame) (value ?wargame)))
)


(defrule infering-filler
        (declare (salience ?*highest-priority*))
        (inferred (feature filler) (value ?filler))

        =>
        (assert (infering-result (feature filler) (value ?filler)))
)


(defrule infering-party 
        (declare (salience ?*highest-priority*))
        (inferred (feature pary) (value  ?party))

        =>
        (assert (infering-result (feature party) (value ?party)))
)


(defrule infering-family
        (declare (salience ?*highest-priority*))
        (inferred (feature family) (value  ?family))

        =>
        (assert (infering-result (feature family) (value ?family) ))
)

(defrule infering-cardgame
        (declare (salience ?*highest-priority*))
        (inferred (feature cardgame) (value  ?cardgame))

        =>
        (assert (infering-result (feature cardgame) (value ?cardgame) ))
)


(defrule infering-1players
        (declare (salience ?*highest-priority*))
        (inferred (feature 1players) (value ?players))
        =>
        (assert (infering-result (feature 1players)) (value ?players))
)

(defrule infering-2players
        (declare (salience ?*highest-priority*))
        (inferred (feature 2players) (value ?players))
        =>
        (assert (infering-result (feature 2players)) (value ?players))
)


(defrule infering-3players
        (declare (salience ?*highest-priority*))
        (inferred (feature 3players) (value ?players))
        =>
        (assert (infering-result (feature 3players)) (value ?players))
)

(defrule infering-4players
        (declare (salience ?*highest-priority*))
        (inferred (feature 4players) (value ?players))
        =>
        (assert (infering-result (feature 4players)) (value ?players))
)

(defrule infering-5players
        (declare (salience ?*highest-priority*))
        (inferred (feature 5players) (value ?players))
        =>
        (assert (infering-result (feature 5players)) (value ?players))
)

(defrule infering-6players
        (declare (salience ?*highest-priority*))
        (inferred (feature 6players) (value ?players))
        =>
        (assert (infering-result (feature 6players)) (value ?players))
)