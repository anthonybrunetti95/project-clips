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
        (info (feature game-players) (value "1"))
        =>
        (assert (asking-question (question user-age) (answers 1 2 3 4 5 6 7 8)))
)

(defrule ask-group-age 
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not(info (feature game-players) (value "1")))
        =>
        (assert (asking-question (question group-age) (answers 1 2 3 4 5 6 7 8)))
)



(defrule ask-user-experience
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-players) (value "1"))
        =>
        (assert (asking-question (question user-experience) (answers 1 2 3 4)))

)

(defrule ask-group-experience
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not(info (feature game-players) (value "1")))
        =>
        (assert (asking-question (question group-experience) (answers 1 2 3 4)))

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
        (info (feature user-budget) (value "45<65" | "66<110"| "110<"))
       
        =>
        (assert (asking-question (question game-wargame) (answers s n)))
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule ask-game-thematic
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (not(info (feature game-wargame) (value "yes")))
        =>
        (assert (asking-question (question game-thematic) (answers s n)))
)


(defrule ask-game-comp
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-comp) (answers s n)))
)


(defrule ask-game-coop
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-coop) (answers s n)))
)


(defrule ask-game-challenging
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-challenging) (answers s n)))
)


(defrule ask-game-bidding
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-bidding) (answers s n)))
)

(defrule ask-game-investigative
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-investigative) (answers s n)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule ask-game-hold-story
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-hold-story) (answers s n)))
)

(defrule ask-game-western
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-western) (answers s n)))
)

(defrule ask-game-horror
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-horror) (answers s n)))
)

(defrule ask-game-gothic
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-gothic) (answers s n)))
)

(defrule ask-game-lovecraft
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-lovecraft) (answers s n)))
)

(defrule ask-game-war
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-war) (answers s n)))
)

(defrule ask-game-abstract
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-abstract) (answers s n)))
)

(defrule ask-game-fantasy
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-farms
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-farms) (answers s n)))
)

(defrule ask-game-futuristics
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-futuristics) (answers s n)))
)

(defrule ask-game-merchants
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-merchants) (answers s n)))
)

(defrule ask-game-indians
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-indians) (answers s n)))
)

(defrule ask-game-fireworks
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-fireworks) (answers s n)))
)


(defrule ask-game-survival
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-survival) (answers s n)))
)


(defrule ask-game-industry
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-industry) (answers s n)))
)


(defrule ask-game-numbers
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-numbers) (answers s n)))
)

(defrule ask-game-castles
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-castles) (answers s n)))
)

(defrule ask-game-vampyric
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-vampyric) (answers s n)))
)

(defrule ask-game-renaissance-court
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-renaissance-court) (answers s n)))
)


(defrule ask-game-pirates
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-pirates) (answers s n)))
)

(defrule ask-game-witchcraft
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-witchcraft) (answers s n)))
)

(defrule ask-game-oriental
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-oriental) (answers s n)))
)

(defrule ask-game-glass
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-glass) (answers s n)))
)

(defrule ask-game-chemistry
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-chemistry) (answers s n)))
)


(defrule ask-game-lord-of-the-rings
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-lord-of-the-rings) (answers s n)))
)

(defrule ask-game-tale
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-tale) (answers s n)))
)

(defrule ask-game-crime
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-crime) (answers s n)))
)


(defrule ask-game-restaurants
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-restaurants) (answers s n)))
)


(defrule ask-game-mafia
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-mafia) (answers s n)))
)


(defrule ask-game-politics
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question game-politics) (answers s n)))
)





























