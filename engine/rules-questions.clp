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
        
        (info (feature game-players) (value "1"))
        =>
        (assert (asking-question (question user-age) (answers 1 2 3 4 5 6 7 8)))
)

(defrule ask-group-age 
        (declare (salience ?*normal-priority*))
        (not (retraction))
        
        (info (feature game-players) (value "2" | "3" | "4" | "5" | "6" |"6+"))
        =>
        (assert (asking-question (question group-age) (answers 1 2 3 4 5 6 7 8)))
)

(defrule ask-user-experience
        (declare (salience ?*normal-priority*))
        (not (retraction))
        
        (info (feature game-players) (value "1"))
        (info (feature user-age))
        (not(inferred (feature age) (value child))) 
        =>
        (assert (asking-question (question user-experience) (answers 1 2 3 4)))
)

(defrule ask-group-experience
        (declare (salience ?*normal-priority*))
        (not (retraction))
        
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


(defrule ask-game-players
        (declare (salience ?*normal-priority*))
        (not (retraction))
        
        =>
        (assert (asking-question (question game-players) (answers 1 2 3 4 5 6 7)))
)

(defrule ask-game-time
        (declare (salience ?*normal-priority*))
        (not (retraction))
        
        =>
        (assert (asking-question (question game-time) (answers 1 2 )))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule ask-game-comp
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature game-players) (value  "2" | "3" | "4" | "5" | "6" | "6+"))
        =>
        (assert (asking-question (question game-comp) (answers s n)))
)
 
(defrule ask-game-coop
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature game-players) (value  "2" | "3" | "4" | "5" | "6" | "6+"))
        
        (not(inferred (feature wargame) (value T)))
        =>
        (assert (asking-question (question game-coop) (answers s n)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule ask-game-family
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (not (inferred (feature weight) (value difficile)))
        (not (info (feature game-wargame | game-cardgame) (value "yes"))) 
        (not (info (feature game-explorative | game-hmovement | game-bidding) (value "yes")))
        (inferred (feature age) (value child | elder))
        (not (info (feature game-players) (value "1")))
        (info (feature game-time) (value "<60"))
        (result (feature coop-comp) (value comp | coop))
        =>
        (assert (asking-question (question game-family) (answers s n)))
)

(defrule ask-game-cardgame
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (not (inferred (feature family | wargame | filler | american | german ) (value T)))
        (not (info (feature game-players) (value "6" |"6+")))
        (inferred (feature weight) (value facile | medio))
        (inferred (feature challenging) (value T))        
        =>
        (assert (asking-question (question game-cardgame) (answers s n)))

)

(defrule ask-game-wargame
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (result (feature coop-comp)(value comp))
        (not (inferred (feature family | cardgame | filler | american | german ) (value T)))
        (info (feature game-time) (value ">60"))
        (info (feature game-players) (value "2" | "3" | "4" | "5" | "6"))
        =>
        (assert (asking-question (question game-wargame) (answers s n)))
)



(defrule ask-game-thematic-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not (info (feature game-wargame) (value "yes")))
        (result (feature coop-comp) (value comp))
        (not (inferred (feature german) (value T)))
        (not (inferred (feature explorative | hmovement) (value T)))
        (not(info (feature game-thematic)))
        =>
        (assert (asking-question (question game-thematic) (answers s n)))
)

(defrule ask-game-thematic-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not (info (feature game-wargame) (value "yes")))
        (not (inferred (feature wtdplacement | hmovement | bidding | bluff ) (value T)))
        (result (feature coop-comp) (value coop))
        (not(info (feature game-thematic)))
        =>
        (assert (asking-question (question game-thematic) (answers s n)))
)

(defrule ask-game-thematic-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not (info (feature game-wargame) (value "yes")))
        (result (feature coop-comp) (value coop\comp ))
        (not (inferred (feature wtdplacement | bidding ) (value T)))
        (not(info (feature game-thematic)))
        =>
        (assert (asking-question (question game-thematic) (answers s n)))
)

(defrule ask-game-thematic-4
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature game-players) (value "1"))
        (not (info (feature game-wargame) (value "yes")))
        (not (inferred (feature hmovement | bidding) (value T)))
        (not(info (feature game-thematic)))
        =>
        (assert (asking-question (question game-thematic) (answers s n)))
)

(defrule ask-game-thematic-5
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (inferred (feature german) (value T))
        (result (feature weight) (value medio | difficile))
        (info (feature game-players) (value "6" | "6+"))

        =>
        (assert (asking-question (question game-thematic) (answers s n)))
)

(defrule ask-game-strategy-1
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (info (feature game-players) (value "1"))
        (not (info (feature game-wargame) (value "yes")))
        (not (info (feature game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes") ))
        (not (info (feature game-strategy)))
        =>
        (assert (asking-question (question game-strategy) (answers s n)))
)


(defrule ask-game-strategy-2
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (not (info (feature game-wargame) (value "yes")))
        (result (feature coop-comp) (value comp))
        (not (inferred (feature american | cardgame | wargame) (value T)))
        (not (info (feature game-explorative | game-hmovement | game-investigative ) (value "yes")))
        (not (info (feature game-strategy)))
        =>
        (assert (asking-question (question game-strategy) (answers s n)))
)

(defrule ask-game-strategy-3
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (not (info (feature game-wargame) (value "yes")))
        (result (feature coop-comp) (value coop))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (not (info (feature game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff ) (value "yes")))
        (not (info (feature game-strategy)))
        (not (inferred (feature american) (value T)))
        =>
        (assert (asking-question (question game-strategy) (answers s n)))
)

(defrule ask-game-strategy-4
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (not (info (feature game-wargame) (value "yes")))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-explorative) (value "yes"))
        (not (info (feature game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff ) (value "yes")))
       
        (not (info (feature game-strategy)))
        =>
        (assert (asking-question (question game-strategy) (answers s n)))
)


(defrule ask-game-challenging-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        
        (info (feature game-players) (value "1"))
        (not (inferred (feature wargame) (value T)))
        (not (info (feature game-wtdplacement |game-bidding | game-hmovement ) (value "yes")))
        (not (info (feature game-challenging)))
        =>
        (assert (asking-question (question game-challenging) (answers s n)))
)


(defrule ask-game-challenging-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (result (feature coop-comp) (value comp))
        (not (inferred (feature german) (value T)))
        (not (info (feature game-explorative | game-wtdplacement |game-bidding | game-hmovement ) (value "yes")))
        (not (info (feature game-challenging)))
        =>
        (assert (asking-question (question game-challenging) (answers s n)))
)

(defrule ask-game-challenging-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not (inferred (feature wargame) (value T)))
        (result (feature coop-comp) (value coop))
        (info (feature game-thematic) (value "yes"))
        (not (info (feature game-german ) (value "yes")))
        (not (info (feature game-wtdplacement | game-hmovement |  game-bidding | game-bluff ) (value "yes")))
        (not (info (feature game-challenging)))
        =>
        (assert (asking-question (question game-challenging) (answers s n)))
)

(defrule ask-game-challenging-4
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not (inferred (feature wargame) (value T)))
        (result (feature coop-comp) (value coop\comp))
        (not (info (feature game-wtdplacement |  game-bidding ) (value "yes")))
        (not (info (feature game-challenging)))
        =>
        (assert (asking-question (question game-challenging) (answers s n)))
)

(defrule ask-game-explorative-1
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (info (feature game-players) (value "1"))
        (not (info (feature game-wargame) (value "yes")))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (not (inferred (feature party) (value T)))
        (not (info (feature game-wtdplacement |game-bidding | game-hmovement | game-bluff) (value "yes")))
        (not (feature game-explorative))
        =>
        (assert (asking-question (question game-explorative) (answers s n)))
)

(defrule ask-game-explorative-2
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (result (feature coop-comp) (value coop))
        (not (info (feature game-wargame) (value "yes")))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (inferred (feature american | cardgame ) (value T))
        (not (info (feature game-strategy |game-wtdplacement |game-bidding | game-hmovement | game-bluff) (value "yes")))
        (not (feature game-explorative))
        =>
        (assert (asking-question (question game-explorative) (answers s n)))
)

(defrule ask-game-explorative-3
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (result (feature coop-comp) (value coop\comp))
        (not (info (feature game-wargame) (value "yes")))
        (info (feature game-thematic) (value "yes"))
        (not (info (feature game-wtdplacement |game-bidding | game-hmovement | game-bluff) (value "yes")))
        (not (inferred (feature filler | family) (value T)))
        (not (feature game-explorative))
        =>
        (assert (asking-question (question game-explorative) (answers s n)))
)

(defrule ask-game-wtdplacement-1
        (declare(salience ?*zero-priority*))
        (not (retraction))

        (not (info (feature game-wargame | game-cardgame) (value "yes")))
        (info (feature game-players) (value "1"))
        (not (info (feature game-challenging | game-explorative | game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes")))
        (not (info (feature game-wtdplacement)))
        =>
        (assert (asking-question (question game-wtdplacement) (answers s n)))
)

(defrule ask-game-wtdplacement-2
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (not (info (feature game-wargame | game-cardgame) (value "yes")))
        (result (feature coop-comp) (value comp))
        (not (inferred (feature party) (value T)))
        (not (info (feature game-challenging | game-explorative | game-hmovement | game-investigative | game-bluff) (value "yes")))
        (not (info (feature game-wtdplacement)))
        =>
        (assert (asking-question (question game-wtdplacement) (answers s n)))
)

(defrule ask-game-hmvoment
        (declare(salience ?*zero-priority*))
        (not (retraction))
        (not (info (feature game-wargame | game-cardgame) (value "yes")))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (not (inferred (feature party) (value T)))
        (not(info (feature game-strategy | game-explorative | game-wtdplacement | game-bidding) (value "yes")))
        (result (feature coop-comp) (value coop\comp))

        =>
        (assert (asking-question (question game-hmovement) (answers s n)))
)


(defrule ask-game-investigative-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not(inferred (feature wargame | game-cardgame) (value T)))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-players) (value "1"))
        (not (info (feature game-strategy | game-wtdplacement | game-hmovement | game-bidding) (value "yes")))
        (not (info (feature game-investigative)))
        =>
        (assert (asking-question (question game-investigative) (answers s n)))
)

(defrule ask-game-investigative-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not(inferred (feature wargame | game-cardgame) (value T)))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (not (info (feature game-players) (value "1")))
        (not (info (feature game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-bidding) (value "yes")))
        (result (feature coop-comp) (value comp))
     
        (not (info (feature game-investigative)))
        =>
        (assert (asking-question (question game-investigative) (answers s n)))
)


(defrule ask-game-investigative-3
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not(inferred (feature wargame | game-cardgame) (value T)))
        (info (feature game-thematic) (value "yes"))
        (not (inferred (feature cardgame ) (value T)))
        (info (feature game-challenging) (value "yes"))
        (not (info (feature game-players) (value "1")))
        (not (info (feature game-strategy |  game-wtdplacement | game-hmovement | game-bidding | game-bluff) (value "yes")))
        (inferred (feature american | filler | cardgame | family ) (value T))
        (result (feature coop-comp) (value coop))
        (not (info (feature game-investigative)))
        =>
        (assert (asking-question (question game-investigative) (answers s n)))
)

(defrule ask-game-investigative-4
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not(inferred (feature wargame | game-cardgame) (value T)))
        (info (feature game-thematic) (value "yes"))
        (not (info (feature game-strategy |  game-wtdplacement | game-bidding ) (value "yes")))
        (result (feature coop-comp) (value coop\comp))    
        (not (result (feature weight) (value difficile)))  
        (not (info (feature game-investigative)))
        =>
        (assert (asking-question (question game-investigative) (answers s n)))
)


(defrule ask-game-bidding
        (declare (salience ?*zero-priority*))
        (not (retraction))
        
        (not(inferred (feature wargame | game-cardgame) (value T)))
        (not (info (feature game-players) (value "6+")))
        (result (feature weight) (value medio | difficile))
        (info (feature game-strategy) (value "yes"))
        (not (inferred (feature party) (value T)))       
        (not (info (feature game-challenging | game-explorative | game-wtdplacement |game-hmovement | game-investigative ) (value "yes")))
        (result (feature coop-comp) (value comp))
      
        =>
        (assert (asking-question (question game-bidding) (answers s n)))
)

(defrule ask-game-bluff-1
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not (info (feature game-wargame | game-cardgame) (value "yes")))
        (not (info (feature game-explorative | game-wtdplacement | game-hmovement) (value "yes")))
        (result  (feature coop-comp) (value comp))
        (not (inferred (feature game-german) (value T)))
        (not (info (feature game-bluff)))
        =>
        (assert (asking-question (question game-bluff) (answers s n)))
)

(defrule ask-game-bluff-2
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (not (info (feature game-wargame | game-cardgame) (value "yes")))
        (result (feature coop-comp) (value coop\comp))
        (not (info (feature game-strategy | game-explorative | game-wtdplacement | game-bidding) (value "yes")))
        (not (info (feature game-bluff)))
        =>
        (assert (asking-question (question game-bluff) (answers s n)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule ask-game-greece-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature german) (value T))
        (not(info (feature game-players) (value "6" | ">6")))
        (not (info (feature game-challenging | game-explorative | game-hmovement | game-investigative | game-bluff) (value "yes")))
        (not (info (feature game-industry | game-renaissance-court | game-merchants | game-indians | game-war | game-fantasy | game-chemistry | game-gala-hotel | game-gothic | game-lovecraft | game-trains) (value "yes")))
        (not (info (feature game-greece)))
        =>
        (assert (asking-question (question game-greece) (answers s n)))
)

(defrule ask-game-greece-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature filler) (value T))
        (info (feature game-players) (value "2"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (not (info (feature game-abstract | game-lovecraft | game-gothic | game-fantasy | game-merchants | game-indians | game-survival | game-horror | game-castles | game-jewelry | game-renaissance-court | game-fantasy | game-futuristic | game-politics | game-indians | game-politics | game-crime | game-farms) (value  "yes")))
        (not (info (feature game-thematic | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bluff) (value "yes")))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-greece)))
        =>
        (assert (asking-question (question game-greece) (answers s n)))
)

(defrule ask-game-greece-3
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature family) (value T))
        (info (feature game-strategy) (value "yes"))
        (not (info (feature game-thematic | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes")))
        (not (info (feature game-western | game-tailoring | game-abstract | game-numbers | game-castles | game-trains | game-oriental | game-abstract | game-glass | game-farms | game-gothic | game-lovecraft | game-renaissance-court | game-fantasy | game-futuristic | game-politics | game-indians) (value "yes")))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-greece)))
        =>
        (assert (asking-question (question game-greece) (answers s n)))
)


(defrule ask-game-roman 
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature wargame)  (value T))
        (result (feature weight) (value difficile))
        =>
        (assert (asking-question (question game-roman) (answers s n)))
)

(defrule ask-game-western-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (not (info (feature game-players) (value "1")))
        (inferred (feature american) (value T))
        (info (feature user-budget) (value "<110"))
        (info (feature game-bluff) (value "yes"))
        (not (inferred (feature strategy | challenging | explorative | wtdplacement | hmovement | investigative | bidding) (value T)))
        (not (inferred (feature war | fantasy | gothic | futrstics | lovecraft | fantasy | vampyric | pirates | lord-of-the-rings | survival | indians | tale | crime) (value T)))
        (not(info (feature game-western))) 
        =>
        (assert (asking-question (question game-western) (answers s n)))
)
(defrule ask-game-western-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (not (info (feature game-players) (value "1")))
        (inferred (feature party) (value T))
        (info (feature game-bluff) (value "yes"))
        (not (inferred (feature strategy | challenging | explorative | wtdplacement | hmovement | investigative | bidding) (value T)))
        (not (inferred (feature witchcraft | horror | fireworks | castles | pirates | tale | renaissance-court | mafia | tale | fantasy | mafia | futrstics | politics ) (value T)))
        (not(info (feature game-western)))
        =>
        (assert (asking-question (question game-western) (answers s n)))
)

(defrule ask-game-western-3
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (result (feature family) (value T))
        (result (feature coop-comp) (value comp | coop\comp ))
        (info (feature game-players) (value "2" | "3" | "4"))
        (not (inferred (feature thematic |strategy | challenging | explorative | wtdplacement | hmovement | investigative | bidding | bluff) (value T)))
        (not(info (feature game-western)))
        =>
        (assert (asking-question (question game-western) (answers s n)))
)


(defrule ask-game-horror-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature filler) (value T))
        (info (feature game-thematic) (value "yes"))
        (not (inferred (feature explorative | wtdplacement | hmovement | investigative | bidding | bluff) (value T)))
        (not (info (feature game-greece | game-abstract | game-lovecraft | game-farms | game-lord-of-the-rings  | game-crime| game-merchants | game-indians | game-castles | game-futuristic | game-jewelry| game-tale | game-renaissance-court | game-politics) (value "yes")))
        (result (feature coop-comp) (value comp))
        (not(info (feature game-horror)))     
        =>
        (assert (asking-question (question game-horror) (answers s n)))
)

(defrule ask-game-horror-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (not (inferred (feature explorative | wtdplacement | hmovement | investigative | bidding | bluff) (value T)))
        (inferred (feature party) (value T))
        (info (feature game-challenging) (value "yes"))
        (result (feature coop-comp) (value coop\comp))
        (not (info (feature game-players) (value "1" | "2" | "3")))
        (not (info (feature game-witchcraft | game-fireworks | game-castles | game-pirates | game-tale | game-fantasy | game-renaissance-court | game-mafia | game-tale | game-futuristic | game-politics) (value "yes")))
        (not(info (feature game-horror)))       
        =>
        (assert (asking-question (question game-horror) (answers s n)))
)



(defrule ask-game-gothic-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature american) (value T))
        (not (info (feature game-strategy | game-wtdplacement | game-bidding) (value "yes")))
        (not (info (feature  game-pirates | game-gothic | game-survival | game-indians | game-tale | game-western) (value "yes")))
        (not(info (feature game-gothic)))
        =>
        (assert (asking-question (question game-gothic) (answers s n)))
)

(defrule ask-game-gothic-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature german) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-wtdplacement) (value "yes"))
        (not (info (feature game-greece | game-renaissance-court | game-merchants | game-indians | game-war | game-fantasy |game-castles |  game-chemistry | game-gala-hotel | game-trains) (value "yes")))
        (not(info (feature game-challenging | game-explorative | game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes")))
        (not(info (feature game-gothic)))        
        =>
        (assert (asking-question (question game-gothic) (answers s n)))
)

(defrule ask-game-gothic-3
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature filler) (value T))
        (not (info (feature game-wtdplacement | game-bidding ) (value "yes")))
        (not (info (feature game-greece | game-abstract | game-merchants | game-indians | game-castles | game-futuristic | game-jewelry| game-tale | game-renaissance-court | game-politics) (value "yes")))
        (not(info (feature game-gothic)))                     
        =>
        (assert (asking-question (question game-gothic) (answers s n)))
)
(defrule ask-game-gothic-4
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature cardgame) (value T))
        (not (info (feature game-explorative| game-hmovement | game-bidding | game-bluff) (value "yes")))
        (not (info (feature game-abstract| game-forests) (value "yes")))
        (not(info (feature game-gothic)))        
        =>
        (assert (asking-question (question game-gothic) (answers s n)))
)

(defrule ask-game-gothic-5
        (declare (salience ?*sub-normal-priority*))
        (not (retraction)) 
        (inferred (feature family) (value T)) 
        (info (feature game-thematic) (value "yes"))
        (not (info (feature game-explorative| game-hmovement | game-bidding | game-bluff) (value "yes")))
        (not (info (feature game-greece | game-abstract | game-merchants | game-indians | game-survival | game-castles | game-jewelry | game-renaissance-court | game-tale | game-politics | game-futuristic) (value "yes")))
        (not(info (feature game-gothic)))        
        =>
        (assert (asking-question (question game-gothic) (answers s n)))
)

(defrule ask-game-lovecraft-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (info (feature game-gothic) (value "yes"))
        (inferred (feature german) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-wtdplacement) (value "yes"))
        (not (info (feature game-players) (value "5" | "6" | "6+")))
        (not (info (feature  game-greece |game-industry | game-renaissance-court | game-merchants | game-indians | game-war | game-fantasy | game-chemistry | game-gala-hotel | game-trains) (value "yes")))
        (not (info (feature game-challenging | game-explorative| game-hmovement | game-bidding | game-bluff) (value "yes")))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-lovecraft)))

        =>
        (assert (asking-question (question game-lovecraft) (answers s n)))
)

(defrule ask-game-lovecraft-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (info (feature game-gothic) (value "yes"))
        (inferred (feature american) (value T))
        (not (info (feature game-strategy | game-wtdplacement | game-hmovement | game-bidding) (value "yes")))
        (not (info (feature game-war | game-vampyric | game-pirates | game-lord-of-the-rings | game-western | game-tale ) (value "yes")))
        (info (feature game-investigative) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (not (info (feature game-lovecraft)))

        =>
        (assert (asking-question (question game-lovecraft) (answers s n)))
)

(defrule ask-game-lovecraft-3
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (info (feature game-gothic) (value "yes"))
        (result (feature filler) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (not (info (feature game-explorative | game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes")))
        (not (info (feature game-greece | game-abstract | game-merchants | game-indians | game-horror | game-survival | game-castles | game-jewelry | game-lord-of-the-rings | game-politics | game-crime) (value "yes")))
        (not (info (feature game-lovecraft)))

        =>
        (assert (asking-question (question game-lovecraft) (answers s n)))
)

(defrule ask-game-lovecraft-4
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))   
        (info (feature game-gothic) (value "yes"))
        (inferred (feature cardgame) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-investigative) (value "yes"))
        (info (feature game-gothic) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (not (info (feature game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-bidding | game-bluff) (value "yes")))
        (not (info (feature game-lovecraft)))
        =>
        (assert (asking-question (question game-lovecraft) (answers s n)))
)

(defrule ask-game-lovecraft-5
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))      
        (info (feature game-gothic) (value "yes"))
        (result (feature family) (value T))
        (result (feature filler) (value T))
        (info (feature game-thematic) (value "yes"))
        (not (info (feature game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-bidding | game-bluff) (value "yes")))
        (not (info (feature game-lovecraft)))
        =>
        (assert (asking-question (question game-lovecraft) (answers s n)))
)

(defrule ask-game-war-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature american) (value T))
        (info (feature game-challenging) (value "yes"))
        (not (info (feature game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding | game-bluff) (value "yes")))
        (info (feature game-players) (value "6+"))
        (not (info (feature game-war)))    
        =>
        (assert (asking-question (question game-war) (answers s n)))
)


(defrule ask-game-war-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature german) (value T))
        (info (feature game-thematic) (value "yes"))
        (not (info (feature  game-greece |game-industry | game-renaissance-court | game-merchants | game-indians | game-castles| game-chemistry | game-gala-hotel | game-trains) (value "yes")))
        (not (info (feature game-challenging | game-explorative | game-hmovement | game-investigative |game-bidding | game-bluff) (value "yes")))
        (not (info (feature game-war)))         
        =>
        (assert (asking-question (question game-war) (answers s n)))
)


(defrule ask-game-abstract-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature filler) (value T))
        (info  (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-players) (value  "1" | "2" ))
        (not (inferred (feature  explorative | wtdplacement | hmovement | investigative | bidding | bluff) (value T)))
        (not  (info (feature game-greece | game-lovecraft | game-fantasy | game-merchants | game-indians | game-survival | game-gothic | game-horror | game-castles | game-jewelry | game-lord-of-the-rings | game-renaissance-court | game-tale | game-futuristic | game-politics | game-crime) (value "yes")))
        (not (info (feature game-abstract)))
        =>
        (assert (asking-question (question game-abstract) (answers s n)))
)

(defrule ask-game-abstract-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature cardgame) (value T))
        (result (feature coop-comp) (value coop))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-players) (value  "1" | "2" ))
        (not (inferred (feature  explorative | wtdplacement | hmovement | investigative | bidding | bluff) (value T)))
        (not (info (feature game-abstract)))
        =>
        (assert (asking-question (question game-abstract) (answers s n)))
)

(defrule ask-game-abstract-3
        (inferred (feature family) (value T))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-players) (value  "5" | "6" | "6+")))
        (not (inferred (feature strategy | challenging | explorative | wtdplacement | hmovement | investigative | bidding |  bluff) (value T)))
        (not (info (feature game-greece | game-western | game-numbers | game-castles | game-trains | game-oriental | game-farms | game-renaissance-court | game-fantasy | game-futuristic | game-politics | game-indians | game-lovecraft | game-gothic) (value "yes")))
        (not (info (feature game-abstract)))        
        =>
        (assert (asking-question (question game-abstract) (answers s n)))
)


(defrule ask-game-fantasy-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature german) (value T))
        (info (feature game-strategy) (value "yes"))
        (not (info (feature game-indians) (value "yes")))
        (not (info (feature game-players) (value  "6" | "6+")))
        (not (inferred (feature lovecraft  | gothic | greece  | industry | renaissance-court | castles | merchants | indians | chemistry | gala-hotel | trains) (value T)))
        (not (inferred (feature challenging | explorative | hmovement | investigative | bidding | bluff) (value T)))
        (not (info (feature game-fantasy)))
           =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-fantasy-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature american) (value T))
        (not (inferred (feature strategy |  wtdplacement | bidding) (value T)))
        (not (info (feature game-indians) (value "yes")))
        (not (info (feature game-indians | game-pirates | game-survival | game-crime | game-western | game-crime ) (value "yes")))
        (not (info (feature game-fantasy)))
           =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-fantasy-3
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature filler) (value T))
        (not (inferred (feature explorative | wtdplacement | hmovement | bidding ) (value T)))
        (not (info (feature game-greece | game-abstract | game-merchants | game-indians | game-survival | game-futuristic | game-jewelry | game-farms | game-futuristic | game-politics | game-crime) (value "yes")))
        (not (info (feature game-indians) (value "yes")))
        (not (info (feature game-fantasy)))
           =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-fantasy-4
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature cardgame) (value T))
        (info (feature game-challenging) (value "yes"))
        (not (info (feature  game-wtdplacement | game-hmovement |game-bidding ) (value "yes")))
        (not (info (feature game-indians | game-abstract| game-forests ) (value "yes")))
        (not (info (feature game-fantasy)))
           =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-fantasy-5
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature party) (value T))
        (info (feature game-players) (value "1" | "2"))
        (not (inferred (feature strategy | challenging | explorative | wtdplacement | hmovement | bidding ) (value T)))
        (not (info (feature game-witchcraft | game-horror | game-fireworks | game-castles | game-western | game-pirates | game-renaissance-court | game-futuristic | game-politics) (value "yes")))
        (not (info (feature game-fantasy)))
           =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-fantasy-6
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature family) (value T))
        (info (feature game-thematic) (value "yes"))
        (not (result (feature strategy  | explorative | wtdplacement | hmovement |bidding | bluff ) (value T)))
        (not (info (feature game-witchcraft | game-horror | game-fireworks | game-castles | game-western | game-pirates | game-renaissance-court | game-mafia |  game-futuristic | game-politics) (value "yes")))
        (not (info (feature game-fantasy)))
           =>
        (assert (asking-question (question game-fantasy) (answers s n)))
)

(defrule ask-game-farms-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature german) (value T))
        (not (info (feature game-challenging | game-explorative | game-hmovement | game-investigative |game-bidding ) (value "yes")))
        (not (info (feature game-greece | game-renaissance-court | game-merchants | game-chemistry | game-gala-hotel | game-restaurants | game-trains) (value "yes")))
        (info (feature game-wtdplacement) (value "yes"))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-farms)))
         =>
        (assert (asking-question (question game-farms) (answers s n)))
)

(defrule ask-game-farms-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction)) 
        (inferred (feature filler) (value T))
        (inferred (feature family) (value T))
        (not (info (feature game-challenging | game-explorative | game-hmovement | game-investigative |game-bidding |game-bluff ) (value "yes")))
        (not (info (feature game-castles | game-renaissance-court | game-tale | game-futuristic | game-politics | game-fantasy | game-indians | game-lovecraft | game-gothic ) (value "yes")))
        (info (feature game-wtdplacement) (value "yes"))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-farms)))
        =>
        (assert (asking-question (question game-farms) (answers s n)))
)


(defrule ask-game-futuristic-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))  
        (inferred (feature american) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-explorative) (value "yes"))
        (result (feature coop-comp) (value coop\comp))
        (not (info (feature game-strategy | game-challenging | game-wtdplacement | game-hmovement | game-investigative |game-bidding |game-bluff ) (value "yes")))
        (not (info (feature game-war | game-vampyric | game-pirates | game-lord-of-the-rings | game-war | game-survival | game-indians | game-western | game-crime | game-lovecraft) (value "yes")))
        (not(info (feature game-futuristic)))              
               
        =>
        (assert (asking-question (question game-futuristic) (answers s n)))
)

(defrule ask-game-futuristic-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature filler) (value T))
        (not (inferred (feature family) (value T)))
        (not (inferred (feature filler) (value T)))
        (result (feature coop-comp) (value comp))
        (info (feature game-bluff) (value "yes"))
        (not (info (feature game-explorative | game-wtdplacement | game-hmovement | game-investigative ) (value "yes")))
        (not (info (feature game-greece | game-abstract | game-lovecraft | game-gothic | game-fantasy | game-merchants | game-indians | game-survival | game-gothic | game-castles | game-jewelry | game-farms | game-renaissance-court | game-tale | game-politics | game-indians | game-crime ) (value "yes")))
        (not(info (feature game-futuristic)))
        =>
        (assert (asking-question (question game-futuristic) (answers s n)))
)

(defrule ask-game-futuristic-3
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature party) (value T))
        (inferred (feature family) (value T))
        (inferred (feature filler) (value T))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (not (info (feature  game-thematic | game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding ) (value "yes")))        
        (not (info (feature game-castles | game-renaissance-court | game-tale | game-fantasy) (value "yes")))
        (not(info (feature game-futuristic)))
        =>
        (assert (asking-question (question game-futuristic) (answers s n)))
)


(defrule ask-game-merchants-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature filler) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-indians) (value "yes"))
        (not (info (feature  game-thematic | game-strategy | game-challenging | game-explorative | game-explorative | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "yes"))) 
        (not (info (feature game-greece | game-abstract | game-lovecraft | game-gothic | game-fantasy | game-merchants | game-indians | game-survival | game-gothic | game-castles | game-jewelry | game-farms | game-renaissance-court | game-merchants | game-tale | game-politics  | game-crime ) (value "yes")))
        (not (info (feature game-merchants)))
        =>
        (assert (asking-question (question game-merchants) (answers s n)))
)


(defrule ask-game-merchants-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature german) (value T))
        (not (info (feature game-players) (value "6" | "6+")))
        (result (feature weight) (value medio | difficile))
        (not (info (feature  game-thematic | game-challenging | game-explorative | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "yes"))) 
        (not (info (feature game-farms | game-indians | game-greece  |game-industry | game-renaissance-court | game-castles | game-gothic | game-lovecraft| game-fantasy | game-chemistry | game-gala-hotel | game-trains) (value "yes")))
        (not (info (feature game-merchants)))
        =>
        (assert (asking-question (question game-merchants) (answers s n)))
)


(defrule ask-game-indians-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature german) (value T))
        (not (info (feature game-fantasy) (value "yes")))
        (not (info (feature game-gothic) (value "yes")))
        (not (info (feature  game-challenging | game-explorative | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "yes")))
        (not (info (feature  game-greece  |game-industry | game-renaissance-court | game-castles | game-merchants | game-gothic | game-lovecraft| game-fantasy | game-chemistry | game-gala-hotel | game-trains) (value "yes")))        
        (not (info (feature game-indians)))
        =>
        (assert (asking-question (question game-indians) (answers s n)))
)

(defrule ask-game-indians-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature american) (value T))
        (info (feature game-challenging) (value "yes"))
        (result (feature coop-comp) (value coop))
        (not (info (feature game-fantasy) (value "yes")))
        (not (info (feature game-gothic) (value "yes")))
        (not (info (feature game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding |  game-bluff ) (value "yes")))
        (not (info (feature game-war | game-fantasy | game-gothic | game-fantasy | game-futuristic | game-vampyric | game-pirates | game-lord-of-the-rings | game-tale | game-western | game-crime | game-lovecraft) (value "yes")))
        (not (info (feature game-indians)))
        =>
        (assert (asking-question (question game-indians) (answers s n)))
)

(defrule ask-game-indians-3
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature filler) (value T))
        (not (inferred (feature family) (value T)))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-fantasy) (value "yes")))
        (not (info (feature game-gothic) (value "yes")))
        (not (info (feature  game-explorative | game-hmovement | game-investigative | game-bidding |  game-bluff ) (value "yes")))
        (not (info (feature game-greece | game-abstract | game-lovecraft | game-gothic | game-fantasy | game-merchants | game-indians | game-survival | game-castles | game-jewelry | game-farms | game-renaissance-court | game-merchants | game-tale | game-politics  | game-crime ) (value "yes")))
        (not (info (feature game-indians)))
        =>
        (assert (asking-question (question game-indians) (answers s n)))
)

(defrule ask-game-indians-4
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature filler) (value T))
        (inferred (feature family) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (not (info (feature  game-strategy | game-challenging | game-explorative | game-hmovement | game-investigative | game-bidding |  game-bluff ) (value "yes")))
        (not (info (feature game-castles | game-farms | game-gothic | game-lovecraft | game-renaissance-court | game-tale | game-fantasy | game-futuristic ) (value "yes")))
        (not (info (feature game-fantasy) (value "yes")))
        (not (info (feature game-gothic) (value "yes")))
        (not(info (feature game-indians)))
        =>
        (assert (asking-question (question game-indians) (answers s n)))
)

(defrule ask-game-fireworks
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature party) (value T))
        (result (feature coop-comp) (value coop))
        (not (info (feature  game-thematic | game-strategy | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "yes"))) 
        =>
        (assert (asking-question (question game-fireworks) (answers s n)))
)


(defrule ask-game-survival-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature american) (value T))
        (info (feature game-challenging) (value "yes"))
        (result (feature coop-comp) (value coop))
        (info (feature game-indians ) (value  "yes"))
        (not (info (feature game-strategy | game-explorative | game-hmovement | game-wtdplacement | game-investigative |game-bidding |  game-bluff ) (value "yes"))) 
        (not (info (feature game-war | game-fantasy | game-gothic | game-fantasy | game-futuristic | game-vampyric | game-pirates | game-lord-of-the-rings | game-tale | game-western | game-crime | game-lovecraft) (value "yes")))
        (not (info (feature game-survival)))
        =>
        (assert (asking-question (question game-survival) (answers s n)))
)

(defrule ask-game-survival-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature filler) (value T))
        (info (feature game-players) (value "1"))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-indians ) (value  "yes"))
        (not (info (feature  game-explorative | game-hmovement | game-wtdplacement | game-investigative | game-bidding |  game-bluff ) (value "yes")))
        (not (info (feature game-greece | game-abstract | game-lovecraft | game-gothic | game-fantasy | game-merchants | game-indians | game-survival | game-castles | game-jewelry | game-farms | game-renaissance-court | game-merchants | game-tale | game-politics  | game-crime ) (value "yes")))
        (not (info (feature game-survival)))
        =>
        (assert (asking-question (question game-survival) (answers s n)))
)


(defrule ask-game-forests
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature cardgame) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (result (feature coop-comp) (value coop))
        (info (feature game-abstract) (value "yes"))
        (info (feature game-players) (value "1" | "2"))
        (not (info (feature  game-explorative | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "yes")))
        =>
        (assert (asking-question (question game-forests) (answers s n)))
)


(defrule ask-game-industry
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature german) (value T))
        (result (feature coop-comp) (value comp))
        (not (info (feature game-challenging | game-explorative | game-hmovement | game-investigative | game-bluff )(value "yes"))) 
        (not (info (feature  game-greece | game-merchants | game-restaurants | game-renaissance-court | game-castles | game-merchants | game-gothic | game-lovecraft| game-fantasy | game-chemistry | game-gala-hotel | game-trains) (value "yes")))
        (not (info (feature game-players) (value "6+")))               
        =>
        (assert (asking-question (question game-industry) (answers s n)))
)


(defrule ask-game-numbers
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature family) (value T))
        (result (feature coop-comp) (value coop))
        (not (info (feature  game-thematic | game-strategy | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative |game-bidding |  game-bluff ) (value "yes"))) 
        (not (info (feature game-players) (value "6" | "6+")))  
        =>
        (assert (asking-question (question game-numbers) (answers s n)))
)

(defrule ask-game-castles-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature german) (value T))
        (result (feature weight) (value medio))
        (info (feature user-budget) (value "34<44"))
        (not (info (feature  game-greece  | game-indians | game-renaissance-court | game-war | game-merchants | game-gothic | game-lovecraft| game-fantasy | game-indians | game-chemistry | game-gala-hotel | game-trains) (value "yes")))        
        (not (info (feature  game-thematic | game-challenging | game-explorative |  game-hmovement | game-investigative  |  game-bluff ) (value "yes"))) 
        (not (info(feature game-castles)))       
        =>
        (assert (asking-question (question game-castles) (answers s n)))
)

(defrule ask-game-castles-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature filler) (value T))
        (not (inferred  (feature party) (value T)))
        (not (inferred (feature family) (value T)))
        (not (inferred (feature  thematic | challenging | explorative | wtdplacement | hmovement | investigative | bidding | bluff ) (value T))) 
        (not (info (feature game-greece | game-abstract | game-lovecraft | game-gothic | game-fantasy | game-merchants | game-indians | game-survival | game-horror | game-futuristic | game-jewelry | game-lord-of-the-rings | game-renaissance-court | game-tale | game-politics | game-crime | game-farms) (value "yes")))
        (info (feature user-budget) (value  "<18" |"19<33")) 
        (result (feature weight) (value leggero))
        (not (info (feature game-castles)))    
        =>
        (assert (asking-question (question game-castles) (answers s n)))
)

(defrule ask-game-castles-3
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature filler) (value T))
        (inferred (feature family) (value T))
        (not (inferred (feature party) (value T)))
        (not (info (feature game-strategy | game-explorative | game-hmovement | game-bidding  ) (value "yes"))) 
        (info (feature user-budget) (value  "<18" |"19<33")) 
        (result (feature weight) (value leggero))
        (not (info (feature game-castles)))    
        =>
        (assert (asking-question (question game-castles) (answers s n)))
)


(defrule ask-game-castles-4
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature party) (value T))
        (inferred (feature filler) (value T))
        (inferred (feature family) (value T))
        (not (info (feature game-strategy  | game-explorative | game-wtdplacement | game-hmovement | game-bidding  ) (value "yes"))) 
        (info (feature  game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-investigative) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (not (info(feature game-castles)))       
        =>
        (assert (asking-question (question game-castles) (answers s n)))
)


(defrule ask-game-vampyric
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature american) (value T))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-hmovement) (value "yes"))
        (info (feature game-investigative) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (info (feature game-gothic) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (not (inferred (feature  strategy  | explorative | wtdplacement | hmovement | bidding  ) (value T)))
        (not (inferred (feature  futrstics |  pirates | lord-of-the-rings | war | western ) (value T)))
        =>
        (assert (asking-question (question game-vampyric) (answers s n)))
)

(defrule ask-game-renaissance-court-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature german) (value T))
        (result (feature weight) (value medio | difficile))
        (not (result (feature  challenging  | explorative | hmovement | investigative | bidding | bluff ) (value T)))
        (not (info (feature game-farms | game-industry | game-merchants | game-greece | game-indians | game-castles | game-war | game-fantasy | game-gala-hotel | game-lovecraft | game-restaurants | game-trains) (value "yes"))) 
        (not (info (feature game-players) (value "6" | "6+")))
        (not (info (feature game-renaissance-court)))    
        =>
        (assert (asking-question (question game-renaissance-court) (answers s n)))
)

(defrule ask-game-renaissance-court-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature filler) (value T))
        (inferred (feature party) (value T))
        (inferred (feature family) (value T))
        (info (feature game-bluff) (value "yes"))
        (not (info (feature game-castles | game-tale | game-fantasy | game-futuristic | game-politics) (value "yes")))
        (not (inferred (feature thematic | strategy | challenging | explorative | wtdplacement | hmovement | investigative | bidding ) (value T)))
        (not (info (feature game-renaissance-court))) 
        =>
        (assert (asking-question (question game-renaissance-court) (answers s n)))
)



(defrule ask-game-pirates-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature american) (value T))
        (inferred (feature coop-comp) (value coop\comp))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-explorative) (value "yes"))
        (not (inferred (feature  game-wtdplacement |game-hmovement | game-investigative | game-bidding | game-bluff ) (value T)))
        (not (info (feature game-war | game-fantasy | game-gothic | game-futuristic | game-lovecraft | game-fantasy | game-vampyric | game-lord-of-the-rings | game-war | game-survival | game-indians | game-western | game-tale | game-lovecraft | game-crime) (value "yes")))
        (not(info (feature game-pirates)))

        =>
        (assert (asking-question (question game-pirates) (answers s n)))
)

(defrule ask-game-pirates-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature party) (value T))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (not (inferred (feature  strategy | challenging | explorative | wtdplacement | hmovement | investigative | bidding ) (value T))) 
        (not (info (feature game-witchcraft | game-horror | game-fireworks | game-castles | game-western | game-western | game-tale | game-fantasy | game-renaissance-court | game-mafia | game-futuristic | game-politics) (value "yes")))
        (not(info (feature game-pirates)))
        =>
        (assert (asking-question (question game-pirates) (answers s n)))
)

(defrule ask-game-witchcraft
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature party) (value T))
        (not (info (feature game-players) (value "1"| "2")))
        (or     (result (feature coop-comp) (value comp))
                (result (feature coop-comp) (value coop\comp)))
        (not (inferred (feature strategy | challenging | explorative | wtdplacement | hmovement ) (value T)))
        (not (info (feature game-horror | game-fireworks | game-castles | game-western | game-pirates | game-tale | game-fantasy | game-renaissance-court | game-mafia | game-futuristic | game-politics ) (value "yes")))

        =>
        (assert (asking-question (question game-witchcraft) (answers s n)))
)

(defrule ask-game-oriental
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature family) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-thematic) (value "yes"))
        (not (info (feature game-players) (value "5" | "6" | "6+") ))
        (not (inferred (feature strategy | challenging | explorative | wtdplacement | hmovement | investigative | bidding ) (value T)))
        (not (info (feature game-greece | game-western |  game-tailoring | game-abstract | game-numbers | game-castles | game-oriental | game-glass | game-farms | game-gothic | game-lovecraft | game-renaissance-court | game-futuristic | game-politics | game-indians | game-fantasy | game-indians ) (value "yes")))
        =>
        (assert (asking-question (question game-oriental) (answers s n)))
)

(defrule ask-game-glass
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature family) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-abstract) (value "yes"))
        (not (info (feature game-players) (value "5" | "6" | "6+")))
        (not (info (feature game-strategy | game-challenging | game-explorative | game-wtdplacement |game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes")))
        =>
        (assert (asking-question (question game-glass) (answers s n)))
)

(defrule ask-game-chemistry
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature german) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-wtdplacement) (value "yes"))
        (info (feature game-renaissance-court) (value "yes"))
        (not (info (feature  game-challenging | game-explorative | game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes")))
        (not (info (feature  game-greece  |game-industry | game-castles | game-merchants | game-gothic | game-lovecraft| game-fantasy | game-chemistry | game-gala-hotel | game-trains) (value "yes")))  
        (info (feature game-players) (value "2" | "3" | "4"))
        (not (result (feature chemistry) (value F)))
        =>
        (assert (asking-question (question game-chemistry) (answers s n)))
)


(defrule ask-game-lord-of-the-rings-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (info (feature game-fantasy) (value "yes"))
        (inferred (feature american) (value T))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (info (feature game-gothic) (value "yes"))
        
        (not (info (feature game-strategy | game-explorative | game-wtdplacement | game-investigative | game-bidding) (value "yes")))
        (not (info (feature  game-futuristic | game-lovecraft | game-pirates | game-survival | game-indians | game-western | game-tale | game-crime) (value "yes")))
        (info (feature game-players) (value "2" | "3" | "4" | "5"))

        (not (info (feature game-lord-of-the-rings)))
        =>
        (assert (asking-question (question game-lord-of-the-rings) (answers s n)))
)

(defrule ask-game-lord-of-the-rings-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (info (feature game-fantasy) (value "yes"))
        (inferred (feature filler) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (info (feature game-gothic) (value "yes"))
        (not (info (feature game-thematic | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes")))
        (not (info (feature game-greece | game-abstract | game-lovecraft | game-merchants | game-indians | game-horror | game-futuristic | game-castles | game-jewelry | game-farms | game-tale | game-politics | game-indians | game-crime ) (value "yes")))
        (info (feature game-players) (value "2"))
        (not (info (feature game-lord-of-the-rings)))                 
        =>
        (assert (asking-question (question game-lord-of-the-rings) (answers s n)))
)

(defrule ask-game-lord-of-the-rings-3
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature cardgame) (value T))
        (result (feature coop-comp) (value coop))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (info (feature game-gothic) (value "yes"))
        (not (info (feature game-strategy | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes")))
        (not (info (feature game-lovecraft | game-dream | game-abstract | game-forests ) (value "yes")))
        (info (feature game-players) (value "1" | "2"))      
        (not (info (feature game-lord-of-the-rings)))
        =>
        (assert (asking-question (question game-lord-of-the-rings) (answers s n)))
)


(defrule ask-game-tale-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature american) (value T))
        (result (feature coop-comp) (value coop))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-explorative) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (not (info (feature game-players) (value "5" | "6" | "6+")))
        (not (info (feature game-strategy | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes")))
        (not (info (feature game-war | game-gothic | game-futuristic | game-lovecraft | game-vampyric | game-pirates | game-lord-of-the-rings | game-survival | game-indians | game-western | game-crime) (value "yes")))
        (not(info (feature game-tale)))
        =>
        (assert (asking-question (question game-tale) (answers s n)))
)

(defrule ask-game-tale-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature filler) (value T))
        (inferred (feature party) (value T))
        (inferred (feature family) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-fantasy) (value "yes"))
        (not (info (feature game-players) (value "1" | "2" | "6+")))
        (not (info (feature game-strategy | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes")))
        (not (info (feature game-castles | game-renaissance-court | game-futuristic | game-politics) (value "yes")))
        (not(info (feature game-tale)))
        =>
        (assert (asking-question (question game-tale) (answers s n)))
)

(defrule ask-game-tale-3
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature party) (value T))
        (not (inferred (feature filler) (value T)))
        (not (result (feature party) (value T)))
        (info (feature game-bluff) (value "yes"))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-fantasy) (value "yes"))
        (not (info (feature game-players) (value "1" | "2")))
        (not (info (feature game-thematic | game-strategy | game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding ) (value "yes")))
        (not (info (feature game-witchcraft | game-horror |game-fireworks | game-castles | game-western | game-pirates | game-witchcraft | game-renaissance-court | game-mafia | game-futuristic | game-politics) (value "yes")))
        (not(info (feature game-tale)))
        =>
        (assert (asking-question (question game-tale) (answers s n)))
)

(defrule ask-game-crime-1
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature american) (value T))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-investigative) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (not (info (feature game-strategy |  game-explorative | game-wtdplacement | game-hmovement | game-bidding ) (value "yes")))
        (not (info (feature game-war | game-fantasy | game-futuristic | game-lovecraft | game-vampyric | game-pirates | game-lord-of-the-rings | game-survival | game-indians | game-western ) (value "yes")))
        (not (info (feature game-crime)))
        =>
        (assert (asking-question (question game-crime) (answers s n)))
)

(defrule ask-game-crime-2
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature filler) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-investigative) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (not (info (feature game-strategy |  game-explorative | game-wtdplacement | game-hmovement | game-bidding ) (value "yes")))
        (not (info (feature game-greece | game-abstract | game-lovecraft | game-fantasy | game-merchants | game-indians | game-survival | game-horror | game-futuristic | game-castles | game-jewelry | game-farms | game-lovecraft | game-renaissance-court | game-tale | game-politics | game-indians | game-fantasy) (value "yes")))
        (not (info (feature game-players) (value "1")))
        (not(info (feature game-crime)))
        =>
        (assert (asking-question (question game-crime) (answers s n)))
)


(defrule ask-game-restaurants
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature german) (value T))
        (info (feature game-thematic) (value "yes"))
        (result (feature weight) (value medio))
        (info (feature game-players) (value "2" | "3" | "4"))
        (not (info (feature game-strategy | game-challenging | game-explorative | game-hmovement | game-investigative | game-bidding | game-bluff ) (value "yes")))
    
        =>
        (assert (asking-question (question game-restaurants) (answers s n)))
)


(defrule ask-game-mafia
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (inferred (feature party) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (info (feature game-bluff) (value "yes"))  
        (not (info (feature  game-challenging | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding  ) (value "yes"))) 
        (info (feature game-players) (value "3" | "4" | "5" ))
       
        =>
        (assert (asking-question (question game-mafia) (answers s n)))
)


(defrule ask-game-politics
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        
        (inferred (feature filler) (value T))
        (inferred (feature party) (value T))
        (inferred (feature family) (value T))
        (result (feature coop-comp) (value comp))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-bluff) (value "yes"))
        (not (info (feature game-thematic | game-strategy | game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding ) (value "yes")))
        (info (feature game-players) (value "3" | "4" | "5" | "6"))
        =>
        (assert (asking-question (question game-politics) (answers s n)))
)


