;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;   REGOLE DI INFERENZA PER I FATTI INFERRED INTERMEDI  ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule infer-feature
        (declare (salience ?*top-priority*))
        ?f1 <- (infering (feature ?feature) (value ?value))
        (not (inferred (feature ?feature)))
        (last-question (question ?last))
        =>
        (retract ?f1)
        (assert (inferred (feature ?feature) (value ?value) (number ?last)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Inferred: " (upcase ?feature)  (upcase ?value)))
)

(defrule not-infer-already-inferred-feature
        (declare (salience ?*top-priority*))
        ?f1 <- (infering (feature ?feature) (value ?value))
        (inferred (feature ?feature))
        =>
        (retract ?f1)
)


;;====================================================;;

(defrule inferred-age-child
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "0<10"))
        =>
        (assert (infering (feature age) (value "child")))
)

(defrule inferred-age-boy
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "10<20"))
        =>
        (assert (infering (feature age) (value "boy")))
)

(defrule inferred-age-young
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "20<30"|"30<40"))
        =>
        (assert (infering (feature age) (value "young")))
)

(defrule inferred-age-adult
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "40<50"|"50<60"|"60<70"))
        =>
        (assert (infering (feature age) (value "adult")))
)

(defrule inferred-age-elder
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "70<")) 
        =>
        (assert (infering (feature age) (value "elder")))
)


(defrule inferred-weight-easy
         (declare (salience ?*high-priority*))
         (or (info (feature user-experience) (value "zero"))
                (info(feature user-experience) (value "litle")))
         =>
         (assert (infering (feature weight) (value "facile"))))


(defrule inferred-weight-medium
         (declare (salience ?*high-priority*))
         (info (feature user-experience) (value "normal"))
                
         =>
         (assert (infering (feature weight) (value "medio"))))


(defrule inferred-weight-high
        (declare (salience ?*high-priority*))
        (info (feature user-experience) (value "high"))
          
        =>
        (assert (infering (feature weight) (value "difficile"))))