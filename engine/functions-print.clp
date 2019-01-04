(deffunction print-question (?question ?number)
        (printout t crlf)
        (if (and (not (eq ?question rejection))  (not (eq ?question want-to-see-hypotetical-final-board-game))  (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then 
                (printout t "  " ?number ". "))
        (switch ?question

        ;;=========== SEZIONE UTENTE ===========;;

                (case like-gothic then
                        (printout t "ti piace il tema gothico? " crlf crlf))
                (default
                        (printout t "CLIPS-Exception!!! - Print Question: " ?question crlf))
        )
)

(deffunction print-answers (?question $?answers)
        (foreach ?answer $?answers
                (switch ?question

                ;;=========== SEZIONE UTENTE ===========;;

                        (case like-gothic then             
                                (if (eq ?answer s)
                                 then (printout t "(s) Si. " crlf) else
                                (if (eq ?answer n)
                                 then (printout t " (n) NO. " crlf) 
                                ))
                        )
                )        
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

(deffunction print-why (?question)
        (if (and (not (eq ?question rejection)) (not (eq ?question want-to-see-hypotetical-final-pc)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then
                (printout t crlf "  Ti faccio questa domanda perche' sto cercando di capire "))
        (switch ?question
                        (case like-gothic  then             
                        (printout t "per capire cosa ti interessa  "))

        (default
                (printout t "CLIPS-Exception!!! - Why Question"))
        )
)        

(deffunction print-help (?question)
        (if (and  (not (eq ?question rejection)) (not (eq ?question want-to-see-hypotetical-final-pc)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then 
                (printout t crlf "  Questa domanda ti sta chiedendo "))
        (switch ?question
                (case like-gothic  then             
                        (printout t "https://it.wikipedia.org/wiki/Romanzo_gotico"))  
                (default
                        (return "")
                )
        )
)                            