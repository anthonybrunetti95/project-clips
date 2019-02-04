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
        (info (feature game-players) (value "2" | "3" | "4" | "5" | "6" |"6+"))
        =>
        (assert (asking-question (question group-age) (answers 1 2 3 4 5 6 7 8)))
)

(defrule ask-user-experience
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-players) (value "1"))
        (info (feature user-age))
        (not(inferred (feature age) (value child))) 
        =>
        (assert (asking-question (question user-experience) (answers 1 2 3 4)))
)

(defrule ask-group-experience
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-players) (value "2" | "3" | "4" | "5" | "6" | "6+" ))
        (info (feature group-age))
        (not(inferred (feature age) (value child)))        
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
        (assert (asking-question (question game-players) (answers 1 2 3 4 5 6 7)))
)

(defrule ask-game-time
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        =>
        (assert (asking-question (question game-time) (answers 1 2 )))
)

(defrule ask-game-family
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (inferred (feature weight) (value difficile)))
        (not (info (feature game-wargame) (value "yes"))) 
        (not (info (feature game-cardgame) (value "yes")))
        (not (info (feature game-players) (value "1")))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"| "45<65"))
        (info (feature game-players) (value "2" | "3" | "4" | "5" | "6" | "6+"))
        (info (feature game-time) (value "<60"))
        =>
        (assert (asking-question (question game-family) (answers s n)))
)

(defrule ask-game-cardgame
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-family) (value "no"))
        (info (feature game-wargame) (value "no"))
        (info (feature game-filler) (value "no"))
        (not (info (feature game-players) (value "6" |"6+")))
        (inferred (feature weight) (value leggero | medio))
                  
        =>
        (assert (asking-question (question game-cardgame) (answers s n)))

)


(defrule ask-game-wargame
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))  
        (info (feature game-family) (value "no"))
        (info (feature game-cardgame) (value "no"))
        (info (feature game-filler) (value "no"))
        (not(info (feature game-players) (value "1")))
        (info (feature game-time) (value ">60"))
        (info (feature game-players) (value "2" | "3" | "4" | "5" | "6"))
       
        =>
        (assert (asking-question (question game-wargame) (answers s n)))
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule ask-game-comp
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature game-players) (value  "2" | "3" | "4" | "5" | "6" | "6+"))
        (info (feature user-gift) (value "no"))
        (not(inferred (feature wargame) (value T)))
        =>
        (assert (asking-question (question game-comp) (answers s n)))
)


(defrule ask-game-coop
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature game-players) (value  "2" | "3" | "4" | "5" | "6" | "6+"))
        (info (feature user-gift) (value "no"))
        (not(inferred (feature wargame) (value T)))
        =>
        (assert (asking-question (question game-coop) (answers s n)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule ask-game-thematic
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not(info (feature game-wargame) (value "yes")))
        =>
        (assert (asking-question (question game-thematic) (answers s n)))
)

(defrule ask-game-strategy
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature game-investigative) (value "yes")))
        (not (info (feature game-hmovement) (value "yes")))
        =>
        (assert (asking-question (question game-strategy) (answers s n)))
)

(defrule ask-game-challenging
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (inferred (feature wargame) (value T)))
        (not (info (feature game-bidding) (value "yes")))
        (not (info (feature game-wtdplacement) (value "yes")))
        (not (info (feature game-hmovement) (value "yes")))
        (not (info (feature game-bluff) (value "yes")))
        =>
        (assert (asking-question (question game-challenging) (answers s n)))
)

(defrule ask-game-explorative
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (not (info (feature game-wtdplacement) (value "yes")))
        (not (info (feature game-bidding) (value "yes")))
        (not (info (feature game-hmovement) (value "yes")))
        (not (info (feature game-bluff) (value "yes")))
        (not(info (feature game-bidding) (value "yes")))
        (info (feature user-gift) (value "no"))
        (info (feature game-thematic) (value "yes"))
        (result (feature coop-comp) (value coop\comp | comp )) 
        =>
        (assert (asking-question (question game-explorative) (answers s n)))
)

(defrule ask-game-wtdplacement
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature game-hmovement) (value "yes")))
        (not (info (feature game-investigative) (value "yes")))
        (not (info (feature game-challenging) (value "yes")))
        (not (info (feature game-bluff) (value "yes")))
        (not (result (feature coop-comp) (value coop | coop\comp)))
        =>
        (assert (asking-question (question game-wtdplacement) (answers s n)))
)


(defrule ask-game-hmvoment
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (not(info (feature game-explorative) (value "yes")))
        (not (info (feature game-strategy) (value "yes")))
        (not (info (feature game-bidding) (value "yes")))
        (result (feature coop-comp) (value coop\comp))
        =>
        (assert (asking-question (question game-hmovement) (answers s n)))
)


(defrule ask-game-investigative
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not(inferred (feature wargame) (value T)))
        (info (feature game-thematic) (value "T"))
        (not (inferred (feature game-strategy) (value T)))
        (not (inferred (feature game-wtdplacement) (value T)))
        (not (inferred (feature game-bidding) (value T)))
        =>
        (assert (asking-question (question game-investigative) (answers s n)))
)



(defrule ask-game-bidding
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not(inferred (feature wargame) (value T)))
        (info (feature game-strategy) (value "T"))
        (info (feature game-coop) (value "no"))
        (result (feature coop-comp) (value comp))
        =>
        (assert (asking-question (question game-bidding) (answers s n)))
)


(defrule ask-game-bluff
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature game-wtdplacement) (value "yes")))
        (not (info (feature game-explorative) (value "yes")))
        (info (feature game-coop) (value "no"))
        (result  (feature coop-comp) (value coop\comp | comp))
        =>
        (assert (asking-question (question game-bluff) (answers s n)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule ask-game-greece-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))
        (not(info (feature game-players) (value "6" | ">6")))
        (not (info (feature game-greece)))
        =>
        (assert (asking-question (question game-greece) (answers s n)))
)

(defrule ask-game-greece-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-greece)))

        =>
        (assert (asking-question (question game-greece) (answers s n)))
)

(defrule ask-game-greece-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature family) (value T))
        (info (feature game-strategy) (value "yes"))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-greece)))
        =>
        (assert (asking-question (question game-greece) (answers s n)))
)

(defrule ask-game-roman 
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature wargame)  (value T))
        (result (feature weight) (value difficile))
        =>
        (assert (asking-question (question game-roman) (answers s n)))
)

(defrule ask-game-western-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature american) (value T))
        (info (feature game-bluff) (value "yes"))
        (not(info (feature game-western))) 
        =>
        (assert (asking-question (question game-western) (answers s n)))
)
(defrule ask-game-western-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))
        (info (feature game-bluff) (value "yes"))
        (not(info (feature game-western)))

        =>
        (assert (asking-question (question game-western) (answers s n)))
)

(defrule ask-game-western-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature family) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-players) (value "2" | "3" | "4"))
        (not(info (feature game-western)))
        =>
        (assert (asking-question (question game-western) (answers s n)))
)


(defrule ask-game-horror-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (info (feature game-thematic) (value "yes"))
        (result (feature coop-comp) (value comp))
        (not(info (feature game-horror)))     
        =>
        (assert (asking-question (question game-horror) (answers s n)))
)

(defrule ask-game-horror-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))
        (info (feature game-challenging) (value "yes"))
        (result (feature coop-comp) (value coop\comp))
        (not (info (feature game-players) (value "1" | "2" | "3")))
        (not(info (feature game-horror)))       
        =>
        (assert (asking-question (question game-horror) (answers s n)))
)



(defrule ask-game-gothic-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature american) (value T))
        (info (feature game-strategy | game-wtdplacement | game-bidding) (value "no"))

        (not(info (feature game-gothic)))
        =>
        (assert (asking-question (question game-gothic) (answers s n)))
)


(defrule ask-game-gothic-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-wtdplacement) (value "yes"))
        (not(info (feature game-gothic))) 
               
        =>
        (assert (asking-question (question game-gothic) (answers s n)))
)

(defrule ask-game-gothic-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (info (feature game-explorative | game-wtdplacement | game-hmovement | game-bidding | game-bluff) (value "no"))
        (not(info (feature game-gothic)))         
                
        =>
        (assert (asking-question (question game-gothic) (answers s n)))
)
(defrule ask-game-gothic-4
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature cardgame) (value T))
        (info (feature game-explorative| game-hmovement | game-bidding | game-bluff) (value "no"))
        (not(info (feature game-gothic)))        
        =>
        (assert (asking-question (question game-gothic) (answers s n)))
)

(defrule ask-game-gothic-5
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature family) (value T)) 
        (info (feature game-thematic) (value "yes"))
        (info (feature game-explorative| game-hmovement | game-bidding | game-bluff) (value "no"))
        (not(info (feature game-gothic)))        
        =>
        (assert (asking-question (question game-gothic) (answers s n)))
)

(defrule ask-game-lovecraft-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-gothic) (value "yes"))
        (result (feature german) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-wtdplacement) (value "yes"))
        (not (info (feature game-players) (value "5" | "6" | "6+")))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-lovecraft)))

        =>
        (assert (asking-question (question game-lovecraft) (answers s n)))
)

(defrule ask-game-lovecraft-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-gothic) (value "yes"))
        (result (feature american) (value T))
        (info (feature game-strategy | game-wtdplacement | game-hmovement | game-bidding) (value "no"))
        (info (feature game-investigative) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (not (info (feature game-lovecraft)))

        =>
        (assert (asking-question (question game-lovecraft) (answers s n)))
)

(defrule ask-game-lovecraft-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-gothic) (value "yes"))
        (result (feature filler) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff) (value "no"))
        (not (info (feature game-lovecraft)))

        =>
        (assert (asking-question (question game-lovecraft) (answers s n)))
)

(defrule ask-game-lovecraft-4
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-gothic) (value "yes"))
        (result (feature cardgame) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-investigative) (value "yes"))
        (info (feature game-lovecraft) (value "yes"))
        (info (feature game-gothic) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (info (feature game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-bidding | game-bluff) (value "no"))
        (not (info (feature game-lovecraft)))
        =>
        (assert (asking-question (question game-lovecraft) (answers s n)))
)

(defrule ask-game-lovecraft-5
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-gothic) (value "yes"))
        (result (feature family) (value T))
        (result (feature filler) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-bidding | game-bluff) (value "no"))
        (not (info (feature game-lovecraft)))
        =>
        (assert (asking-question (question game-lovecraft) (answers s n)))
)



(defrule ask-game-war-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature american) (value T))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding | game-bluff) (value "no"))
        (info (feature game-players) (value "6+"))
        (not (info (feature game-war)))    
        =>
        (assert (asking-question (question game-war) (answers s n)))
)


(defrule ask-game-war-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging | game-explorative | game-hmovement | game-investigative |game-bidding | game-bluff) (value "no"))
        (not (info (feature game-war)))         
        =>
        (assert (asking-question (question game-war) (answers s n)))
)


(defrule ask-game-abstract-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (info  (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-players) (value  "1" | "2" ))
        (info (feature  game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding | game-bluff) (value "no"))
        (not (info (feature game-abstract)))
        =>
        (assert (asking-question (question game-abstract) (answers s n)))
)

(defrule ask-game-abstract-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature cardgame) (value T))
        (result (feature coop-comp) (value coop))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-players) (value  "1" | "2" ))
        (info (feature  game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding | game-bluff) (value "no"))
        (not (info (feature game-abstract)))
        
        =>
        (assert (asking-question (question game-abstract) (answers s n)))
)

(defrule ask-game-abstract-3
        (result (feature family) (value T))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-players) (value  "5" | "6" | "6+")))
        (info (feature game-strategy | game-challenging |game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding | game-bluff) (value "no"))
        (not (info (feature game-abstract)))        
        =>
        (assert (asking-question (question game-abstract) (answers s n)))
)




(defrule ask-game-fantasy-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))
        (info (feature game-strategy) (value "yes"))
        (not (info (feature game-indians) (value "yes")))
        (not (info (feature game-players) (value  "6" | "6+")))
        (info (feature game-challenging |game-explorative | game-hmovement | game-investigative |game-bidding | game-bluff) (value "no"))
        (not (info (feature game-fantasy)))
           =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-fantasy-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature american) (value T))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-strategy | game-wtdplacement  |game-bidding) (value "no"))
        (not (info (feature game-indians) (value "yes")))
        (not (info (feature game-fantasy)))
           =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-fantasy-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (info (feature game-explorative | game-wtdplacement | game-hmovement |game-bidding ) (value "no"))
        (not (info (feature game-indians) (value "yes")))
        (not (info (feature game-fantasy)))
           =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-fantasy-4
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature cardgame) (value T))
        (info (feature game-challenging) (value "yes"))
        (info (feature  game-wtdplacement | game-hmovement |game-bidding ) (value "no"))
        (not (info (feature game-indians) (value "yes")))
        (not (info (feature game-fantasy)))
           =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-fantasy-5
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))
        (info (feature game-players) (value "1" | "2"))
        (info (feature game-strategy | game-challenging | game-explorative | game-wtdplacement | game-hmovement |game-bidding ) (value "no"))
        (not (info (feature game-indians) (value "yes")))
        (not (info (feature game-fantasy)))
           =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-fantasy-6
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature family) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy  | game-explorative | game-wtdplacement | game-hmovement |game-bidding | game-bluff ) (value "no"))
        (not (info (feature game-indians) (value "yes")))
        (not (info (feature game-fantasy)))

           =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)



(defrule ask-game-farms-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))
        (info (feature game-challenging | game-explorative | game-hmovement | game-investigative |game-bidding ) (value "no"))
        (info (feature game-wtdplacement) (value "yes"))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-farms)))

        =>
        (assert (asking-question (question game-farms) (answers s n)))
)

(defrule ask-game-farms-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (result (feature family) (value T))
        (info (feature game-challenging | game-explorative | game-hmovement | game-investigative |game-bidding |game-bluff ) (value "no"))
        (info (feature game-wtdplacement) (value "yes"))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-farms)))
        =>
        (assert (asking-question (question game-farms) (answers s n)))
)


(defrule ask-game-futuristics-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature american) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-explorative) (value "yes"))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-strategy | game-challenging | game-wtdplacement | game-hmovement | game-investigative |game-bidding |game-bluff ) (value "no"))
        (not(info (feature game-futuristics)))              
               
        =>
        (assert (asking-question (question game-futuristics) (answers s n)))
)

(defrule ask-game-futuristics-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-bluff) (value "yes"))
        (info (feature game-explorative | game-wtdplacement | game-hmovement | game-investigative ) (value "no"))
        (not(info (feature game-futuristics)))
        =>
        (assert (asking-question (question game-futuristics) (answers s n)))
)

(defrule ask-game-futuristics-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))
        (result (feature family) (value T))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (info (feature  game-thematic | game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding ) (value "no"))        
        (not(info (feature game-futuristics)))
        =>
        (assert (asking-question (question game-futuristics) (answers s n)))
)


(defrule ask-game-merchants-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature  game-thematic | game-strategy | game-challenging | game-explorative | game-explorative | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "no")) 
        (not(info (feature game-merchants)))
        =>
        (assert (asking-question (question game-merchants) (answers s n)))
)


(defrule ask-game-merchants-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))
        (info (feature  game-thematic | game-challenging | game-explorative | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "no")) 
        (not(info (feature game-merchants)))
        =>
        (assert (asking-question (question game-merchants) (answers s n)))
)


(defrule ask-game-indians-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))
        (not (info (feature game-fantasy) (value "yes")))
        (not (info (feature game-gothic) (value "yes")))
        (info (feature  game-challenging | game-explorative | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "no"))        
        (not(info (feature game-indians)))
        =>
        (assert (asking-question (question game-indians) (answers s n)))
)

(defrule ask-game-indians-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature american) (value T))
        (info (feature game-challenging) (value "yes"))
        (result (feature coop-comp) (value T))
        (not (info (feature game-fantasy) (value "yes")))
        (not (info (feature game-gothic) (value "yes")))
        (info (feature  game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding |  game-bluff ) (value "no"))
        (not(info (feature game-indians)))
        =>
        (assert (asking-question (question game-indians) (answers s n)))
)

(defrule ask-game-indians-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (not (result (feature family) (value T)))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-fantasy) (value "yes")))
        (not (info (feature game-gothic) (value "yes")))
        (info (feature  game-explorative | game-hmovement | game-investigative | game-bidding |  game-bluff ) (value "no"))
        (not(info (feature game-indians)))
        =>
        (assert (asking-question (question game-indians) (answers s n)))
)

(defrule ask-game-indians-4
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (result (feature family) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature  game-strategy | game-challenging | game-explorative | game-hmovement | game-investigative | game-bidding |  game-bluff ) (value "no"))
        (not (info (feature game-fantasy) (value "yes")))
        (not (info (feature game-gothic) (value "yes")))
        (not(info (feature game-indians)))
        =>
        (assert (asking-question (question game-indians) (answers s n)))
)

(defrule ask-game-fireworks
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))
        (result (feature coop-comp) (value coop))
        (info (feature  game-thematic | game-strategy | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "no")) 
 
        =>
        (assert (asking-question (question game-fireworks) (answers s n)))
)


(defrule ask-game-survival-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature american) (value T))
        (info (feature game-challenging) (value "yes"))
        (result (feature coop-comp) (value coop))
        (info (feature game-indians ) (value  "yes"))
        (info (feature game-strategy | game-explorative | game-hmovement | game-wtdplacement | game-investigative |game-bidding |  game-bluff ) (value "no")) 
        (not (info (feature game-survival)))
        =>
        (assert (asking-question (question game-survival) (answers s n)))
)

(defrule ask-game-survival-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-indians ) (value  "yes"))
        (info (feature  game-explorative | game-hmovement | game-wtdplacement | game-investigative | game-bidding |  game-bluff ) (value "no"))
        (not (info (feature game-survival)))
        =>
        (assert (asking-question (question game-survival) (answers s n)))
)


(defrule ask-game-forests
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature cardgame) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (result (feature coop-comp) (value coop))
        (info (feature game-abstract) (value "yes"))
        (info (feature game-players) (value "1" | "2"))
        (info (feature  game-explorative | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "no"))
        =>
        (assert (asking-question (question game-forests) (answers s n)))
)


(defrule ask-game-industry
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))
        (info (feature game-challenging | game-explorative | game-hmovement | game-investigative | game-bluff )(value "no")) 
        (not (info (feature game-players) (value "6+")))                
        =>
        (assert (asking-question (question game-industry) (answers s n)))
)


(defrule ask-game-numbers
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature family) (value T))
        (result (feature coop-comp) (value coop))
        (info (feature  game-thematic | game-strategy | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "no")) 
        (not (info (feature game-players) (value "6" | "6+")))  
        =>
        (assert (asking-question (question game-numbers) (answers s n)))
)

(defrule ask-game-castles-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))
        (result (feature weight) (value medio))
        (info (feature user-budget) (value "34<44"))
        (info (feature  game-thematic | game-challenging | game-explorative |  game-hmovement | game-investigative  |  game-bluff ) (value "no")) 
        (not (info(feature game-castles)))       

    
        =>
        (assert (asking-question (question game-castles) (answers s n)))
)

(defrule ask-game-castles-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (not (result  (feature party) (value T)))
        (not (result (feature family) (value T)))
        (info (feature  game-thematic | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff ) (value "no")) 
        (info (feature user-budget) (value  "<18" |"19<33")) 
        (result (feature weight) (value leggero))
        (not (info (feature game-castles)))    
        =>
        (assert (asking-question (question game-castles) (answers s n)))
)

(defrule ask-game-castles-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (result (feature family) (value T))
        (not (result (feature party) (value T)))
        (info (feature game-strategy | game-explorative | game-hmovement | game-bidding  ) (value "no")) 
        (info (feature user-budget) (value  "<18" |"19<33")) 
        (result (feature weight) (value leggero))
        (not (info (feature game-castles)))    
        =>
        (assert (asking-question (question game-castles) (answers s n)))
)


(defrule ask-game-castles-4
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))
        (result (feature filler) (value T))
        (result (feature family) (value T))
        (info (feature game-strategy  | game-explorative | game-wtdplacement | game-hmovement | game-bidding  ) (value "no")) 
        (info (feature  game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-investigative) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (not (info(feature game-castles)))       

        =>
        (assert (asking-question (question game-castles) (answers s n)))
)


(defrule ask-game-vampyric
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature american) (value T))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-hmovement) (value "yes"))
        (info (feature game-investigative) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (info (feature game-gothic) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (info (feature  game-strategy  | game-explorative | game-wtdplacement | game-hmovement | game-bidding  ) (value "no"))
        =>
        (assert (asking-question (question game-vampyric) (answers s n)))
)

(defrule ask-game-renaissance-court-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))
        (result (feature weight) (value medio | difficile))
        (info (feature user-budget) (value "34<44" | "45<65")) 
        (info (feature  game-challenging  | game-explorative | game-hmovement | game-investigative | game-bidding | game-bluff ) (value "no"))               
        (not (info (feature game-renaissance-court)))    
        =>
        (assert (asking-question (question game-renaissance-court) (answers s n)))
)

(defrule ask-game-renaissance-court-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (result (feature party) (value T))
        (result (feature family) (value T))
        (info (feature game-bluff) (value "yes"))
        (info (feature game-thematic | game-strategy | game-challenging | game-explorative | game-wtdplacement |game-hmovement | game-investigative | game-bidding ) (value "no"))
        (not (info (feature game-renaissance-court))) 
        =>
        (assert (asking-question (question game-renaissance-court) (answers s n)))
)



(defrule ask-game-pirates-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature american) (value T))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-explorative) (value "yes"))
        (not (info (feature  game-wtdplacement |game-hmovement | game-investigative | game-bidding | game-bluff ) (value "yes")))
        (not(info (feature game-pirates)))

        =>
        (assert (asking-question (question game-pirates) (answers s n)))
)

(defrule ask-game-pirates-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (info (feature  game-strategy | game-challenging | game-explorative | game-wtdplacement |game-hmovement | game-investigative | game-bidding ) (value "no")) 
        (not(info (feature game-pirates)))
        =>
        (assert (asking-question (question game-pirates) (answers s n)))
)

(defrule ask-game-witchcraft
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))
        (not (info (feature game-players) (value "1"| "2")))
        (or     (result (feature coop-comp) (value comp))
                (result (feature coop-comp) (value coop\comp)))
        (info (feature game-strategy | game-challenging | game-explorative | game-wtdplacement |game-hmovement ) (value "no"))
        =>
        (assert (asking-question (question game-witchcraft) (answers s n)))
)

(defrule ask-game-oriental
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature family) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-thematic) (value "yes"))
        (not (info (feature game-players) (value "5" | "6" | "6+") ))
        (info (feature game-strategy | game-challenging | game-explorative | game-wtdplacement |game-hmovement | game-investigative | game-bidding ) (value "no"))
        =>
        (assert (asking-question (question game-oriental) (answers s n)))
)

(defrule ask-game-glass
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature family) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-abstract) (value "yes"))
        (not (info (feature game-players) (value "5" | "6" | "6+")))
        (info (feature game-strategy | game-challenging | game-explorative | game-wtdplacement |game-hmovement | game-investigative | game-bidding | game-bluff) (value "no"))
        =>
        (assert (asking-question (question game-glass) (answers s n)))
)

(defrule ask-game-chemistry
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-wtdplacement) (value "yes"))
        (info (feature game-renaissance-court) (value "yes"))
        (info (feature  game-challenging | game-explorative | game-hmovement | game-investigative | game-bidding | game-bluff) (value "no"))
        (info (feature game-players) (value "2" | "3" | "4"))
        =>
        (assert (asking-question (question game-chemistry) (answers s n)))
)


(defrule ask-game-lord-of-the-rings-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-fantasy) (value "yes"))
        (result (feature american) (value T))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (info (feature game-gothic) (value "yes"))
        (not (info (feature game-lovecraft) (value "yes")))
        (not (info (feature game-lord-of-the-rings)))
        (info (feature game-strategy | game-explorative | game-wtdplacement | game-investigative | game-bidding) (value "no"))
        (info (feature game-players) (value "2" | "3" | "4" | "5"))
        =>
        (assert (asking-question (question game-lord-of-the-rings) (answers s n)))
)
(defrule ask-game-lord-of-the-rings-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature game-fantasy) (value "yes"))
        (result (feature filler) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (info (feature game-gothic) (value "yes"))
        (info (feature game-thematic | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff) (value "no"))
        (info (feature game-players) (value "2"))
        (not (info (feature game-lovecraft) (value "yes")))
        (not (info (feature game-lord-of-the-rings)))                 
        =>
        (assert (asking-question (question game-lord-of-the-rings) (answers s n)))
)

(defrule ask-game-lord-of-the-rings-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature cardgame) (value T))
        (result (feature coop-comp) (value coop))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (info (feature game-gothic) (value "yes"))
        (info (feature game-strategy | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff) (value "no"))
        (info (feature game-players) (value "1" | "2"))
        (not (info (feature game-lovecraft) (value "yes")))       
        (not (info (feature game-lord-of-the-rings)))
        =>
        (assert (asking-question (question game-lord-of-the-rings) (answers s n)))
)


(defrule ask-game-tale-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature american) (value T))
        (result (feature coop-comp) (value coop))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-explorative) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (not (info (feature game-players) (value "5" | "6" | "6+")))
        (info (feature game-strategy | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff) (value "no"))
        (not(info (feature game-tale)))
        =>
        (assert (asking-question (question game-tale) (answers s n)))
)
(defrule ask-game-tale-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (result (feature party) (value T))
        (result (feature family) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (not (info (feature game-players) (value "1" | "2" | "6+")))
        (info (feature game-strategy | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff) (value "no"))
        (not(info (feature game-tale)))
        =>
        (assert (asking-question (question game-tale) (answers s n)))
)
(defrule ask-game-tale-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))
        (not (result (feature filler) (value T)))
        (not (result (feature party) (value T)))
        (info (feature game-bluff) (value "yes"))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-fantasy) (value "yes"))
        (not (info (feature game-players) (value "1" | "2")))
        (info (feature game-thematic | game-strategy | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding ) (value "no"))
        (not(info (feature game-tale)))
        =>
        (assert (asking-question (question game-tale) (answers s n)))
)

(defrule ask-game-crime-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature american) (value T))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-investigative) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (info (feature game-strategy |  game-explorative | game-wtdplacement | game-hmovement | game-bidding ) (value "no"))
        (not (info (feature game-crime)))
        =>
        (assert (asking-question (question game-crime) (answers s n)))
)
(defrule ask-game-crime-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-investigative) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (info (feature game-strategy |  game-explorative | game-wtdplacement | game-hmovement | game-bidding ) (value "no"))
        (not (info (feature game-players) (value "1")))
        (not(info (feature game-crime)))
        =>
        (assert (asking-question (question game-crime) (answers s n)))
)


(defrule ask-game-restaurants
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature german) (value T))
        (info (feature game-thematic) (value "yes"))
        (result (feature weight) (value medio))
        (info (feature user-budget) (value "45<65"))
        (info (feature game-strategy | game-challenging | game-explorative | game-hmovement | game-investigative | game-bidding | game-bluff ) (value "no"))

        =>
        (assert (asking-question (question game-restaurants) (answers s n)))
)


(defrule ask-game-mafia
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature party) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-bluff) (value "yes"))  
        (info (feature  game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding  ) (value "no")) 
        (info (feature game-players) (value "3" | "4" | "5" ))     

        =>
        (assert (asking-question (question game-mafia) (answers s n)))
)


(defrule ask-game-politics
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (result (feature filler) (value T))
        (result (feature party) (value T))
        (result (feature family) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (info (feature game-thematic | game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding ) (value "no"))
        (info (feature game-players) (value "3" | "4" | "5" | "6"))
        =>
        (assert (asking-question (question game-politics) (answers s n)))
)
