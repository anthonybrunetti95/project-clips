(deffunction is_member (?feautere-user ?feautere-game )
        (printout t "ok" crlf crlf)
                (if(eq (length$ ?feautere-user) (length$ ?feautere-game))
                        then
                                (printout t "true" crlf crlf)
                                (return (subsetp ?feautere-user ?feautere-game))
                )
        (return false)
)

