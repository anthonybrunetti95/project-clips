;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                  FUNZIONI PER LE DOMANDE              ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deffunction ask-question (?question ?number $?allowed-values)
        (if (and (not (eq ?question rejection)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) )
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
        (if (and  (not (eq ?question rejection)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then
                (assert (asked-question (question ?question) (number ?number) (values $?allowed-values) (answer ?answer))))
        ?answer 
)

(deffunction ask (?question ?number $?allowed-values) 
        (bind ?answer (ask-question ?question ?number $?allowed-values))
        (switch ?question 

       

                (case like-gothic then             
                        (if (eq ?answer s) 
                         then (assert (info (feature gothic) (value "T") (question like-gothic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info:inserimento-si")) else          
                        (if (eq ?answer n) 
                         then (assert (info (feature gothic) (value "F") (question like-gothic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info:inserimento-no")) ))) 
                (case like-lovecraft then             
                        (if (eq ?answer s) 
                         then (assert (info (feature lovecraft) (value "T") (question like-lovecraft))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info:inserimento-si")) else          
                        (if (eq ?answer n) 
                         then (assert (info (feature lovecraft) (value "F") (question like-lovecraft))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info:inserimento-no")) )))
                (case rejection then
                        (if (eq ?answer s)
                                then    (printout t crlf "Grazie per aver utilizzato il sistema!" crlf crlf)
                                        (halt) else
                        (if (eq ?answer n)
                                then (assert (rejection)))))
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
