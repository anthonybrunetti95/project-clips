(deffunction is_member (?list ?feautere )
        (foreach ?value $?list  (if (member$ ?value $?feautere) then (printout t ?value " si " ?feautere crlf crlf)  else (printout t $?value " no " ?feautere crlf crlf) (return false) ))
        (return true)      
)