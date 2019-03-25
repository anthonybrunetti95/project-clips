(deffunction is_member (?list ?feautere )
        (foreach ?value $?list  (if (member$ ?value ?feautere) then (printout t ?value "si" ?feautere)  else (printout t $?value "no " ?feautere) (return false) ))
        (return true)      
)