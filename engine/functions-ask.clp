;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                  FUNZIONI PER LE DOMANDE              ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deffunction ask-question (?question ?number $?allowed-values)
        (if (and (not (eq ?question rejection))  (not (eq ?question want-to-see-hypotetical-final-board-game))  (not (eq ?question retraction))   (not (eq ?question retraction-number)) )
         then (printout t crlf "=========================================================="))
        (print-question ?question ?number)
        (if (or  (eq ?question rejection) (eq ?question retraction)   (eq ?question retraction-number) )
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
                    then (assert (info (feature user-age) (value "0<10") (question user-age))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 0<10")) else          
                (if (eq ?answer 2) 
                    then (assert (info (feature user-age) (value "10<20") (question user-age))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 10<20")) else         
                (if (eq ?answer 3) 
                    then (assert (info (feature user-age) (value "20<30") (question user-age))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 20<30")) else         
                (if (eq ?answer 4) 
                    then (assert (info (feature user-age) (value "30<40") (question user-age))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 30<40")) else         
                (if (eq ?answer 5) 
                    then (assert (info (feature user-age) (value "40<50") (question user-age))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 40<50")) else 
                (if (eq ?answer 6) 
                    then (assert (info (feature user-age) (value "50<60") (question user-age))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 50<60")) else 
                (if (eq ?answer 7) 
                    then (assert (info (feature user-age) (value "60<70") (question user-age))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 60<70")) else 
                (if (eq ?answer 8) 
                    then (assert (info (feature user-age) (value "70<") (question user-age))) 
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 70<")) )))))))))
            (case user-gift then
                (if (eq ?answer s) 
                    then (assert (info (feature user-gift) (value "si") (question user-gift))) 
                        (printout t crlf " Bene. " crlf crlf " D'ora in avanti il soggetto delle domande sara' la persona cui hai intenzione di regalare questo pc. " crlf crlf)
                            (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GIFT MODE ON")) else
                (if (eq ?answer n) 
                    then (assert (info (feature user-gift) (value "no") (question user-gift)))
                        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GIFT MODE OFF")) )))
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
                     (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-GAME-TIME <60")) else 
                (if (eq ?answer 2) 
                    then (assert (info (feature game-time) (value ">60") (question game-time))) 
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
                                then    (printout t crlf "Grazie per aver utilizzato il sistema!" crlf crlf) 
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
