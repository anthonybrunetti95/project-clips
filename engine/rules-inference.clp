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
        (assert (infering (feature age) (value child)))
)

(defrule inferred-age-boy
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "10<20"))
        =>
        (assert (infering (feature age) (value boy)))
)

(defrule inferred-age-young
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "20<30"|"30<40"))
        =>
        (assert (infering (feature age) (value young)))
)

(defrule inferred-age-adult
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "40<50"|"50<60"|"60<70"))
        =>
        (assert (infering (feature age) (value adult)))
)

(defrule inferred-age-elder
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "70<")) 
        =>
        (assert (infering (feature age) (value elder)))
)


;; infered age-group
;; infered-group-experince
(defrule inferred-group-weight-easy
         (declare (salience ?*high-priority*))
         (or (info (feature group-experience) (value "zero"))
                (info(feature user-experience) (value "litle")))
         =>
         (assert (infering (feature weight) (value facile)))
)

(defrule inferred-group-weight-medium
         (declare (salience ?*high-priority*))
         (info (feature group-experience) (value "normal"))     
         =>
         (assert (infering (feature weight) (value medio)))
)


(defrule inferred-group-weight-high
        (declare (salience ?*high-priority*))
        (info (feature group-experience) (value "high"))
        =>
        (assert (infering (feature weight) (value difficile)))
)



(defrule inferred-weight-easy
         (declare (salience ?*high-priority*))
         (or (info (feature user-experience) (value "zero"))
                (info(feature user-experience) (value "litle")))
         =>
         (assert (infering (feature weight) (value facile)))
)

(defrule inferred-weight-medium
         (declare (salience ?*high-priority*))
         (info (feature user-experience) (value "normal"))     
         =>
         (assert (infering (feature weight) (value medio)))
)


(defrule inferred-weight-high
        (declare (salience ?*high-priority*))
        (info (feature user-experience) (value "high"))
        =>
        (assert (infering (feature weight) (value difficile)))
)


(defrule inferred-1players
         (info (feature game-players) (value "1"))
        =>
        (assert (infering (feature 1players) (value T)))
)

(defrule inferred-2players
         (declare (salience ?*high-priority*))
         (info (feature game-players) (value "2"))
        =>
        (assert (infering (feature 2players) (value T)))
)

(defrule inferred-3players
         (declare (salience ?*high-priority*))
         (info (feature game-players) (value "3"))
        =>
        (assert (infering (feature 3players) (value T)))
)

(defrule inferred-4players
         (declare (salience ?*high-priority*))
         (info (feature game-players) (value "4"))
        =>
        (assert (infering (feature 4players) (value T)))
)

(defrule inferred-5players
         (declare (salience ?*high-priority*))
         (info (feature game-players) (value "5"))
        =>
        (assert (infering (feature 5players) (value T)))
)

(defrule inferred-6players
         (declare (salience ?*high-priority*))
         (info (feature game-players) (value "6"))
        =>
        (assert (infering (feature 6players) (value T)))
)

(defrule inferred-6players+
         (declare (salience ?*high-priority*))
         (info (feature game-players) (value "6+"))
        =>
        (assert (infering (feature 6players+) (value T)))
)

(defrule inferred-party
         (declare (salience ?*high-priority*))
         (info (feature game-players) (value "6+"))
        =>
        (assert (infering (feature party) (value T))))


(defrule inferred-filler 
        (declare (salience ?*high-priority*))
        (info (feature game-time) (value "<60"))
        =>
        (assert(infering (feature filler) (value T)))
)

(defrule inferred-family
       (declare (salience ?*high-priority*))
       (info (feature game-family) (value "yes"))
       =>
       (assert (infering (feature family) (value T)))
)

(defrule inferred-cardgame 
        (declare (salience ?*high-priority*))
        (info (feature game-cardgame) (value "yes"))
        =>
        (assert (infering (feature cardgame) (value T)))
)

(defrule inferred-wargame
         (declare (salience ?*high-priority*))
         (info (feature game-wargame) (value "yes"))
         =>
         (assert (infering (feature wargame) (value T)))
)


                                       

