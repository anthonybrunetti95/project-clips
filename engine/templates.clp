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


(deftemplate game-time
        (slot time              (type INTEGER))
)

(deftemplate user-age
        (slot min-age               (type INTEGER))
        (slot max-age               (type INTEGER)) 
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
        (slot label             (type SYMBOL))
        (slot board-game-name   (type STRING))
        
)


(deftemplate main-features
        (slot label             (type SYMBOL))
        (slot length            (type INTEGER))
        (slot weight            (type SYMBOL) (allowed-values facile medio difficile))
        (slot coop-comp         (type SYMBOL) (allowed-values coop comp coop\comp null))
        (slot age             (type INTEGER))
        (slot price           (type INTEGER))        
) 


(deftemplate players
        (slot label            (type SYMBOL))
        (slot 1players         (type SYMBOL) (default F))
        (slot 2players         (type SYMBOL) (default F))
        (slot 3players         (type SYMBOL) (default F))
        (slot 4players         (type SYMBOL) (default F))
        (slot 5players         (type SYMBOL) (default F))
        (slot 6players         (type SYMBOL) (default F))
        (slot 6players+        (type SYMBOL) (default F))
)

(deftemplate best-players
        (slot label             (type SYMBOL))
        (slot best-1players      (type SYMBOL)   (default F))
        (slot best-2players      (type SYMBOL)   (default F))
        (slot best-3players      (type SYMBOL)   (default F))
        (slot best-4players      (type SYMBOL)   (default F))
        (slot best-5players      (type SYMBOL)   (default F))
        (slot best-6players      (type SYMBOL)   (default F))
        (slot best-6players+     (type SYMBOL)   (default F))
)
(deftemplate general-kind
        (slot label             (type SYMBOL))
        (slot german            (type SYMBOL)  (default F))
        (slot american          (type SYMBOL)  (default F))
        (slot filler            (type SYMBOL)  (default F))
        (slot cardgame          (type SYMBOL)  (default F))
        (slot party             (type SYMBOL)  (default F))
        (slot wargame           (type SYMBOL)  (default F))
        (slot family            (type SYMBOL)  (default F))
)

 
(deftemplate secondary-kind
        (slot label             (type SYMBOL))
        (slot thematic          (type SYMBOL)  (default F))
        (slot strategy          (type SYMBOL)  (default F))
        (slot challenging       (type SYMBOL)  (default F))
        (slot explorative       (type SYMBOL)  (default F))
        (slot wtdplacement      (type SYMBOL)  (default F))
        (slot hmovement         (type SYMBOL)  (default F))
        (slot investigative     (type SYMBOL)  (default F))
        (slot bidding           (type SYMBOL)  (default F))
        (slot bluff             (type SYMBOL)  (default F))
)


(deftemplate thematic-environment
        (slot label             (type SYMBOL))
        (slot greece            (type SYMBOL)  (default F))
        (slot abstract          (type SYMBOL)  (default F))
        (slot western           (type SYMBOL)  (default F))
        (slot horror            (type SYMBOL)  (default F))
        (slot gothic            (type SYMBOL)  (default F))
        (slot lovecraft         (type SYMBOL)  (default F))
        (slot war               (type SYMBOL)  (default F))
        (slot dream             (type SYMBOL)  (default F))
        (slot fantasy           (type SYMBOL)  (default F))
        (slot farms             (type SYMBOL)  (default F))
        (slot tailoring         (type SYMBOL)  (default F))
        (slot futuristic        (type SYMBOL)  (default F))
        (slot merchants         (type SYMBOL)  (default F))
        (slot indians           (type SYMBOL)  (default F))
        (slot fireworks         (type SYMBOL)  (default F))
        (slot survival          (type SYMBOL)  (default F))
        (slot industry          (type SYMBOL)  (default F))
        (slot numbers           (type SYMBOL)  (default F))
        (slot castles           (type SYMBOL)  (default F))
        (slot vampyric          (type SYMBOL)  (default F))
        (slot renaissance_court (type SYMBOL)  (default F))
        (slot pirates           (type SYMBOL)  (default F))
        (slot witchcraft        (type SYMBOL)  (default F))
        (slot trains            (type SYMBOL)  (default F))
        (slot jewelry           (type SYMBOL)  (default F))
        (slot oriental          (type SYMBOL)  (default F))
        (slot forests           (type SYMBOL)  (default F))
        (slot roman             (type SYMBOL)  (default F))
        (slot glass             (type SYMBOL)  (default F))
        (slot chemistry         (type SYMBOL)  (default F))
        (slot gala_hotel        (type SYMBOL)  (default F)) 
        (slot lord_of_the_rings (type SYMBOL)  (default F))
        (slot tale              (type SYMBOL)  (default F))
        (slot crime             (type SYMBOL)  (default F))
        (slot restaurants       (type SYMBOL)  (default F))
        (slot mafia             (type SYMBOL)  (default F))
        (slot politics          (type SYMBOL)  (default F))     
)
