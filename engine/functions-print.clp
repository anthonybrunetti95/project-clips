(deffunction print-question (?question ?number)
        (printout t crlf)
        (if (and (not (eq ?question rejection))   (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then 
                (printout t "  " ?number ". "))
        (switch ?question

        ;;=========== SEZIONE UTENTE ===========;;

                (case like-gothic then
                        (printout t "ti piace il tema gothico? " crlf crlf))
                (case like-lovecraft then
                        (printout t "ti piacie lambientazione dei libri di lovecrat?" crlf crlf) )
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

                        (case like-gothic then             
                                (if (eq ?answer s)
                                 then (print-yes-no ?answer) else
                                (if (eq ?answer n)
                                 then (print-yes-no ?answer) else
                                  (print-why-help ?answer)))
                        )
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
                        (case like-gothic  then             
                        (printout t "per capire cosa ti interessa  "))
        (default
                (printout t "CLIPS-Exception!!! - Why Question"))
        )
)        

(deffunction print-help (?question)
        (if (and  (not (eq ?question rejection)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then 
                (printout t crlf "  Questa domanda ti sta chiedendo "))
        (switch ?question
                (case like-gothic  then             
                        (printout t "https://it.wikipedia.org/wiki/Romanzo_gotico"))

                  (default  
                        (printout t "CLIPS-Exception!!! - Help Question")
                 )       
        )
        (printout t crlf crlf "  Inserisci un valore valido tra quelli elencati. " crlf crlf "  ")   
)                            







