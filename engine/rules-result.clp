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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;