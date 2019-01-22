;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;             FUNZIONI DI VISUALIZZAZIONE               ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deffunction print-question (?question ?number)
        (printout t crlf)
        (if (and (not (eq ?question rejection)) (not (eq ?question want-to-see-hypotetical-final-board-game))  (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then 
                (printout t "  " ?number ". "))
        (switch ?question

        ;;=========== SEZIONE UTENTE ===========;;

               (case user-age then
                    (printout t "Quanti anni hai? " crlf crlf))
                (case user-gift then
                    (printout t "Il gico  che stai per comprare e' un regalo? " crlf crlf))
                (case user-experience then
                    (printout t "A quanti giochi da tavolo hai giocato?  " crlf crlf))
                (case group-age then 
                    (printout t "Qual è l'età media del tuo gruppo di gioco? " crlf crlf))
                (case group-experience then 
                    (printout t "A quanti giochi da tavolo tu e il gruppo di gioco avette giocatto? " crlf crlf))      
                (case user-budget then
                    (printout t "Quanto sei disposto a spendere per questo gioco? " crlf crlf))
                (case game-players then
                    (printout t "Con quante persone giochi hai intenzione di giocare ? " crlf crlf))
                (case game-family then 
                    (printout t "Giocherai con la tua famiglia? " crlf crlf))
                (case game-time then 
                    (printout t "Quanto tempo vorresti dedicare a giocarci? " crlf crlf))
                (case game-cardgame then 
                    (printout t "Ti piacciono i giochi con carte ?" crlf crlf))
                (case game-wargame then 
                    (printout t "Ti piacciono i giochi che simulano la guerra ?" crlf crlf))
                (case game-thematic then 
                    (printout t "Quanto è per te importante l’ambientazione e i dettagli nei giochi ?" crlf crlf))
                (case game-comp then 
                    (printout t "Ti piace avere degli avversari da sfidare ?" crlf crlf))
                (case game-coop then 
                    (printout t " Nel gioco ti piace  cooperare con gli altri giocatori    ?" crlf crlf))
                (case game-challenging then 
                    (printout t "Ti piace superare delle prove molto articolate e degli ostacoli complessi nel gioco ?" crlf crlf))
                (case game-bidding then 
                    (printout t "Ti piace  la meccanica ad asta ?" crlf crlf))
                (case game-investigative then 
                    (printout t "Ti piace il tema investigativo ?" crlf crlf))
                (case game-hold-story then 
                    (printout t "Ti piace il tema relativo all'antichità ?" crlf crlf))
                (case game-western then 
                    (printout t "Sei interessato  al tema Western ?" crlf crlf))
                (case game-horror then 
                    (printout t "Sei interessato al tema Horror  ?" crlf crlf))
                (case game-gothic then 
                    (printout t "Sei interessato  all'ambientazione gotica?" crlf crlf))
                (case game-lovecraft then 
                    (printout t "Cosa ne pensi delle opere di Lovecraft ?" crlf crlf))
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
                (case game-forests then 
                    (printout t "Ti paicerebbe un gico a tema ambiente e natura ? " crlf crlf))
                (case game-industry then 
                    (printout t "Ti piacciono i giochi che hanno  come ambientazione l’industria ? " crlf crlf))
                (case game-numbers then 
                    (printout t "Ti potrebbero interessare i giochi con i numeri ? " crlf crlf))
                (case game-castles then
                    (printout t "Sei interessato a ambientazione di castelli? " crlf crlf))
                (case game-vampyric then
                    (printout t "Ti piace il tema dei vampiri ? " crlf crlf))
                (case game-renaissance-court then
                    (printout t "Ti piace l’ambientazione come corti rinascimentali ? " crlf crlf))
                (case game-pirates then
                    (printout t "Ti piace un gioco ad ambientazione  piratesca ? " crlf crlf))
                (case game-witchcraft then
                    (printout t "Ti piace il tema sulla magia / stregoneria? " crlf crlf))
                (case game-oriental then
                    (printout t "Ti piace la cultura orientale ? " crlf crlf))
                (case game-glass then
                    (printout t "Ti piacerebbe avere un gioco con i mosaici ? " crlf crlf))
                   (case game-chemistry then
                    (printout t "Ti piace il tema  alchimia / chimica ? " crlf crlf))
                (case game-lord-of-the-rings then
                    (printout t "Ti piace il signore degli anelli ? " crlf crlf))
                (case game-tale then
                    (printout t "Ti piace l’ambientazione fiabesca ? " crlf crlf))
                (case game-crime then
                    (printout t "Ti piace l’ambientazione poliziesca ?" crlf crlf))
                (case game-restaurants then
                    (printout t "Ti piacciono i giochi che hanno come tema  i ristoranti ?" crlf crlf))
                (case game-mafia then
                    (printout t "Ti piacciono i giochi che hanno come tema la mafia ? " crlf crlf))

                (case game-politics then
                    (printout t "Ti piacciono i giochi che hanno come tema la politica ? " crlf crlf))

                (case rejection then
                        (printout t "  Sei soddisfatto di questo gioco o vuoi che provi a cercarne un'altro?" crlf crlf))
                (case want-to-see-hypotetical-final-board-game then
                        (printout t "  Vorresti vedere i dettagli di questo gioco o vuoi che provi a cercarne un'altro?" crlf crlf))

                (case retraction then           
                        (printout t "  Vuoi rivedere le risposte che hai dato?" crlf crlf))
                 (case retraction-number then
                        (printout t "  Inserisci il numero della domanda relativa alla risposta che vuoi cambiare: "))

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
                                 then (printout t " (1) Meno di 13 anni. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Tra i 13 e i 18 anni. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Tra i 18 e i 30 anni. " crlf) else
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
                    
                        (case group-age then             
                                (if (eq ?answer 1)
                                 then (printout t " (1) Meno di 10 anni. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Tra i 20 anni. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Tra i 30 anni. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Tra i 40 anni. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Tra i 50 anni. " crlf) else
                                (if (eq ?answer 6)
                                 then (printout t " (6) Tra i 60 anni. " crlf) else
                                (if (eq ?answer 7)
                                 then (printout t " (7) Tra i 70 anni. " crlf) else
                                (if (eq ?answer 8)
                                 then (printout t " (8) Piu' di 80 anni. " crlf) else
                                (print-why-help ?answer) )))))))))

                        (case user-gift then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                       
                        (case user-experience then
                                (if (eq ?answer 1)
                                    then (printout t " (1) Non ho mai giocato" crlf) else
                                (if (eq ?answer 2)
                                    then (printout t " (2) Tra 1 a 15 giochi" crlf) else
                                (if (eq ?answer 3)
                                    then (printout t " (3) Da 16 a 80 giochi" crlf) else
                                (if (eq ?answer 4)
                                    then (printout t " (4) Da 81 giochi in sù " crlf) else
                                (print-why-help ?answer))))))

                        (case group-experience then
                                (if (eq ?answer 1)
                                    then (printout t " (1) Non ho mai giocato" crlf) else
                                (if (eq ?answer 2)
                                    then (printout t " (2) Tra 1 a 15 giochi" crlf) else
                                (if (eq ?answer 3)
                                    then (printout t " (3) Da 16 a 80 giochi" crlf) else
                                (if (eq ?answer 4)
                                    then (printout t " (4) Da 81 giochi in sù " crlf) else
                                (print-why-help ?answer))))))
                      
                        (case user-budget then          
                                (if (eq ?answer 1)
                                 then (printout t " (1) fino 18 euro" crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Tra i 19 e i 33 euro. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Tra i 34 e i 44 euro. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Tra i 45 e i 65 euro. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Tra i 66 e i 110 euro. " crlf) else
                                (if (eq ?answer 6)
                                 then (printout t " (6) Piu' di 110 euro. " crlf) else
                                (print-why-help ?answer) )))))))

                        (case game-players then
                            (if(eq ?answer 1)
                                then (printout t " (1) Solo io" crlf)  else
                            (if(eq ?answer 2)
                                then (printout t " (2) In due persone " crlf) else
                            (if(eq ?answer 3)
                                then (printout t " (3) In tre persone " crlf) else
                            (if(eq ?answer 4)
                                then (printout t " (4) In quatro persone " crlf) else
                            (if(eq ?answer 5)
                                then (printout t " (5) In cinque persone " crlf) else
                            (if(eq ?answer 6)
                                then (printout t " (6) In sei persone " crlf) else
                            (if(eq ?answer 7)
                                then (printout t " (7) Più di 6 persone " crlf) else
                                  (print-why-help ?answer))))))))) 

                        (case game-time then
                            (if (eq ?answer 1)
                                then (printout t " (1) Meno di un ora." crlf) else
                            (if (eq ?answer 2)
                                then (printout t " (2) Più di un ora. "crlf ) else
                                (print-why-help ?answer))))

                        (case game-family then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-cardgame then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-wargame then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))
                       
                        (case game-thematic then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-comp then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))
                        
                         (case game-coop then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-challenging then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-bidding then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-investigative then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-hold-story  then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-western then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-horror then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-gothic then  ;;QUIc          
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-lovecraft then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-war then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-abstract then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-fantasy then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-farms then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-futuristics then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-merchants then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-indians then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))


                        (case game-fireworks then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-survival then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-forests then 
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-industry then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-numbers then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-castles then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-vampyric then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-renaissance-court then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-pirates then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-witchcraft then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-oriental then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-glass then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))


                        (case game-chemistry then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))


                        (case game-lord-of-the-rings then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))


                        (case game-tale then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))


                        (case game-crime then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))


                        (case game-restaurants then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-mafia then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))

                        (case game-politics then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer))


                        (case rejection then
                                (if (eq ?answer s)
                                        then (printout t " (s) Si, va bene questa qui. " crlf) else
                                (if (eq ?answer n)
                                        then (printout t " (n) Non va bene, prova a cercarne un'altra. " crlf crlf "  ") else
                                (printout t "  *CLIPS PROBLEM*" crlf) )))


                        (case want-to-see-hypotetical-final-board-game then
                            (if (eq ?answer s)
                                    then (printout t " (s) Si, vediamo! " crlf) else
                            (if (eq ?answer n)
                                    then (printout t " (n) No, grazie, prova a cercarne un'altra. " crlf crlf "  ") 
                                    else
                              (printout t "  *  CLIPS PROBLEM* "   ?answer crlf) 
                            )))

                        (case retraction then
                                (if (eq ?answer s)
                                 then (printout t " (s) Si, voglio rivederle. " crlf) else
                                (if (eq ?answer n)
                                 then (printout t " (n) No, vanno bene. " crlf crlf "  ") else
                                (printout t "  *CLIPS PROBLEM*" crlf) )))
                        (case retraction-number then
                                (printout t))

                        (default
                                (printout t "CLIPS-Exception!!! - Print Answers: " ?question crlf))
                                                
                )
        )        
             
)




(deffunction print-why (?question)
        (if (and (not (eq ?question rejection)) (not (eq ?question want-to-see-hypotetical-final-board-game)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then
                (printout t crlf "  Ti faccio questa domanda perche' sto cercando di capire "))
        (switch ?question

            ;;=========== SEZIONE UTENTE ===========;;

                (case user-age then             
                        (printout t "la tua eta', in modo da comprendere meglio le tue esigenze e le successive domande da porti. " crlf))

                (case group-age then             
                        (printout t "l'eta' media del tuo gruppo con cui giochi, in modo da comprendere meglio l'esigenze del gruppo e le successive domande da porti. " crlf))
                (case user-gift then    
                    (printout t "se comprerai il gioco per qualcun'altro e di conseguenza capire i gusti di chi avra il gioco. " crlf)) 

                (case user-experience then
                    (printout t "per capire il tuo livello di esperienza sui giochi da tavolo. " crlf))
                
                (case group-experience then
                    (printout t "per capire il livello di esperienza tuo e del tuo gruppo sui giochi da tavolo. " crlf))
                
                (case user-budget then          
                    (printout t "il tuo budget a disposizione per questo acquisto. " crlf)) 
                
                (case game-players then
                    (printout t "il gioco adatto al numero di giocatori.  "crlf))

                (case game-time then
                    (printout t "il tempo che voresti dedicare per giocare. " crlf)) 

                (case game-family then
                     (printout t "se devi giocare con la tua famiglia. " crlf))
                
                (case game-cardgame then
                     (printout t "se vuoi un gioco con le carte " crlf))

                (case game-wargame then
                     (printout t "se vuoi un gico che simula la guerra " crlf))                              
        (default
                (printout t "CLIPS-Exception!!! - Why Question"))
        )
)        

(deffunction print-help (?question)
        (if (and  (not (eq ?question rejection)) (not (eq ?question want-to-see-hypotetical-final-board-game)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then 
                (printout t crlf "  Questa domanda ti sta chiedendo "))
        (switch ?question
                (case user-age then             
                    (printout t "la fascia d'eta' in cui ti trovi. " crlf)) 
                (case group-age then 
                    (printout t "la fascia d'età media in cui si trova il tuo gruppo " crlf))
                (case user-gift then
                    (printout t  "se stai comprando un gico che regalerai ad un'altra persona." crlf))
                (case user-experience then
                    (printout t "il numero di giochi che hai giocato "))
                (case gruop-experience then
                    (printout t "il numero di giochi che hai giocato tu e il gruppo "))
                (case user-budget then          
                        (printout t "la quantita' di denaro che hai a disposizione per questo acquisto. " crlf))
                (case game-players then
                        (printout t "il numero di giocatori "crlf))
                (case game-time then
                        (printout t "il tempo a disposizione per giocare." crlf))             
                (case game-family then
                        (printout t "gioco da tavolo per famiglia " crlf))
                (case game-cardgame then
                     (printout t "gioco con le carte" crlf))
                (case game-wargame then
                     (printout t "giochi simulativi di guerra" crlf))
                (default  
                    (printout t "CLIPS-Exception!!! - Help Question"))       
        )
        (printout t crlf crlf "  Inserisci un valore valido tra quelli elencati. " crlf crlf "  ")   
)                            






(deffunction print-hypotetical-final-board-game (?game-board-name ?price ?min-budget ?max-budget $?what)
    (printout t crlf crlf "  ")
    (printout t "Non ho trovato nessun gico che sia perfetto per te, ma ho trovato un altro gico: " ?game-board-name crlf "  ")
    (printout t "che soddisfa le tue richieste ")

    (bind ?out-of-budget false)

    (if (< ?price ?min-budget) then
        (bind ?euro (- ?min-budget ?price))
        (bind ?out-of-budget true)
        (printout t "e che costa " (format nil "%5.2f" ?euro) " euro in meno rispetto al budget minimo")
    else (if (> ?price ?max-budget) then
        (bind ?euro (- ?price ?max-budget))
        (bind ?out-of-budget true)
        (printout t "e che costa " (format nil "%5.2f" ?euro) " euro in piu' rispetto al budget massimo")))

    (if (> (length$ ?what) 1) then
        (if (eq ?out-of-budget true) then
            (printout t ", ma ")
        else
            (printout t "ma "))
    )

    (printout t "." crlf)
)