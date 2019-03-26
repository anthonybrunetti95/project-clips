  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                DEFINIZIONI DEI TEMPLATE               ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;====================================================;;
; TEMPLATE PER LE DOMANDE CHE IL SISTEMA PONE ALL'UTENTE
(deftemplate asking-question
        (slot question          (type SYMBOL))
        (multislot answers)
)

(deftemplate asked-question
        (slot question          (type SYMBOL))
        (slot number            (type INTEGER))
        (multislot values)
        (slot answer)
)

(deftemplate asked-questions
        (multislot question     (type SYMBOL)))

(deftemplate last-question
        (slot question          (type INTEGER))
)

;;====================================================;;
; TEMPLATE PER LE RISPOSTE ALLE DOMANDE DATE DALL'UTENTE
(deftemplate info
        (slot feature           (type SYMBOL))
        (slot value             (type STRING))
        (slot question          (type SYMBOL))
)

(deftemplate user-budget
        (slot min-budget        (type INTEGER))
        (slot max-budget        (type INTEGER))
)

(deftemplate game-players
        (slot player            (type INTEGER))
)

(defclass game-general-kind (is-a USER)
        (multislot general-kind      (type SYMBOL))
)

(defclass game-secondary-kind (is-a USER)
        (multislot secondary-kind    (type SYMBOL))
)

(defclass game-thematic-environment (is-a USER)
        (multislot thematic-environment (type SYMBOL))
)

(deftemplate game-time
        (slot time              (type INTEGER))
)

(deftemplate user-age
        (slot min-age           (type INTEGER))
        (slot max-age           (type INTEGER)) 
)
;;====================================================;;
; TEMPLATE PER I FATTI CHE IL SISTEMA INFERISCE
(deftemplate infering
        (slot feature           (type SYMBOL))
        (slot value             (type SYMBOL))
)

(deftemplate inferred
        (slot feature           (type SYMBOL))
        (slot value             (type SYMBOL))
        (slot number            (type INTEGER))
)

;;====================================================;;
; TEMPLATE PER I FATTI DI TIPO RESULT CHE IL SISTEMA INFERISCE
(deftemplate infering-result
        (slot feature           (type SYMBOL))
        (slot value             (type SYMBOL)) ;;mod da int
)

(deftemplate result
        (slot feature           (type SYMBOL))
        (slot value             (type SYMBOL))
        (slot number            (type INTEGER))
)





;;====================================================;;
; TEMPLATE PER I FATTI CHE VENGONO UTILIZZATI PER INFERIRE IL board-game MIGLIORE PER L'UTENTE
(deftemplate hypotetical-final-board-game
        (slot label             (type SYMBOL))
        (multislot what         (type SYMBOL))
)

(deftemplate removing-detail
        (slot detail            (type SYMBOL))
)

(deftemplate final-board-game
        (slot label             (type SYMBOL))
)

;;====================================================;;
; TEMPLATE PER LA RITRATTAZIONE
(deftemplate reasked-question
        (slot question          (type INTEGER))
)

;;====================================================;;
; TEMPLATE PER I DATI DI UN GIOCO DA TAVOLO


(deftemplate board-game
        (slot label              (type SYMBOL))
        (slot name               (type STRING))
        (slot length             (type INTEGER))
        (slot weight             (type SYMBOL) (allowed-values facile medio difficile))
        (slot coop-comp          (type SYMBOL) (allowed-values coop comp coop\comp null))
        (slot age                (type INTEGER))
        (slot price              (type INTEGER))
        (multislot players       (type INTEGER))
        (multislot best-players  (type INTEGER))   
)

(deftemplate general-kind
    (slot label         (type SYMBOL))
    (multislot general-kind (type SYMBOL))
)

(deftemplate secondary-kind
     (slot label               (type SYMBOL))
     (multislot secondary-kind (type SYMBOL))
)

(deftemplate thematic-environment
    (slot label              (type SYMBOL))
    (multislot thematic-environment (type SYMBOL))
)

