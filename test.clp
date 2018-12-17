;;bind
(bind ?x 5)
( bind ? x (** 2 5)
( printout t ?x crlf)

;; function
( deffunction nth−pow−of−two ( ? n) ( bind ? x (** 2 ?n ) ) ? x )
(printout t (nth−pow−of−two 5) crlf)

;; multi field function 
(create$ giallo verde blu rosso)
(create$ (+ 3 4) (* 2 3) (/ 6 2))

;;member$
(member$ blu (create$  blu giallo verde  rosso))


;;multified functions II

(deffunction colore
	(?colore)
	(nth (create$  blu giallo verde  rosso) ?colore)))

;:first$
(first$ (create$ blu giallo verde rosso))

:;rest$
(rest$(create$ blu giallo verde rosso))

;;( defglobal ?*num−rows* = 5)

;;length$
(length$ (create$ blu giallo verde rosso))

;;deff function length of list

(deffunction assert−length ( ?list )
(eq (length$ ?list ) (+ (length$ (first$ ?list )) (length$ (rest$ ?list)))))

(assert−length (create$ blu giallo verde rosso))


;;insert
(insert$ (create$ blu verde giallo rosso) 1 nero)

;;delete 
(delete$ (create$ blu verde giallo rosso) 1 1)

;;
