;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                  FUNZIONI PER LE DOMANDE              ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deffunction ask-question (?question ?number $?allowed-values)
        (if (and (not (eq ?question rejection))  (not (eq ?question want-to-see-hypotetical-final-board-game))  (not (eq ?question retraction))   (not (eq ?question retraction-number)) )
         then (printout t crlf "=========================================================="))
        (print-question ?question ?number)
        (if (or  (eq ?question rejection) (eq ?question want-to-see-hypotetical-final-board-game) (eq ?question retraction)   (eq ?question retraction-number) )
         then (print-answers ?question $?allowed-values)
         else (print-answers ?question $?allowed-values h w))
        (foreach ?answer $?allowed-values (print-answers ?answer))
        (bind ?answer (read))
        (if (lexemep ?answer)
         then (bind ?answer (lowcase ?answer)))
        (while (not (member$ ?answer $?allowed-values)) do
                (if (eq ?answer h)
                 then (print-help ?question) else 
                (if (eq ?answer w)
                 then (print-why ?question) else
                (printout t crlf "  Inserisci un valore valido tra quelli elencati. " crlf crlf "  ")))
                (bind ?answer (read))
                (if (lexemep ?answer)
                 then (bind ?answer (lowcase ?answer)))
        )
        (if (and  (not (eq ?question rejection))  (not (eq ?question want-to-see-hypotetical-final-board-game)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then
                (assert (asked-question (question ?question) (number ?number) (values $?allowed-values) (answer ?answer))))
        ?answer 
)

(deffunction ask (?question ?number $?allowed-values) 
        (bind ?answer (ask-question ?question ?number $?allowed-values))
        (switch ?question 

       ;;=========== SEZIONE UTENTE ===========;;
            (case user-age then             
                (if (eq ?answer 1) 
                    then (assert (info (feature user-age) (value "6<10") (question user-age)))
                         (assert (user-age (min-age 6) (max-age 10))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 0<10")) else          
                (if (eq ?answer 2) 
                    then (assert (info (feature user-age) (value "10<17") (question user-age)))
                        (assert (user-age (min-age 13) (max-age 18))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 10<20")) else         
                (if (eq ?answer 3) 
                    then (assert (info (feature user-age) (value "18<30") (question user-age)))
                        (assert (user-age (min-age 18) (max-age 30))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 20<30")) else         
                (if (eq ?answer 4) 
                    then (assert (info (feature user-age) (value "30<40") (question user-age)))
                         (assert (user-age (min-age 30) (max-age 40)))   
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 30<40")) else         
                (if (eq ?answer 5) 
                    then (assert (info (feature user-age) (value "40<50") (question user-age))) 
                         (assert (user-age (min-age 40) (max-age 50))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 40<50")) else 
                (if (eq ?answer 6) 
                    then (assert (info (feature user-age) (value "50<60") (question user-age)))
                         (assert (user-age (min-age 50) (max-age 60)))  
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 50<60")) else 
                (if (eq ?answer 7) 
                    then (assert (info (feature user-age) (value "60<70") (question user-age)))
                         (assert (user-age (min-age 50) (max-age 60))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 60<70")) else 
                (if (eq ?answer 8) 
                    then (assert (info (feature user-age) (value "70<") (question user-age))) 
                        (assert (user-age (min-age 70) (max-age 99)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 70<")) )))))))))

              (case group-age then             
                (if (eq ?answer 1) 
                    then (assert (info (feature group-age) (value "10") (question group-age))) 
                         (assert (user-age (min-age 6) (max-age 10))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GROUP-AGE 10")) else          
                (if (eq ?answer 2)
                    then (assert (info (feature group-age) (value "20") (question group-age)))
                      (assert (user-age (min-age 13) (max-age 20)))  
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GROUP-AGE 20")) else         
                (if (eq ?answer 3) 
                    then (assert (info (feature group-age) (value "30") (question group-age)))
                        (assert (user-age (min-age 20) (max-age 30)))  
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GROUP-AGE 30")) else         
                (if (eq ?answer 4) 
                    then (assert (info (feature group-age) (value "40") (question user-age))) 
                         (assert (user-age (min-age 30) (max-age 40))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GROUP-AGE 40")) else         
                (if (eq ?answer 5) 
                    then (assert (info (feature group-age) (value "50") (question group-age))) 
                        (assert (user-age (min-age 40) (max-age 50))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GROUP-AGE 50")) else 
                (if (eq ?answer 6) 
                    then (assert (info (feature group-age) (value "60") (question group-age))) 
                        (assert (user-age (min-age 50) (max-age 60))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GROUP-AGE 60")) else 
                (if (eq ?answer 7) 
                    then (assert (info (feature group-age) (value "70") (question group-age)))
                        (assert (user-age (min-age 60) (max-age 70)))  
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GROUP-AGE 70")) else 
                (if (eq ?answer 8) 
                    then (assert (info (feature group-age) (value "70<") (question group-age)))
                        (assert (user-age (min-age 70) (max-age 99)))  
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GROUP-AGE 80<")) )))))))))

            (case user-experience then 
                (if (eq ?answer 1)
                    then (assert (info (feature user-experience) (value "zero") (question user-experience)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-EXPERIENCE ZERO")) else
                (if (eq ?answer 2)
                    then (assert (info (feature user-experience) (value "litle") (question user-experience)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-EXPERIENCE LITLE")) else
                (if (eq ?answer 3)
                    then (assert (info (feature user-experience) (value "normal") (question user-experience)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-EXPERIENCE NORMAL")) else
                (if (eq ?answer 4)
                    then (assert (info (feature user-experience) (value "high") (question user-experience)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-EXPERIENCE HIGH")) )))))                

            (case group-experience then 
                (if (eq ?answer 1)
                    then (assert (info (feature group-experience) (value "zero") (question group-experience)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GROUP-EXPERIENCE ZERO")) else
                (if (eq ?answer 2)
                    then (assert (info (feature group-experience) (value "litle") (question group-experience)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GROUP-EXPERIENCE LITLE")) else
                (if (eq ?answer 3)
                    then (assert (info (feature group-experience) (value "normal") (question group-experience)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GROUP-EXPERIENCE NORMAL")) else
                (if (eq ?answer 4)
                    then (assert (info (feature group-experience) (value "high") (question group-experience)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GROUP-EXPERIENCE HIGH")) )))))                

               
            (case user-budget then
                (if (eq ?answer 1) 
                    then (assert (info (feature user-budget) (value "<18") (question user-budget))) 
                        (assert (user-budget (min-budget 5) (max-budget 18)))
                    (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-BUDGET <18")) else       
                (if (eq ?answer 2) 
                    then (assert (info (feature user-budget) (value "19<33") (question user-budget))) 
                              (assert (user-budget (min-budget 19) (max-budget 33)))
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-BUDGET 19<33")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature user-budget) (value "34<44") (question user-budget))) 
                              (assert (user-budget (min-budget 34) (max-budget 44)))
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-BUDGET 34<44")) else    
                        (if (eq ?answer 4) 
                         then (assert (info (feature user-budget) (value "45<65") (question user-budget))) 
                              (assert (user-budget (min-budget 45) (max-budget 65)))
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-BUDGET 45<65")) else   
                        (if (eq ?answer 5) 
                         then (assert (info (feature user-budget) (value "66<110") (question user-budget))) 
                              (assert (user-budget (min-budget 66) (max-budget 110)))
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-BUDGET 66<110")) else  
                        (if (eq ?answer 6) 
                         then (assert (info (feature user-budget) (value "110<") (question user-budget))) 
                              (assert (user-budget (min-budget 110) (max-budget 1000)))
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-BUDGET 110<")) )))))))


            (case game-players then
                (if (eq ?answer 1) 
                    then (assert (info (feature game-players) (value "1") (question game-players))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-GAME-PLAYERS ONE")) else 
                (if (eq ?answer 2) 
                    then (assert (info (feature game-players) (value "2") (question game-players))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-GAME-PLAYERS TWO")) else 
                (if (eq ?answer 3) 
                    then (assert (info (feature game-players) (value "3") (question game-players))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-GAME-PLAYERS THREE")) else 
                (if (eq ?answer 4) 
                    then (assert (info (feature game-players) (value "4") (question game-players))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-GAME-PLAYERS FOUR")) else 
                (if (eq ?answer 5) 
                    then (assert (info (feature game-players) (value "5") (question game-players))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-GAME-PLAYERS FIVE")) else 
                                     
                (if (eq ?answer 6) 
                    then (assert (info (feature game-players) (value "6") (question game-players))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-GAME-PLAYERS SIX")) else 
                 
                (if (eq ?answer 7) 
                    then (assert (info (feature game-players) (value "6+") (question game-players))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-GAME-PLAYERS SIX +"))))))))))


            (case game-time then
                 (if (eq ?answer 1) 
                    then (assert (info (feature game-time) (value "<60") (question game-time)))
                    (assert (game-time  (time 60))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-GAME-TIME <60")) else 
                (if (eq ?answer 2) 
                    then (assert (info (feature game-time) (value ">60") (question game-time))) 
                    (assert (game-time  (time 61))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-GAME-TIME >60")))))

            (case game-family then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-family) (value "yes") (question game-family))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-FAMILY YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-family) (value "no") (question game-family)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-FAMILY NO")))))
            
            (case game-cardgame then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-cardgame) (value "yes") (question game-cardgame))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-CARDGAME YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-cardgame) (value "no") (question game-cardgame)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-CARDGAME NO")))))

            (case game-wargame  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-wargame) (value "yes") (question game-wargame))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-WARGAME YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-wargame) (value "no") (question game-wargame)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-WARGAME NO")))))
            
            (case game-coop  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-coop) (value "yes") (question game-coop))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-COOPERATIVE YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-coop) (value "no") (question game-coop)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-COOPERATIVE NO")))))
                                 

            (case game-comp  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-comp) (value "yes") (question game-comp))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-COMPETITIVE YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-comp) (value "no") (question game-comp)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-COMPETITIVE NO")))))

            (case game-thematic  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-thematic) (value "yes") (question game-wargame)))
                          (assert (result-secondary-kind (label p1) (thematic T)))  
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-THEMATIC YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-thematic) (value "no") (question game-wargame)))
                            (assert (result-secondary-kind (label p1) (thematic F)))  
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-THEMATIC NO")))))

             (case game-strategy  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-strategy) (value "yes") (question game-strategy)))
                         (assert (result-secondary-kind (label p1) (strategy T))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-STRATEGY YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-strategy) (value "no") (question game-strategy)))
                          (assert (result-secondary-kind (label p1) (strategy F)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-STRATEGY NO")))))

            (case game-challenging  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-challenging) (value "yes") (question game-challenging)))
                        (assert (result-secondary-kind (label p1) ( challenging T))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-CHALENGING YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-challenging) (value "no") (question game-challenging)))
                         (assert (result-secondary-kind (label p1) (challenging F)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-CHALENGING NO")))))

            (case game-explorative  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-explorative) (value "yes") (question game-explorative)))
                         (assert (result-secondary-kind (label p1) (explorative T))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-EXPLORATIVE YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-explorative) (value "no") (question game-explorative)))
                          (assert (result-secondary-kind (label p1) (explorative F)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-EXPLORATIVE NO")))))

            (case game-wtdplacement  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-wtdplacement) (value "yes") (question game-wtdplacement)))
                          (assert (result-secondary-kind (label p1) (wtdplacement T))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-WTDPLACEMENT YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-wtdplacement) (value "no") (question game-wtdplacement)))
                          (assert (result-secondary-kind (label p1) (wtdplacement F))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-WTDPLACEMENT NO")))))

            (case game-hmovement  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-hmovement) (value "yes") (question game-hmovement))) 
                          (assert (result-secondary-kind (label p1) ( hmovement T))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-HMOVEMENT YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-hmovement) (value "no") (question game-hmovement)))
                          (assert (result-secondary-kind (label p1) ( hmovement F))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-HMOVEMENT NO")))))


            (case game-investigative  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-investigative) (value "yes") (question game-investigative))) 
                          (modify (result-secondary-kind (label p1) ( investigative T))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-INVESTIGATIVE YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-investigative) (value "no") (question game-investigative)))
                          (assert (result-secondary-kind (label p1) ( investigative F))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-INVESTIGATIVE NO")))))

            (case game-bidding  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-bidding) (value "yes") (question game-bidding)))
                          (assert (result-secondary-kind (label p1) ( bidding T))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-BIDDING YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-bidding) (value "no") (question game-bidding)))
                          (assert (result-secondary-kind (label p1) ( bidding F))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-BIDDING NO")))))

            (case game-bluff then
                  (if (eq ?answer s)
                    then (assert (info (feature game-bluff) (value "yes") (question game-bluff)))
                          (assert (result-secondary-kind (label p1) ( bluff T))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-BLUFF YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-bluff) (value "no") (question game-bluff)))
                        (assert (result-secondary-kind (label p1) ( bluff F))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-BLUFF NO"))

                    )))

            (case game-greece  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-greece) (value "yes") (question game-greece))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-GREECE YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-greece) (value "no") (question game-greece)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-GREECE NO")))))
            (case game-roman  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-roman) (value "yes") (question game-roman))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-ROMAN YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-roman) (value "no") (question game-roman)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-ROMAN NO")))))

            (case game-western  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-western) (value "yes") (question game-western))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-WESTERN YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-western) (value "no") (question game-western)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-WESTERN NO")))))

            (case game-horror  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-horror) (value "yes") (question game-horror))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-HORROR YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-horror) (value "no") (question game-HORROR)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-WESTERN NO")))))

            (case game-gothic  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-gothic) (value "yes") (question game-gothic))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-GOTHIC YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-gothic) (value "no") (question game-gothic)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-GOTHIC NO")))))

            (case game-lovecraft  then 
                  (if (eq ?answer s) 
                    then (assert (info (feature game-lovecraft) (value "yes") (question game-lovecraft))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-LOVECRAFT YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-lovecraft) (value "no") (question game-lovecraft)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-LOVECRAFT NO")))))

            (case game-war  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-war) (value "yes") (question game-war))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-WAR YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-war) (value "no") (question game-war)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-WAR NO")))))

            (case game-abstract  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-abstract) (value "yes") (question game-abstract))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-ABSTRACT YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-abstract) (value "no") (question game-abstract)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-ABSTRACT NO")))))

            (case game-fantasy  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-fantasy) (value "yes") (question game-fantasy))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-FANTASY YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-fantasy) (value "no") (question game-fantasy)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-FANTASY NO")))))

            (case game-farms  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-farms) (value "yes") (question game-farms))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-FARM YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-farms) (value "no") (question game-farms)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-FARM NO")))))

            (case game-futuristics  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-futuristics) (value "yes") (question game-futuristics))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-FUTURISTICS YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-futuristics) (value "no") (question game-futuristics)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-FUTURISTICS NO")))))

            (case game-merchants  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-merchants) (value "yes") (question game-merchants))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-MERCHANTS YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-merchants) (value "no") (question game-merchants)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-MERCHANTS NO")))))

            (case game-indians  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-indians) (value "yes") (question game-indians))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-INDIANS YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-indians) (value "no") (question game-indians)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-INDIANS NO")))))

            (case game-fireworks  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-fireworks) (value "yes") (question game-fireworks))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-FIREWORKS YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-fireworks) (value "no") (question game-fireworks)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-FIREWORKS NO")))))

            (case game-survival  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-survival) (value "yes") (question game-survival))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-SURVIVAL YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-survival) (value "no") (question game-survival)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-SURVIVAL NO")))))

              (case game-forests  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-forests) (value "yes") (question game-forests))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-FORESTS YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-forests) (value "no") (question game-forests)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-FORESTS NO")))))

            (case game-industry  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-industry) (value "yes") (question game-industry))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-INDUSTRY YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-industry) (value "no") (question game-industry)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-INDUSTRY NO")))))

            (case game-numbers  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-numbers) (value "yes") (question game-numbers))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME- YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-numbers) (value "no") (question game-numbers)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME- NO")))))

            (case game-castles  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-castles) (value "yes") (question game-castles))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-CASTLESS YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-castles) (value "no") (question game-castles)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-CASTLESS NO")))))

            (case game-vampyric  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-vampyric) (value "yes") (question game-vampyric))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-VAMPYRIC YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-vampyric) (value "no") (question game-vampyric)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-VAMPYRIC NO")))))

            (case game-renaissance-court  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-renaissance-court) (value "yes") (question game-renaissance-court))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-RENAISSANCE-COURT YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-renaissance-court) (value "no") (question game-renaissance-court)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-RENAISSANCE-COURT NO")))))

            (case game-pirates  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-pirates) (value "yes") (question game-pirates))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-PIRATES YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-pirates) (value "no") (question game-pirates)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-PIRATES NO")))))

            (case game-witchcraft  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-witchcraft) (value "yes") (question game-witchcraft))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-WITCHCRAFT YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-witchcraft) (value "no") (question game-witchcraft)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-WITCHCRAFT NO")))))
            (case game-oriental  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-oriental) (value "yes") (question game-oriental))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME- YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-oriental) (value "no") (question game-oriental)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME- NO")))))

            (case game-glass  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-glass) (value "yes") (question game-glass))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-GLASS YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-glass) (value "no") (question game-glass)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-GLASS NO")))))


            (case game-chemistry  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-chemistry) (value "yes") (question game-chemistry))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-CHEMISTRY YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-chemistry) (value "no") (question game-chemistry)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-CHEMISTRY NO")))))

            (case game-lord-of-the-rings   then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-lord-of-the-rings ) (value "yes") (question game-lord-of-the-rings ))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-LORD-OF-THE-RINGS YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-lord-of-the-rings ) (value "no") (question game-lord-of-the-rings )))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-LORD-OF-THE-RINGS NO")))))

            (case game-tale  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-tale) (value "yes") (question game-tale))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-TALE YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-tale) (value "no") (question game-tale)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-TALE NO")))))


            (case game-crime  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-crime) (value "yes") (question game-crime))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-CRIME YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-crime) (value "no") (question game-crime)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-CRIME NO")))))

            (case game-restaurants  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-restaurants) (value "yes") (question game-restaurants))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-RESTAURANTS YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-restaurants) (value "no") (question game-restaurants)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-RESTAURANTS NO")))))

            (case game-mafia  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-mafia) (value "yes") (question game-mafia))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-MAFIA YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-mafia) (value "no") (question game-mafia)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-MAFIA NO")))))

            (case game-politics  then
                  (if (eq ?answer s) 
                    then (assert (info (feature game-politics) (value "yes") (question game-politics))) 
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-POLITICS YES")) else
                (if (eq ?answer n) 
                    then (assert (info (feature game-politics) (value "no") (question game-politics)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAME-POLITICS NO")))))

                (case rejection then
                        (if (eq ?answer s)
                                then    (printout t crlf "Grazie per aver utilizzato il sistema!" crlf crlf)
                                        (halt) else
                        (if (eq ?answer n)
                                then (assert (rejection)))))

                (case want-to-see-hypotetical-final-board-game then
                        (if (eq ?answer s)
                                then (assert (want-to-see yes)) else
                        (if (eq ?answer n)
                                then (assert (want-to-see no)))))
            
                (case retraction then 
                        (if (eq ?answer s) 
                                then (assert (print-qna 1)) else
                        (if (eq ?answer n) 
                                then  (printout t crlf "Grazie per aver utilizzato il sistema!" crlf crlf) 
                                        (halt) )))
                (case retraction-number then 
                        (assert (reasked-question (question ?answer)))
                        (assert (pull-question ?answer)))

                (default
                        (if (eq ?*debug-mode* TRUE) then (printout t "CLIPS-Exception!!! - Ask")))


        )        

)


(deffunction ask-boolean (?question ?number)
        (ask ?question ?number s n)

)                
