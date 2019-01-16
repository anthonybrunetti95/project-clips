;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;         VARIABILI GLOBALI PER LE PRIORITA'            ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defglobal ?*top-priority*                      = 2000)
(defglobal ?*highest-priority*                  = 1000)
(defglobal ?*high-priority*                     = 100)
(defglobal ?*normal-priority*                   = 10)
(defglobal ?*zero-priority*                     = 1)
(defglobal ?*sub-normal-priority*               = -10)
(defglobal ?*low-priority*                      = -100)
(defglobal ?*lowest-priority*                   = -1000)
(defglobal ?*bottom-priority*                   = -2000)

(defrule starting-rule
        (declare (salience ?*top-priority*))
        =>        
     
        (seed (round (time))) 
        (set-strategy random)
        (assert (last-question (question 0)))
        (assert (asked-questions (question (create$))))
)

(defrule print-configuration
        (declare (salience ?*top-priority*))
        (not (retraction))
        (final-board-game (label ?label))
        =>
      
        (printout t crlf crlf (load_description ?label))
        (printout t crlf  "arrivederci !!!" crlf)
        ;;(halt)
)
