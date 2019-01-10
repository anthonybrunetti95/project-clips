;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;             FUNZIONI DI VISUALIZZAZIONE               ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deffunction print-question (?question ?number)
        (printout t crlf)
        (if (and (not (eq ?question rejection))   (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then 
                (printout t "  " ?number ". "))
        (switch ?question

        ;;=========== SEZIONE UTENTE ===========;;

               (case user-age then
                    (printout t "Quanti anni hai? " crlf crlf))
                (case user-gift then
                    (printout t "Il pc che stai per comprare e' un regalo? " crlf crlf))
                (case user-experience then
                    (printout t "Hai esperienza sui giochi  da tavolo ? " crlf crlf))
                (case user-budget then
                    (printout t "Quanto sei disposto a spendere per questo pc? " crlf crlf))
                (case game-players then
                    (printout t "Con quante persone giochi hai intenzione di giocare ? " crlf crlf))
                (case game-family then 
                    (printout t "Con quante persone giochi hai intenzione di giocare? " crlf crlf))
                (case game-filer then 
                    (printout t "Quanto tempo vorresti dedicare a giocarci? " crlf crlf))
                (case game-cardgame then 
                    (printout t "Ti piacciono i giochi con carte ?" crlf crlf))
                (case game-wargame then 
                    (printout t "i piacciono i giochi che simulano la guerra ?" crlf crlf))
                (case game-thematic then 
                    (printout t "Quanto è per te importante l’ambientazione e i dettagli nei giochi ? ?" crlf crlf))
                (case game-comp then 
                    (printout t "Ti piace avere degli avversari da sfidare ? ?" crlf crlf))
                (case game-coop then 
                    (printout t " Nel gioco ti piace  cooperare con gli altri giocatori    ?" crlf crlf))
                (case game-challenging then 
                    (printout t "Ti piace superare delle prove molto articolate e degli ostacoli complessi nel gioco ?   ?" crlf crlf))
                (case game-bidding then 
                    (printout t "Ti piace  la meccanica ad asta?" crlf crlf))
                (case game-Investigative then 
                    (printout t "Ti piace il tema investigativo? " crlf crlf))
                (case game-hold-story then 
                    (printout t "Ti piace il tema relativo all'antichità ? " crlf crlf))
                (case game-western then 
                    (printout t "Sei interessato  al tema Western ? " crlf crlf))
                (case game-horror then 
                    (printout t "Sei interessato al tema Horror  ?" crlf crlf))
                (case game-gothic then 
                    (printout t "Sei interessato  all'ambientazione gotica? " crlf crlf))
                (case game-lovecraft then 
                    (printout t "Cosa ne pensi delle opere di Lovecraft ? " crlf crlf))
                (case game-war then 
                    (printout t "Ti appassiona il tema della guerra ? " crlf crlf))
                (case game-abstract then 
                    (printout t "Ti piacciono le ambientazioni astratte? " crlf crlf))
                (case game-fantasy then 
                    (printout t "Ti piace il fantasy? " crlf crlf))
                (case game-farms then 
                    (printout t "Ti piace la vita di campagna?  " crlf crlf))
                (case game-futuristics then 
                    (printout t "Ti piace l'ambientazione futuristica ? " crlf crlf))
                (case game-merchants then 
                    (printout t "Ti potrebbe piacere un gioco con scambi commerciali ? " crlf crlf))
                (case game-indians then 
                    (printout t "Ti piace sull’ambientazione maya / indiani ?  " crlf crlf))
                (case game-fireworks then 
                    (printout t "TI piacerebbe un gioco a tema fuochi d'artificio ?" crlf crlf))
                (case game-survival then 
                    (printout t "Ti piace il tema della sopravvivenza ? " crlf crlf))
                (case game-industry then 
                    (printout t "Ti piacciono i giochi che hanno  come ambientazione l’industria ? " crlf crlf))
                (case game-numbers then 
                    (printout t "Ti potrebbero interessare i giochi con i numeri ? " crlf crlf))
                (case game-castles
                    (printout t "Sei interessato a ambientazione di castelli? " crlf crlf))
                (case game-vampyric
                    (printout t "Ti piace il tema dei vampiri ? " crlf crlf))
                (case game-renaissance_court
                    (printout t "Ti piace l’ambientazione come corti rinascimentali ? " crlf crlf))
                (case game-pirates
                    (printout t "Ti piace un gioco ad ambientazione  piratesca ? " crlf crlf)
                (case game-witchcraft
                    (printout t "Ti piace il tema sulla magia / stregoneria? " crlf crlf))
                (case game-oriental
                    (printout t "Ti piace la cultura orientale ? " crlf crlf))
                (case game-glass
                    (printout t "Ti piacerebbe avere un gioco con i mosaici ? " crlf crlf))
                   (case game-chemistry
                    (printout t "Ti piace il tema  alchimia / chimica ? " crlf crlf))
                (case game-lord_of_the_rings
                    (printout t "Ti piace il signore degli anelli ? " crlf crlf))
                (case game-(tale)
                    (printout t "Ti piace l’ambientazione fiabesca ? " crlf crlf))
                (case game-crime
                    (printout t "Ti piace l’ambientazione poliziesca ?" crlf crlf))
                (case game-restaurants
                    (printout t "Ti piacciono i giochi che hanno come tema  i ristoranti ?" crlf crlf))
                (case game-mafia
                    (printout t "Ti piacciono i giochi che hanno come tema la mafia ? " crlf crlf))

                (case game-politics
                    (printout t "Ti piacciono i giochi che hanno come tema la politica ? " crlf crlf))

                 (case retraction then           
                        (printout t "  Vuoi rivedere le risposte che hai dato?" crlf crlf))

                (default
                        (printout t "CLIPS-Exception!!! - Print Question: " ?question crlf))
        )
)

(deffunction print-why-help (?answer)
        (if (and (neq ?answer s) (neq ?answer n) (neq ?answer i)) then
                (if (eq ?answer h) then
                        (printout t crlf " (h) Non ho capito la domanda in realta'. " crlf) else
                (if (eq ?answer w)
                        then (printout t " (w) Perche' mi fai questa domanda?" crlf crlf "  ") else
                (printout t "  *CLIPS PROBLEM*" crlf))))
)


(deffunction print-yes-no (?answer)
        (if (eq ?answer s)
                then (printout t " (s) Si. " crlf) else
        (if (eq ?answer n)
                then (printout t " (n) No. " crlf)))
)



(deffunction print-yes-no-indifferent (?answer)
        (if (eq ?answer s)
                then (printout t " (s) Si. " crlf) else
        (if (eq ?answer n)
                then (printout t " (n) No. " crlf) else
        (if (eq ?answer i)
                then (printout t " (i) Indifferente. " crlf))))
)

(deffunction print-probably-yes-no (?answer)
        (if (eq ?answer s)
                then (printout t " (s) Probabilmente si. " crlf) else
        (if (eq ?answer n)
                then (printout t " (n) Non credo. " crlf)))
)


(deffunction print-answers (?question $?answers)
        (foreach ?answer $?answers
                (switch ?question

                ;;=========== SEZIONE UTENTE ===========;;

                        (case user-age then             
                                (if (eq ?answer 1)
                                 then (printout t " (1) Meno di 10 anni. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Tra i 10 e i 20 anni. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Tra i 20 e i 30 anni. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Tra i 30 e i 40 anni. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Tra i 40 e i 50 anni. " crlf) else
                                (if (eq ?answer 6)
                                 then (printout t " (6) Tra i 50 e i 60 anni. " crlf) else
                                (if (eq ?answer 7)
                                 then (printout t " (7) Tra i 60 e i 70 anni. " crlf) else
                                (if (eq ?answer 8)
                                 then (printout t " (8) Piu' di 70 anni. " crlf) else
                                (print-why-help ?answer) )))))))))
                         (case rejection then
                                (if (eq ?answer s)
                                        then (printout t " (s) Si, va bene questa qui. " crlf) else
                                (if (eq ?answer n)
                                        then (printout t " (n) Non va bene, prova a cercarne un'altra. " crlf crlf "  ") else
                                (printout t "  *CLIPS PROBLEM*" crlf) )))
                        (case retraction-number then
                                (printout t))

                        (case retraction then
                                (if (eq ?answer s)
                                 then (printout t " (s) Si, voglio rivederle. " crlf) else
                                (if (eq ?answer n)
                                 then (printout t " (n) No, vanno bene. " crlf crlf "  ") else
                                (printout t "  *CLIPS PROBLEM*" crlf) )))
                                                
                )
        )        
             
)




(deffunction print-why (?question)
        (if (and (not (eq ?question rejection)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then
                (printout t crlf "  Ti faccio questa domanda perche' sto cercando di capire "))
        (switch ?question

            ;;=========== SEZIONE UTENTE ===========;;

                (case user-age then             
                        (printout t "la tua eta', in modo da comprendere meglio le tue esigenze e le successive domande da porti. "))
        (default
                (printout t "CLIPS-Exception!!! - Why Question"))
        )
)        

(deffunction print-help (?question)
        (if (and  (not (eq ?question rejection)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then 
                (printout t crlf "  Questa domanda ti sta chiedendo "))
        (switch ?question
                (case user-age then             
                    (printout t "la fascia d'eta' in cui ti trovi. ")) 

                (default  
                    (printout t "CLIPS-Exception!!! - Help Question")
                 )       
        )
        (printout t crlf crlf "  Inserisci un valore valido tra quelli elencati. " crlf crlf "  ")   
)                            


;;deffunction print-detail-missing 
;;print-hipotetical-board-game



