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
