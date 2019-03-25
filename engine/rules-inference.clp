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
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Inferred: " (upcase ?feature) "  "(upcase ?value)))
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
        (info (feature user-age) (value "40<50"|"50<60"))
        =>
        (assert (infering (feature age) (value adult)))
)

(defrule inferred-age-elder
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "60<70" | "70<")) 
        =>
        (assert (infering (feature age) (value elder)))
)


(defrule inferred-group-age-child
        (declare (salience ?*high-priority*))
        (info (feature group-age) (value "10"))
        =>
        (assert (infering (feature age) (value child)))
)

(defrule inferred-group-age-boy
        (declare (salience ?*high-priority*))
        (info (feature group-age) (value "20"))
        =>
        (assert (infering (feature age) (value boy)))
)

(defrule inferred-group-age-young
        (declare (salience ?*high-priority*))
        (info (feature group-age) (value "30"|"40"))
        =>
        (assert (infering (feature age) (value young)))
)

(defrule inferred-group-age-adult
        (declare (salience ?*high-priority*))
        (info (feature group-age) (value "50"|"60"))
        =>
        (assert (infering (feature age) (value adult)))
)

(defrule inferred-group-age-elder
        (declare (salience ?*high-priority*))
        (info (feature group-age) (value  "60" | "70" | "70<")) 
        =>
        (assert (infering (feature age) (value elder)))
)

(defrule inferred-weight-easy
         (declare (salience ?*high-priority*))
         (or    (info (feature user-experience) (value "zero" | "litle"))
                (info (feature group-experience) (value "zero" | "litle"))
                (inferred (feature age) (value child )))
         =>
         (assert (infering (feature weight) (value facile)))
)

(defrule inferred-weight-medium
         (declare (salience ?*high-priority*))
         (or    (info (feature user-experience) (value "normal"))
                (info (feature group-experience) (value "normal")))
         (not(inferred (feature age) (value  child )))     
         =>
         (assert (infering (feature weight) (value medio)))
)


(defrule inferred-weight-high
        (declare (salience ?*high-priority*))

        (or     (info (feature user-experience) (value "high"))
                (info (feature group-experience) (value "high")))
        (not(inferred (feature age) (value  child | elder)))
        =>
        (assert (infering (feature weight) (value difficile)))
)




(defrule inferred-cardgame
        (declare (salience ?*highest-priority*))
        (info (feature game-cardgame) (value  "yes"))
        (game-general-kind (general-kind $?game-general-kind))
        =>
        (assert (infering(feature cardgame) (value T)) (bind $?game-general-kind (create$ $?game-general-kind cardgame)) (game-general-kind (general-kind $?game-general-kind)))
)

(defrule inferred-wargame 
        (declare (salience ?*highest-priority*))
        (info (feature game-wargame) (value "yes"))
        (game-general-kind (general-kind $?game-general-kind))
        =>
        (assert (infering(feature wargame) (value T)) (bind $?game-general-kind (create$ $?game-general-kind wargame)) (game-general-kind (general-kind $?game-general-kind)))
)       

(defrule inferred-family 
        (declare (salience ?*highest-priority*))
        (info (feature game-family) (value "yes"))
        (game-general-kind (general-kind $?game-general-kind))
        =>
        (assert (infering(feature family) (value T)) (bind $?game-general-kind (create$ $?game-general-kind family)) (game-general-kind (general-kind $?game-general-kind)))
)       

(defrule inferred-party 
        (declare (salience ?*highest-priority*))
        (info (feature game-players) (value "5" | "6" | "6+"))
        (or     (inferred (feature weight) (value facile))
                (inferred (feature weight) (value medio)))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))
        (inferred (feature  explorative |wtdplacement | hmovement | bidding) (value F))
        (game-general-kind (general-kind $?game-general-kind))

        =>
        (assert (infering(feature party) (value T)) (bind $?game-general-kind (create$ $?game-general-kind party)) (game-general-kind (general-kind $?game-general-kind)))
)    



(defrule inferred-filler
        (declare (salience ?*highest-priority*))
        (info (feature game-time) (value "<60"))
        (inferred (feature weight) (value facile))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))
        (inferred (feature german) (value F))
        (not (info (feature game-explorative) (value "yes")))
        (game-general-kind (general-kind $?game-general-kind))
        =>
        (assert (infering(feature filler) (value T))  (bind $?game-general-kind (create$ $?game-general-kind filler)) (game-general-kind (general-kind $?game-general-kind)))
)

(defrule inferred-german
        (declare (salience ?*highest-priority*))
        (info (feature game-wtdplacement) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (result (feature coop-comp) (value comp))
        (not (result (feature filler) (value T)))
        (game-general-kind (general-kind $?game-general-kind))
        =>
        (assert (infering(feature german) (value T))  (bind $?game-general-kind (create$ $?game-general-kind german)) (game-general-kind (general-kind $?game-general-kind)))
)

(defrule inferred-no-german
        (declare (salience ?*highest-priority*))
        (or (inferred (feature wtdplacement | strategy) (value F))
            (result (feature coop-comp) (value coop | coop-comp))
        )
        
        =>
        (assert (infering (feature german) (value F)))
)


(defrule inferred-no-family 
        (declare (salience ?*highest-priority*))
        (or
            (inferred (feature weight) (value difficile))
            (info (feature game-wargame) (value "yes"))
            (info (feature game-cardgame) (value "yes"))
            (info (feature game-players) (value "1"))
            (inferred (feature explorative | hmovement | bidding) (value T))
            (info (feature user-budget) (value "66<110" | "110<"))
            (info (feature game-time) (value ">60"))
            (result (feature coop-comp) (value coop\comp))
        )
        =>
        (assert (infering (feature family) (value F)))

)


(defrule inferred-american-1
        (declare (salience ?*highest-priority*))
        (info (feature game-time) (value ">60"))
        (info (feature user-budget) (value "34<44" | "45<65" | "66<110" | "110<"))
        (info (feature game-thematic) (value "yes"))
        (not (inferred (feature weight) (value facile)))
        (not (info(feature strategy) (value "yes")))
        (inferred (feature   wtdplacement) (value F))
        (inferred (feature bidding) (value F))
        (inferred (feature strategy) (value F))
        (not (inferred (feature american)))
        (game-general-kind (general-kind $?game-general-kind))
        =>
        (assert (infering (feature american) (value T)) (bind $?game-general-kind (create$ $?game-general-kind american)) (game-general-kind (general-kind $?game-general-kind)))

)
(defrule inferred-american-2
        (declare (salience ?*highest-priority*))
        (info (feature game-time) (value ">60"))
        (info (feature user-budget) (value "34<44" | "45<65" | "66<110" | "110<"))
        (info (feature game-thematic) (value "yes"))
        (inferred (feature weight) (value facile))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-explorative) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (inferred (feature wtdplacement) (value F))
        (inferred (feature bidding) (value F))
        (inferred (feature strategy) (value F))
        (result (feature coop-comp) (value coop\comp))
        (not (inferred (feature american)))
        (game-general-kind (general-kind $?game-general-kind))
        =>
        (assert (infering (feature american) (value T)) (bind $?game-general-kind (create$ $?game-general-kind american)) (game-general-kind (general-kind $?game-general-kind)))

)

(defrule inferred-thematic
        (declare (salience ?*high-priority*))
        (info (feature  game-thematic) (value "yes"))
        (game-secondary-kind (secondary-kind $?game-secondary-kind))
        =>
        (assert (infering (feature thematic) (value T)) (bind $?game-secondary-kind (create$ $?game-secondary-kind thematic)) (game-secondary-kind (secondary-kind $?game-secondary-kind)))
)

(defrule inferred-strategy
        (declare (salience ?*high-priority*))
        (info (feature  game-strategy) (value "yes"))
        (game-secondary-kind (secondary-kind $?game-secondary-kind))
        =>
        (assert (infering (feature strategy) (value T)) (bind $?game-secondary-kind (create$ $?game-secondary-kind strategy)) (game-secondary-kind (secondary-kind $?game-secondary-kind)))
)


(defrule inferred-challenging
        (declare (salience ?*high-priority*))
        (info (feature  game-challenging) (value "yes"))
        (game-secondary-kind (secondary-kind $?game-secondary-kind))
        =>
        (assert (infering (feature challenging) (value T)) (bind $?game-secondary-kind (create$ $?game-secondary-kind challenging)) (game-secondary-kind (secondary-kind $?game-secondary-kind)))
)


(defrule inferred-explorative
        (declare (salience ?*high-priority*))
        (info (feature  game-explorative) (value "yes"))
        (game-secondary-kind (secondary-kind $?game-secondary-kind)) 
        =>
        (assert (infering (feature explorative) (value T)) (bind $?game-secondary-kind (create$ $?game-secondary-kind explorative)) (game-secondary-kind (secondary-kind $?game-secondary-kind)))
)

(defrule inferred-wtdplacement
        (declare (salience ?*high-priority*))
        (info (feature  game-wtdplacement) (value "yes"))
        (game-secondary-kind (secondary-kind $?game-secondary-kind))
        =>
        (assert (infering (feature wtdplacement) (value T)) (bind $?game-secondary-kind (create$ $?game-secondary-kind wtdplacement)) (game-secondary-kind (secondary-kind $?game-secondary-kind)))
)

(defrule inferred-hmovement
        (declare (salience ?*high-priority*))
        (info (feature  game-hmovement) (value "yes"))
        (game-secondary-kind (secondary-kind $?game-secondary-kind))
        =>
        (assert (infering (feature hmovement) (value T)) (bind $?game-secondary-kind (create$ $?game-secondary-kind hmovement)) (game-secondary-kind (secondary-kind $?game-secondary-kind)))
)

(defrule inferred-investigative
        (declare (salience ?*high-priority*))
        (info (feature  game-investigative) (value "yes"))
        (game-secondary-kind (secondary-kind $?game-secondary-kind))
        =>
        (assert (infering (feature investigative) (value T)) (bind $?game-secondary-kind (create$ $?game-secondary-kind investigative)) (game-secondary-kind (secondary-kind $?game-secondary-kind)))
)

(defrule inferred-bidding
        (declare (salience ?*high-priority*))
        (info (feature  game-bidding) (value "yes"))
        (game-secondary-kind (secondary-kind $?game-secondary-kind))
        =>
        (assert (infering (feature bidding) (value T)) (bind $?game-secondary-kind (create$ $?game-secondary-kind bidding)) (game-secondary-kind (secondary-kind $?game-secondary-kind)))
)

(defrule inferred-bluff
        (declare (salience ?*high-priority*))
        (info (feature  game-bluff) (value "yes"))
        (game-secondary-kind (secondary-kind $?game-secondary-kind))
        =>
        (assert (infering (feature bluff) (value T)) (bind $?game-secondary-kind (create$ $?game-secondary-kind bluff)) (game-secondary-kind (secondary-kind $?game-secondary-kind)))
)


(defrule inferred-no-thematic
        (declare (salience ?*high-priority*))
        (or (info (feature  game-thematic) (value "no"))
            (info (feature game-wargame) (value "yes")))
        
        =>
        (assert (infering (feature thematic) (value F)))
)

(defrule inferred-no-strategy-1
        (declare (salience ?*high-priority*))
        (info (feature  game-strategy) (value "no"))

        (not (inferred (feature strategy)))
        =>
        (assert (infering (feature strategy) (value F)))
)

(defrule inferred-no-strategy-2
        (declare (salience ?*high-priority*))
        (info (feature game-players) (value "1"))
        (info (feature game-hmovement | game-investigative | game-bidding | game-bluff) (value "yes") )
        (not (inferred (feature strategy)))
              =>
        (assert (infering (feature strategy) (value F)))
)

(defrule inferred-no-strategy-3
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value comp))
        (info (feature game-explorative | game-hmovement | game-investigative ) (value "yes"))
        (not (inferred (feature strategy)))
        =>
        (assert (infering (feature strategy) (value F)))
)

(defrule inferred-no-strategy-4
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value coop))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-explorative | game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff ) (value "yes"))
        (not (inferred (feature strategy)))
        =>
        (assert (infering (feature strategy) (value F)))
)

(defrule inferred-no-strategy-5
        (declare (salience ?*high-priority*)) 
        (result (feature coop-comp) (value coop\comp))
            (or    (info (feature game-thematic) (value "no"))
                (info (feature game-challenging) (value "no"))
                (info (feature game-explorative) (value "no"))
                (info (feature game-wtdplacement | game-hmovement | game-investigative | game-bidding | game-bluff ) (value "yes"))
            )
        (not (inferred (feature strategy)))
        =>
        (assert (infering-result (feature strategy) (value F)))
)

(defrule inferred-no-strategy-6
        (declare (salience ?*high-priority*)) 
        (result (feature coop-comp) (value comp))
        (inferred (feature filler) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-challenging) (value "yes"))
        (not (result (feature strategy)))
        =>
        (assert (infering-result (feature strategy) (value F)))
)

(defrule inferred-no-challenging-1
        (declare (salience ?*high-priority*))
        (or (info (feature  game-challenging) (value "no"))
            (inferred (feature wargame) (value T))
            (info (feature game-wtdplacement | game-bidding) (value "yes"))
        )
        (not (inferred (feature challenging)))

        =>
        (assert (infering-result (feature challenging) (value F)))
)

(defrule inferred-no-challenging-2
        (declare (salience ?*high-priority*))
        (info (feature game-players) (value "1"))
        (info (feature  game-hmovement ) (value "yes"))
        (not (inferred (feature challenging)))
        =>
        (assert (infering (feature challenging) (value F)))
)

(defrule inferred-no-challenging-3
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value comp))
        (info (feature game-explorative | game-hmovement) (value "yes"))
        (not (inferred (feature challenging)))
        =>
        (assert (infering (feature challenging) (value F)))
)

(defrule inferred-no-challenging-4
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value coop))
        (info (feature game-hmovement | game-bluff) (value "yes"))
        (not (inferred (feature challenging)))
        =>
        (assert (infering (feature challenging) (value F)))
)

(defrule inferred-no-challenging-5
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value comp))
        (inferred (feature filler) (value T))
        (info (feature game-thematic) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (not (inferred (feature challenging)))
        =>
        (assert (infering (feature challenging) (value F)))
)


(defrule inferred-no-explorative-1
        (declare (salience ?*high-priority*))
        (or     (info (feature  game-explorative) (value "no"))
                (info (feature game-wtdplacement | game-hmovement | game-bidding | game-bluff) (value "yes"))
                (inferred (feature german | filler | family | party) (value T)))
        (not (inferred (feature explorative)))
        =>
        (assert (infering-result (feature explorative) (value F)))
)

(defrule inferred-no-explorative-2
        (declare (salience ?*high-priority*))
        (info (feature game-players) (value "1"))
        (or
            (info (feature game-thematic) (value "no"))
            (info (feature game-challenging) (value "no"))
        )
        (not (inferred (feature explorative)))
        =>
        (assert (infering (feature explorative) (value F)))
)

(defrule inferred-no-explorative-3
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value coop))
        (or (info (feature game-thematic | game-challenging ) (value "no"))
            (info (feature game-strategy) (value "yes"))
        )
        (not (inferred (feature explorative)))
        =>
        (assert (infering (feature explorative) (value F)))
)

(defrule inferred-no-explorative-4
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-thematic) (value "no"))
        (not (inferred (feature explorative)))
        =>
        (assert (infering (feature explorative) (value F)))
)


(defrule inferred-no-wtdplacement-1
        (declare (salience ?*high-priority*))
        (or (info (feature  game-wtdplacement) (value "no"))
            (info (feature game-challenging | game-explorative | game-hmovement | game-investigative | game-bluff) (value "yes"))
            (result (feature coop-comp) (value coop | coop\comp))
        )
        (not (inferred (feature wtdplacement)))
        =>
        (assert (infering (feature wtdplacement) (value F)))
)



(defrule inferred-no-hmovement-1
        (declare (salience ?*high-priority*))
        (or (info (feature  game-hmovement) (value "no"))
            (info (feature game-thematic) (value "no"))
            (info (feature game-challenging) (value "no"))
            (info (feature game-bluff) (value "no"))
            (info (feature game-strategy | game-explorative | game-wtdplacement | game-bidding) (value "yes"))
        )    
        (not (inferred (feature hmovement)))
        =>
        (assert (infering (feature hmovement) (value F)))
)

(defrule inferred-no-investigative-1
        (declare (salience ?*high-priority*))
        (or (info (feature  game-investigative) (value "no"))
            (inferred (feature wargame) (value T))
            (info (feature game-strategy | game-wtdplacement | game-bidding) (value "yes"))
        
        )
        (not (inferred (feature investigative)))
        =>
        (assert (infering (feature investigative) (value F)))
)

(defrule inferred-no-investigative-2
        (declare (salience ?*high-priority*))
        (info (feature game-players) (value "1"))
        (or 
            (info (feature game-thematic) (value "no"))
            (info (feature game-challenging) (value "no"))

        )    
        (not (inferred (feature investigative)))
        =>
        (assert (infering (feature investigative) (value F)))
)

(defrule inferred-no-investigative-3
        (declare (salience ?*high-priority*))
        (or
            (info (feature game-thematic) (value "no"))
            (info (feature game-challenging) (value "no"))
            (info (feature game-bluff) (value "no"))
            (info (feature game-explorative  | game-hmovement ) (value "yes"))
        )
        (result (feature coop-comp) (value comp))
        (not (inferred (feature investigative)))
        =>
        (assert (infering (feature investigative) (value F)))
)

(defrule inferred-no-investigative-4
        (declare (salience ?*high-priority*))
        (or
            (info (feature game-thematic) (value "no"))
            (info (feature game-challenging) (value "no"))
            (info (feature  game-hmovement | game-bluff) (value "yes"))
        )
        (result (feature coop-comp) (value coop))
        (not (inferred (feature investigative)))
        =>
        (assert (infering (feature investigative) (value F)))
)

(defrule inferred-no-investigative-5
        (declare (salience ?*high-priority*))
        (or
            (info (feature game-thematic) (value "no"))
            (info (feature   game-wtdplacement | game-bidding ) (value "yes"))
        )
        (result (feature coop-comp) (value coop\comp))
        (not (inferred (feature investigative)))
        =>
        (assert (infering (feature investigative) (value F)))
)


(defrule inferred-no-bidding
        (declare (salience ?*high-priority*))
        (or (info (feature  game-bidding) (value "no"))
            (inferred (feature wargame) (value T))
            (info (feature game-strategy) (value "no"))
            (inferred (feature challenging | explorative | hmovement | investigative ) (value T))
            (result (feature coop-comp) (value coop | coop\comp))
            (info (feature game-players)  (value "1"| "6+"))
        )
        
        =>
        (assert (infering (feature bidding) (value F)))
)

(defrule inferred-no-bluff-1
        (declare (salience ?*high-priority*))
        (or (info (feature  game-bluff) (value "no"))
            (inferred (feature wargame) (value T))
            (info (feature game-explorative | game-wtdplacement ) (value "yes"))
            (result (feature coop-comp) (value coop))
        )

        (not (inferred (feature bluff)))
        =>
        (assert (infering (feature bluff) (value F)))
)

(defrule inferred-no-bluff-2
        (declare (salience ?*high-priority*))
        (info (feature  game-hmovement) (value "yes"))
        (result (feature coop-comp) (value comp))
        (not (inferred (feature bluff)))
        =>
        (assert (infering (feature bluff) (value F)))
)

(defrule inferred-no-bluff-3
        (declare (salience ?*high-priority*))
        (result (feature coop-comp) (value coop\comp))
        (info (feature game-strategy | game-bidding) (value "yes"))
        (not (inferred (feature bluff)))
        =>
        (assert (infering (feature bluff) (value F)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule inferred-greece
        (declare (salience ?*highest-priority*))
        (info (feature game-greece) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering(feature greece) (value T)) (bind $?game-thematic-environment (create$ $?game-thematic-environment greece)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)

(defrule inferred-roman
        (declare (salience ?*highest-priority*))
        (info (feature game-roman) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering(feature roman )(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment roman)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-western
        (declare (salience ?*highest-priority*))
        (info (feature game-western) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering(feature western )(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment western)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-horror
        (declare (salience ?*highest-priority*))
        (info (feature game-horror) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering(feature horror )(value T)) (bind $?game-thematic-environment (create$ $?game-thematic-environment horror)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-gothic
        (declare (salience ?*highest-priority*))
        (info (feature game-gothic) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering(feature gothic )(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment gothic)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)

(defrule  inferred-lovecraft
        (declare (salience ?*highest-priority*))
        (info (feature game-lovecraft) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering(feature lovecraft )(value T)) (bind $?game-thematic-environment (create$ $?game-thematic-environment lovecraft)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-war
        (declare (salience ?*highest-priority*))
        (info (feature game-war) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering(feature war )(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment war)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-abstract
        (declare (salience ?*highest-priority*))
        (info (feature game-abstract) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering(feature abstract )(value T)) (bind $?game-thematic-environment (create$ $?game-thematic-environment abstract)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))
)
(defrule  inferred-fantasy
        (declare (salience ?*highest-priority*))
        (info (feature game-fantasy) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering(feature fantasy )(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment fantasy)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-farms
        (declare (salience ?*highest-priority*))
        (info (feature game-farms) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering(feature farms )(value T)) (bind $?game-thematic-environment (create$ $?game-thematic-environment farms)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))
)

(defrule  inferred-futuristics
        (declare (salience ?*highest-priority*))
        (info (feature game-futuristics) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering(feature futuristics )(value T)) (bind $?game-thematic-environment (create$ $?game-thematic-environment futuristics)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))
)
(defrule  inferred-merchants
        (declare (salience ?*highest-priority*))
        (info (feature game-merchants) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering(feature merchants )(value T)) (bind $?game-thematic-environment (create$ $?game-thematic-environment merchants)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-indians
        (declare (salience ?*highest-priority*))
        (info (feature game-indians) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering(feature indians )(value T)) (bind $?game-thematic-environment (create$ $?game-thematic-environment indians))(game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-fireworks
        (declare (salience ?*highest-priority*))
        (info (feature game-fireworks) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering(feature fireworks )(value T)) (bind $?game-thematic-environment (create$ $?game-thematic-environment fireworks)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-survival
        (declare (salience ?*highest-priority*))
        (info (feature game-survival) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering (feature survival )(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment survival)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))
)
(defrule  inferred-forests
        (declare (salience ?*highest-priority*))
        (info (feature game-forests) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering (feature forests )(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment forests)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-industry
        (declare (salience ?*highest-priority*))
        (info (feature game-industry) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering (feature industry )(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment industry)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-numbers
        (declare (salience ?*highest-priority*))
        (info (feature game-numbers) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering (feature numbers )(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment numbers)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)

(defrule  inferred-castles
        (declare (salience ?*highest-priority*))
        (info (feature game-castles) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering (feature castles )(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment castles)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-vampyric
        (declare (salience ?*highest-priority*))
        (info (feature game-vampyric) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
         =>
        (assert (infering (feature vampyric )(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment vampyric)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)

(defrule  inferred-renaissance-court
        (declare (salience ?*highest-priority*))
        (info (feature game-renaissance-court) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering (feature renaissance-court )(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment greece)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)
(defrule  inferred-pirates
        (declare (salience ?*highest-priority*))
        (info (feature game-pirates) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering (feature  pirates)(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment pirates)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)

(defrule  inferred-witchcraft
        (declare (salience ?*highest-priority*))
        (info (feature game-witchcraft) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering (feature  witchcraft)(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment witchcraft)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)


(defrule inferred-oriental
        (declare (salience ?*highest-priority*))
        (info (feature game-oriental) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering (feature  oriental)(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment oriental)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)


(defrule infering-inferred-glass
        (declare (salience ?*highest-priority*))
        (info (feature game-glass) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering (feature  glass)(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment glass)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)


(defrule infering-inferred-chemistry
        (declare (salience ?*highest-priority*))
        (info (feature game-chemistry) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering (feature  chemistry)(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment chemistry)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)

(defrule inferred-lord-of-the-rings
        (declare (salience ?*highest-priority*))
        (info (feature game-lord-of-the-rings) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering (feature  lord-of-the-rings)(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment lord-of-the-rings)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)


(defrule inferred-tale
        (declare (salience ?*highest-priority*))
        (info (feature game-tale) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering (feature  tale)(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment tale)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)

(defrule inferred-crime
        (declare (salience ?*highest-priority*))
        (info (feature game-crime) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering (feature  crime)(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment crime)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)

(defrule inferred-restaurants
        (declare (salience ?*highest-priority*))
        (info (feature game-restaurants) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering (feature  restaurants)(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment restaurants)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)

(defrule inferred-mafia
        (declare (salience ?*highest-priority*))
        (info (feature game-mafia) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering (feature  mafia)(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment mafia)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))

)


(defrule inferred-politics
        (declare (salience ?*highest-priority*))
        (info (feature game-politics) (value "yes"))
        (game-thematic-environment (thematic-environment $?game-thematic-environment))
          =>
        (assert (infering (feature  politics)(value T))(bind $?game-thematic-environment (create$ $?game-thematic-environment politics)) (game-thematic-environment (thematic-environment $?game-thematic-environment)))
)