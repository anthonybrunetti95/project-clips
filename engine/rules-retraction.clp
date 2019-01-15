;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                 REGOLE PER LA RITRATTAZIONE           ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

    (retract ?f1)
    (if (eq ?number 1)
     then (printout t crlf "  *****************   DOMANDE   *****************  " crlf))
    (print-question ?question ?number)
    (print-answers ?question ?answer)
    (if (eq ?number ?last)
     then (printout t crlf "  ***********************************************    " crlf crlf)
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

(defrule retract-info
        (declare (salience ?*highest-priority*))
        ?f1 <- (retract-info ?info)
        ?f2 <- (info (question ?question)) 
        (test (eq ?info ?question))
        =>
        (retract ?f1 ?f2)
)

(defrule retract-inferred
        (declare (salience ?*top-priority*))
        (retract-configuration)
        ?f1 <- (inferred (number ?n))
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