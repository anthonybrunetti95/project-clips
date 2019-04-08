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

(defrule inferred-create-list
    (declare (salience ?*high-priority*))
    =>
    (assert (infering (feature instance) (value T)))
    (make-instance gte of game-thematic-environment)
    (make-instance gsk of game-secondary-kind)       
    (make-instance ggk of game-general-kind)
)

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
        =>
        (assert (infering(feature cardgame) (value T)))
        (slot-insert$ [ggk] general-kind (+ (length$ (send [ggk] get-general-kind)) 1) cardgame)
)       

(defrule inferred-wargame 
        (declare (salience ?*highest-priority*))
        (info (feature game-wargame) (value "yes"))
     
        =>
        (assert (infering(feature wargame) (value T)))
        (assert (infering (feature war) (value T)))
        (slot-insert$ [ggk] general-kind (+ (length$ (send [ggk] get-general-kind)) 1) wargame)
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) war)

)

(defrule inferred-family 
        (declare (salience ?*highest-priority*))
        (info (feature game-family) (value "yes"))
        
       
        =>
        (assert (infering(feature family) (value T)))
        (slot-insert$ [ggk] general-kind (+ (length$ (send [ggk] get-general-kind)) 1) family)
)


(defrule inferred-party 
        (declare (salience ?*highest-priority*))
        (info (feature game-players) (value "5" | "6" | "6+"))
        (result (feature weight) (value facile | medio))
        (inferred (feature age) (value child | elder ))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))
        (not (info (feature  game-explorative | game-wtdplacement | game-hmovement | game-bidding) (value "yes")))
        
        =>
        (assert (infering(feature party) (value T)))
        (slot-insert$ [ggk] general-kind (+ (length$ (send [ggk] get-general-kind)) 1) party)
)    



(defrule inferred-filler
        (declare (salience ?*highest-priority*))
        (info (feature game-time) (value "<60"))
        (result (feature weight) (value facile))
        (info (feature user-budget) (value "<18" | "19<33" | "34<44"))
        (not (info (feature game-explorative) (value "yes")))
        
        =>
        (assert (infering(feature filler) (value T))) 
        (slot-insert$ [ggk] general-kind (+ (length$ (send [ggk] get-general-kind)) 1) filler)
)
(defrule inferred-german
        (declare (salience ?*highest-priority*))
        (info (feature game-wtdplacement) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (result (feature coop-comp) (value comp))
        (not (result (feature filler) (value T)))
       
        =>
        (assert (infering(feature german) (value T)))
        (slot-insert$ [ggk] general-kind (+ (length$ (send [ggk] get-general-kind)) 1) german)

)

(defrule inferred-american-1
        (declare (salience ?*highest-priority*))
        (info (feature game-time) (value ">60"))
        (not (info (feature user-budget) (value "<18" | "19<33" )))
        (info (feature game-thematic) (value "yes"))
        (not (inferred (feature weight) (value facile)))
        (not (info(feature strategy) (value "yes")))
        (not(inferred (feature wtdplacement) (value T)))
        (not (inferred (feature bidding) (value T)))
        (not (inferred (feature strategy) (value T)))
 
 

        =>
        (assert (infering (feature american) (value T)))
       (slot-insert$ [ggk] general-kind (+ (length$ (send [ggk] get-general-kind)) 1) american)
)
(defrule inferred-american-2
        (declare (salience ?*highest-priority*))
        (info (feature game-time) (value ">60"))
        (not (info (feature user-budget) (value "<18" | "19<33")))
        (info (feature game-thematic) (value "yes"))
        (inferred (feature weight) (value facile))
        (info (feature game-challenging) (value "yes"))
        (info (feature game-explorative) (value "yes"))
        (info (feature game-strategy) (value "yes"))
        (not (inferred (feature wtdplacement) (value T)))
        (not (inferred (feature bidding) (value T)))
        (not (inferred (feature strategy) (value T)))
        (result (feature coop-comp) (value coop\comp))

        =>
        (assert (infering (feature american) (value T)))
        (slot-insert$ [ggk] general-kind (+ (length$ (send [ggk] get-general-kind)) 1) american)

)

(defrule inferred-thematic
        (declare (salience ?*high-priority*))
        (info (feature  game-thematic) (value "yes"))
        =>
        (assert (infering (feature thematic) (value T)))
        (slot-insert$ [gsk]  secondary-kind (+ (length$ (send [gsk] get-secondary-kind)) 1) thematic)
)

(defrule inferred-strategys
        (declare (salience ?*high-priority*))
        (info (feature  game-strategy) (value "yes"))
     
        =>
        (assert (infering (feature strategy) (value T)))
        (slot-insert$ [gsk]  secondary-kind (+ (length$ (send [gsk] get-secondary-kind)) 1) strategy)
)


(defrule inferred-challenging
        (declare (salience ?*high-priority*))
        (info (feature  game-challenging) (value "yes"))
        
        =>
        (assert (infering (feature challenging) (value T)))
         (slot-insert$ [gsk]  secondary-kind (+ (length$ (send [gsk] get-secondary-kind)) 1) challenging)
)


(defrule inferred-explorative
        (declare (salience ?*high-priority*))
        (info (feature  game-explorative) (value "yes"))
        =>
        (assert (infering (feature explorative) (value T)))
        (slot-insert$ [gsk]  secondary-kind (+ (length$ (send [gsk] get-secondary-kind)) 1) explorative)
)

(defrule inferred-wtdplacement
        (declare (salience ?*high-priority*))
        (info (feature  game-wtdplacement) (value "yes"))
        =>
        (assert (infering (feature wtdplacement) (value T)))
        (slot-insert$ [gsk]  secondary-kind (+ (length$ (send [gsk] get-secondary-kind)) 1) wtdplacement)
)

(defrule inferred-hmovement
        (declare (salience ?*high-priority*))
        (info (feature  game-hmovement) (value "yes"))
        =>
        (assert (infering (feature hmovement) (value T)))
        (slot-insert$ [gsk]  secondary-kind (+ (length$ (send [gsk] get-secondary-kind)) 1) hmovement)
)

(defrule inferred-investigative
        (declare (salience ?*high-priority*))
        (info (feature  game-investigative) (value "yes"))
        =>
        (assert (infering (feature investigative) (value T)))
         (slot-insert$ [gsk]  secondary-kind (+ (length$ (send [gsk] get-secondary-kind)) 1) investigative)
)

(defrule inferred-bidding
        (declare (salience ?*high-priority*))
        (info (feature  game-bidding) (value "yes"))
       
        =>
        (assert (infering (feature bidding) (value T)))
        (slot-insert$ [gsk]  secondary-kind (+ (length$ (send [gsk] get-secondary-kind)) 1) bidding)
)

(defrule inferred-bluff
        (declare (salience ?*high-priority*))
        (info (feature  game-bluff) (value "yes"))
        
        =>
        (assert (infering (feature bluff) (value T)))
        (slot-insert$ [gsk]  secondary-kind (+ (length$ (send [gsk] get-secondary-kind)) 1) bluff)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule inferred-greece
        (declare (salience ?*highest-priority*))
        (info (feature game-greece) (value "yes"))
          =>
        (assert (infering (feature greece) (value T)))
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) greece)

)

(defrule inferred-roman
        (declare (salience ?*highest-priority*))
        (info (feature game-roman) (value "yes"))
        =>
        (assert (infering (feature roman) (value T)))  
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) roman)

)
(defrule  inferred-western
        (declare (salience ?*highest-priority*))
        (info (feature game-western) (value "yes"))
        
         =>
        (assert (infering (feature greece) (value T))) 
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) western)
)
(defrule  inferred-horror
        (declare (salience ?*highest-priority*))
        (info (feature game-horror) (value "yes"))
        
         =>
        (assert (infering (feature horror) (value T)))
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) horror)

)
(defrule  inferred-gothic
        (declare (salience ?*highest-priority*))
        (info (feature game-gothic) (value "yes"))
        
         =>
        (assert (infering (feature gothic) (value T)))
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) gothic)

)

(defrule   inferred-lovecraft
        (declare (salience ?*highest-priority*))
        (info (feature game-lovecraft) (value "yes"))
         =>
        (assert (infering (feature lovecraft) (value T))) 
       (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) lovecraft)
)
(defrule  inferred-war
        (declare (salience ?*highest-priority*))
        (info (feature game-war) (value "yes"))
         =>
        (assert (infering (feature war) (value T)))
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) war)

)
(defrule  inferred-abstract
        (declare (salience ?*highest-priority*))
        (info (feature game-abstract) (value "yes"))
         =>
        (assert (infering (feature abstract) (value T))) 
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) abstract)
)
(defrule  inferred-fantasy
        (declare (salience ?*highest-priority*))
        (info (feature game-fantasy) (value "yes"))
         =>
        (assert (infering (feature fantasy) (value T))) 
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) fantasy)

)
(defrule  inferred-farms
        (declare (salience ?*highest-priority*))
        (info (feature game-farms) (value "yes"))
     
         =>
        (assert (infering (feature farms) (value T))) 
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) famrs)
)

(defrule  inferred-futuristic
        (declare (salience ?*highest-priority*))
        (info (feature game-futuristic) (value "yes"))
         =>
        (assert (infering (feature futuristic) (value T))) 
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) futuristic)
)
(defrule  inferred-merchants
        (declare (salience ?*highest-priority*))
        (info (feature game-merchants) (value "yes"))
         =>
        (assert (infering (feature merchants) (value T)))
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) merchants)

)
(defrule  inferred-indians
        (declare (salience ?*highest-priority*))
        (info (feature game-indians) (value "yes"))
         =>
           (assert (infering (feature indians) (value T))) 
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) indians)

)
(defrule  inferred-fireworks
        (declare (salience ?*highest-priority*))
        (info (feature game-fireworks) (value "yes"))
       
         =>
        (assert (infering (feature fireworks) (value T)))        
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) fireworks)        

)
(defrule  inferred-survival
        (declare (salience ?*highest-priority*))
        (info (feature game-survival) (value "yes"))
         =>
        (assert (infering (feature survival) (value T)))
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) survival)
)
(defrule  inferred-forests
        (declare (salience ?*highest-priority*))
        (info (feature game-forests) (value "yes"))
         =>
        (assert (infering (feature forests) (value T)))
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) forests)

)
(defrule  inferred-industry
        (declare (salience ?*highest-priority*))
        (info (feature game-industry) (value "yes"))
         =>
        (assert (infering (feature industry) (value T)))
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) industry)

)
(defrule  inferred-numbers
        (declare (salience ?*highest-priority*))
        (info (feature game-numbers) (value "yes"))
         =>
        (assert (infering (feature numbers) (value T))) 
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) numbers)

)

(defrule  inferred-castles
        (declare (salience ?*highest-priority*))
        (info (feature game-castles) (value "yes"))
         =>
        (assert (infering (feature castles) (value T)))
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) castles)

)

(defrule  inferred-vampyric
        (declare (salience ?*highest-priority*))
        (info (feature game-vampyric) (value "yes"))
         =>
        (assert (infering (feature vampyric) (value T))) 
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) vampyric)
)

(defrule  inferred-renaissance-court
        (declare (salience ?*highest-priority*))
        (info (feature game-renaissance-court) (value "yes"))
          =>
        (assert (infering (feature renaissance-court) (value T)))  
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) renaissance-court)

)
(defrule  inferred-pirates
        (declare (salience ?*highest-priority*))
        (info (feature game-pirates) (value "yes"))    
          =>
        (assert (infering (feature pirates) (value T)))  
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) pirates)
)

(defrule  inferred-witchcraft
        (declare (salience ?*highest-priority*))
        (info (feature game-witchcraft) (value "yes"))
          =>
        (assert (infering (feature witchcraft) (value T)))  
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) witchcraft)
)


(defrule inferred-oriental
        (declare (salience ?*highest-priority*))
        (info (feature game-oriental) (value "yes"))
        =>
        (assert (infering (feature oriental) (value T)))   
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) oriental)

)


(defrule inferred-glass
        (declare (salience ?*highest-priority*))
        (info (feature game-glass) (value "yes"))
          =>
        (assert (infering (feature glass) (value T))) 
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) glass)

)


(defrule inferred-chemistry
        (declare (salience ?*highest-priority*))
        (info (feature game-chemistry) (value "yes"))
          =>
        (assert (infering (feature chemistry) (value T))) 
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) chemistry)

)

(defrule inferred-lord-of-the-rings
        (declare (salience ?*highest-priority*))
        (info (feature game-lord-of-the-rings) (value "yes"))
          =>
        (assert (infering (feature lord-of-the-rings) (value T)))  
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) lord-of-the-rings)

)


(defrule inferred-tale
        (declare (salience ?*highest-priority*))
        (info (feature game-tale) (value "yes"))
          =>
        (assert (infering (feature tale) (value T)))  
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) tale)

)

(defrule inferred-crime
        (declare (salience ?*highest-priority*))
        (info (feature game-crime) (value "yes"))
          =>
        (assert (infering (feature crime) (value T)))  
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) crime)
)

(defrule inferred-restaurants
        (declare (salience ?*highest-priority*))
        (info (feature game-restaurants) (value "yes"))
          =>
        (assert (infering (feature restaurants) (value T)))  
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) restaurants)

)

(defrule inferred-mafia
        (declare (salience ?*highest-priority*))
        (info (feature game-mafia) (value "yes"))
          =>
        (assert (infering (feature mafia) (value T)))  
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) mafia)

)

(defrule inferred-politics
        (declare (salience ?*highest-priority*))
        (info (feature game-politics) (value "yes"))
        =>
        (assert (infering (feature politics) (value T)))
        (slot-insert$ [gte]  thematic-environment (+ (length$ (send [gte] get-thematic-environment)) 1) politics)
)