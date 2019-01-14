;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;       REGOLE PER LA FORMULAZIONE DELLE DOMANDE        ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                     SEZIONE UTENTE                    ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule ask-question
        (declare (salience ?*highest-priority*))
        ?f1 <- (asking-question (question ?question) (answers $?answers))
        ?f2 <- (last-question (question ?last))
        ?f3 <- (asked-questions (question $?asked))
        (test (not (member$ ?question ?asked)))
        =>
        (retract ?f1)
        (modify ?f2 (question (+ ?last 1)))
        (modify ?f3 (question ?asked ?question))
        (ask ?question (+ ?last 1) ?answers)
)

(defrule not-ask-already-asked-question
        (declare (salience ?*highest-priority*))
        ?f1 <- (asking-question (question ?question) (answers $?answers))
        (asked-questions (question $?asked))
        (test (member$ ?question ?asked))
        =>
        (retract ?f1)
)

;;====================================================;;




(defrule ask-user-age           
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        =>
        (assert (asking-question (question user-age) (answers 1 2 3 4 5 6 7 8)))
)

(defrule ask-user-experience
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        =>
        (assert (asking-question (question user-experience) (answers 1 2 3 4)))

)
(defrule ask-user-budget        
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question user-budget) (answers 1 2 3 4 5 6)))
)

(defrule ask-user-gift  
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question user-gift) (answers s n)))
)

(defrule ask-game-players
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        =>
        (assert (asking-question (question game-players) (answers 1 2 3 4 5 6 7))))


(defrule ask-game-time
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        =>
        (assert (asking-question (question game-time) (answers 1 2 ))))


(defrule ask-game-family
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature game-wargame) (value "yes"))) 
        (not (info (feature game-cardgame) (value "yes")))
                

        =>
        (assert (asking-question (question game-family) (answers s n))))

(defrule ask-game-cardgame
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature game-family) (value "yes")))
        (not(info (feature game-wargame) (value "yes")))
               
         
        =>
        (assert (asking-question (question game-cardgame) (answers s n))))


(defrule ask-game-wargame
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))  
        (not(info (feature game-family) (value "yes"))) 
        (not(info (feature game-cardgame) (value "yes")))
       
        =>
        (assert (asking-question (question game-wargame) (answers s n))))












