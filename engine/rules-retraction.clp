;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                 REGOLE PER LA RITRATTAZIONE           ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defglobal ?*flag_retract_inference* = FALSE)
(defrule retraction
	(declare (salience ?*highest-priority*))
	(last-question (question ?last))
	(retraction)
	?f1 <- (ask-retraction)
	=>
	(retract ?f1)
	(ask-boolean retraction ?last)
)


(defrule print-qna 
    (declare (salience ?*top-priority*))
    (last-question (question ?last))
    (asked-question (question ?question) (number ?num) (answer ?answer))
    ?f1 <- (print-qna ?number)
    (test (eq ?number ?num)) 
    (test (>= ?last ?number))
    =>
    (refresh find-hypotetical-final-board-game)
    (refresh cant-find-any-final-board-game)
    (refresh find-hypotetical-final-board-game-1-player)
    
    (retract ?f1)
    (if (eq ?number 1)
     then (printout t crlf "  *****************   DOMANDE   *****************  " crlf))
    (print-question ?question ?number)
    (print-answers ?question ?answer)
    (if (eq ?number ?last)
     then (printout t crlf "  ***********************************************    " crlf crlf)
          (bind ?*flag_retract_inference*  TRUE)
          (bind $?list-values (subseq$ (create$ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50) 1 ?last))
          (ask retraction-number ?last $?list-values)
     else (printout t crlf)
          (assert (print-qna (+ ?num 1))))
)


(defrule pull-question
        (declare (salience ?*highest-priority*))
        ?f1 <- (asked-questions (question $?asked-questions))
        ?f2 <- (asked-question (question ?q) (number ?n) (values $?v))
        ?f3 <- (last-question (question ?last))
        ?f4 <- (pull-question ?number)
        (test (eq ?last ?n))
        (test (member$ ?q $?asked-questions))
        =>
        (bind $?asked (delete$ $?asked-questions ?last ?last))
        (modify ?f1 (question $?asked))
        (retract ?f2) 
        (assert (retract-info ?q))
        (if (eq ?last ?number) 
         then (retract ?f4)
              (modify ?f3 (question ?last))
              (assert (retract-configuration))
              (assert (reask ?q ?last $?v))
         else (modify ?f3 (question (- ?last 1))) )
)

(defrule reask-question
        (declare (salience ?*high-priority*))
        ?f1 <- (asked-questions (question $?asked-questions))
        ?f2 <- (reask ?q ?n $?v)
        ?f3 <- (reasked-question)
        ?f4 <- (retraction)
        ?f5 <- (retract-configuration)
        =>
        (retract ?f2 ?f3 ?f4 ?f5)
        (modify ?f1 (question $?asked-questions ?q))
        (ask ?q ?n $?v)
)

(defrule retract-user-budget
    (declare (salience ?*top-priority*))
    (retract-info user-budget)
    ?f1 <- (user-budget)
    =>
    (retract ?f1)
)

(defrule retract-game-time
    (declare (salience ?*top-priority*))
    ?f1 <- (retract-info game-time)
    =>
    (retract ?f1)
)

(defrule retract-user-age
    (declare (salience ?*top-priority*))
    ?f1 <- (retract-info user-age)
    =>
    (retract ?f1)

)

(defrule retract-game-players
    (declare (salience ?*top-priority*))
    ?f1 <- (retract-info game-players)
    =>
    (retract ?f1)

)

(defrule retract-info
        (declare (salience ?*highest-priority*))
        ?f1 <- (retract-info ?info)
        ?f2 <- (info (question ?question)) 
        (test (eq ?info ?question))
        =>
        (retract ?f1 ?f2)
)

(defrule retract-instance
      (declare (salience ?*top-priority*))
        (retract-configuration)
        ?f1 <- (inferred (feature ?value) (number ?n))
        (reasked-question (question ?q))
        (test (or (> ?n ?q) (eq ?n ?q)))
       
        
        =>

        (bind ?ggk (send [ggk] get-general-kind))
        (if(and (>(length$ ?ggk) 0)  (eq ?*flag_retract_inference* TRUE))
            then
            (bind ?gsk (send [gsk] get-secondary-kind))
            (bind ?gte (send [gte] get-thematic-environment))
            
            (if(not (eq (member$ ?value $?ggk) FALSE))
                then
                    (slot-delete$ [ggk] general-kind (member$ ?value $?ggk) (length$ ?ggk))
                    (send [ggk] print)
                    (if (> (length$ ?gsk) 0) then (slot-delete$ [gsk] secondary-kind 1 (length$ ?gsk)))
                    (if (> (length$ ?gte) 0) then (slot-delete$ [gte] thematic-environment 1  (length$ ?gte)))
                    (bind ?*flag_retract_inference*  FALSE)
                (printout t "eliminato ggk" crlf crlf)
                else  
                (if (not (eq (member$ ?value $?gsk) FALSE))
                    then 
                        (slot-delete$ [gsk] secondary-kind (member$ ?value $?gsk) (length$ ?gsk))
                        (send [gsk] print)
                        (if (> (length$ ?gte) 0) then (slot-delete$ [gte] thematic-environment 1  (length$ ?gte)))
                        (bind ?*flag_retract_inference*  FALSE)
                    (printout t "eliminato gsk" crlf crlf)
                    else
                        (if (not (eq (member$ ?value $?gte) FALSE))
                        then
                            (slot-delete$ [gte] thematic-environment (member$ ?value $?gte) (length$ ?gte))
                            (send [gte] print)
                            (bind ?*flag_retract_inference*  FALSE)
                            (printout t "eliminato gte" crlf crlf)
                        else
                            (if (> (length$ ?ggk) 0) then (slot-delete$ [ggk] general-kind 1  (length$ ?ggk)))
                            (if (> (length$ ?gsk) 0) then (slot-delete$ [gsk] secondary-kind 1 (length$ ?gsk)))
                            (if (> (length$ ?gte) 0) then (slot-delete$ [gte] thematic-environment 1  (length$ ?gte)))
                            (bind ?*flag_retract_inference*  FALSE)
                            (printout t "tutti e tre " crlf crlf)
                )
            )
        )
    )      
)

(defrule retract-inferred
    (declare (salience ?*highest-priority*))
    (retract-configuration)
    ?f1 <- (inferred (feature ?value) (number ?n))
    (reasked-question (question ?q))
    (test (or (> ?n ?q) (eq ?n ?q)))
    =>
        (retract ?f1)
)





(defrule retract-result
        (declare (salience ?*top-priority*))
        (retract-configuration)
        ?f1 <- (result (number ?n))
        (last-question (question ?last))
        (test (or (> ?n ?last) (eq ?n ?last)))
        =>
        (retract ?f1)
)