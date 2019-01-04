;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                  FUNZIONI PER LE DOMANDE              ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deffunction ask-question (?question ?number $?allowed-values)
        (if (and (not (eq ?question rejection)) (not (eq ?question want-to-see-hypotetical-final-board-game)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) )
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
        (if (and  (not (eq ?question rejection)) (not (eq ?question want-to-see-hypotetical-final-board-game)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then
                (assert (asked-question (question ?question) (number ?number) (values $?allowed-values) (answer ?answer))))
        ?answer 
)

(deffunction ask (?question ?number $?allowed-values) 
        (bind ?answer (ask-question ?question ?number $?allowed-values))
        (switch ?question 

        ;;=========== SEZIONE UTENTE ===========;;

                (case like-gothic then             
                        (if (eq ?answer s) 
                         then (assert (info (feature gothic) (value "T") (question like-gothic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info:inserimento-si")) else          
                        (if (eq ?answer n) 
                         then (assert (info (feature gothic) (value "F") (question like-gothic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> "Info:inserimento-no")) ))) )
)


(deffunction ask-boolean (?question ?number)
        (ask ?question ?number s n)

)                