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



;;====================================================;;
; TEMPLATE PER I FATTI CHE IL SISTEMA INFERISCE
(deftemplate infering
        (slot feature           (type SYMBOL))
        (slot value             (type STRING))
)

(deftemplate inferred
        (slot feature           (type SYMBOL))
        (slot value             (type STRING))
        (slot number            (type INTEGER))
)

;;====================================================;;
; TEMPLATE PER I FATTI DI TIPO RESULT CHE IL SISTEMA INFERISCE
(deftemplate infering-result
        (slot feature           (type SYMBOL))
        (slot value             (type STRING)) ;;mod da int
)

(deftemplate result
        (slot feature           (type SYMBOL))
        (slot value             (type STRING))
        (slot number            (type INTEGER))
)

;;====================================================;;
; TEMPLATE PER I FATTI CHE VENGONO UTILIZZATI PER INFERIRE IL board-game MIGLIORE PER L'UTENTE
(deftemplate hypotetical-board-game
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
        (slot weight            (type SYMBOL)  (allowed-values facile medio difficile))
        (slot coop-comp         (type SYMBOL)   (allowed-values coop comp coop\comp null))
        
) 


(deftemplate players
        (slot label            (type SYMBOL))
        (slot 1players         (type SYMBOL) (allowed-values T F))
        (slot 2players         (type SYMBOL) (allowed-values T F))
        (slot 3players         (type SYMBOL) (allowed-values T F))
        (slot 4players         (type SYMBOL) (allowed-values T F))
        (slot 5players         (type SYMBOL) (allowed-values T F))
        (slot 6players         (type SYMBOL) (allowed-values T F))
        (slot 6players+        (type SYMBOL) (allowed-values T F))
)

(deftemplate best-players
        (slot label             (type SYMBOL))
        (slot best-1players      (type SYMBOL) (allowed-values T F)  (default F))
        (slot best-2players      (type SYMBOL) (allowed-values T F)  (default F))
        (slot best-3players      (type SYMBOL) (allowed-values T F)  (default F))
        (slot best-4players      (type SYMBOL) (allowed-values T F)  (default F))
        (slot best-5players      (type SYMBOL) (allowed-values T F)  (default F))
        (slot best-6players      (type SYMBOL) (allowed-values T F)  (default F))
        (slot best-6players+     (type SYMBOL) (allowed-values T F)  (default F))
)
(deftemplate general-kind
        (slot label             (type SYMBOL))
        (slot german            (type SYMBOL) (allowed-values T F) (default F))
        (slot american          (type SYMBOL) (allowed-values T F) (default F))
        (slot filler            (type SYMBOL) (allowed-values T F) (default F))
        (slot cardgame          (type SYMBOL) (allowed-values T F) (default F))
        (slot party             (type SYMBOL) (allowed-values T F) (default F))
        (slot wargame           (type SYMBOL) (allowed-values T F) (default F))
        (slot family            (type SYMBOL) (allowed-values T F) (default F))
)

 
(deftemplate secondary-kind
        (slot label             (type SYMBOL))
        (slot thematic          (type SYMBOL) (allowed-values T F) (default F))
        (slot strategy          (type SYMBOL) (allowed-values T F) (default F))
        (slot challenging       (type SYMBOL) (allowed-values T F) (default F))
        (slot explorative       (type SYMBOL) (allowed-values T F) (default F))
        (slot wtdplacement      (type SYMBOL) (allowed-values T F) (default F))
        (slot hmovement         (type SYMBOL) (allowed-values T F) (default F))
        (slot investigative     (type SYMBOL) (allowed-values T F) (default F))
        (slot bidding           (type SYMBOL) (allowed-values T F) (default F))
        (slot bluff             (type SYMBOL) (allowed-values T F) (default F))
)


(deftemplate thematic-environment
        (slot label             (type SYMBOL))
        (slot greece            (type SYMBOL) (allowed-values T F) (default F))
        (slot abstract          (type SYMBOL) (allowed-values T F) (default F))
        (slot western           (type SYMBOL) (allowed-values T F) (default F))
        (slot horror            (type SYMBOL) (allowed-values T F) (default F))
        (slot gothic            (type SYMBOL) (allowed-values T F) (default F))
        (slot lovecraft         (type SYMBOL) (allowed-values T F) (default F))
        (slot war               (type SYMBOL) (allowed-values T F) (default F))
        (slot dream             (type SYMBOL) (allowed-values T F) (default F))
        (slot fantasy           (type SYMBOL) (allowed-values T F) (default F))
        (slot farms             (type SYMBOL) (allowed-values T F) (default F))
        (slot tailoring         (type SYMBOL) (allowed-values T F) (default F))
        (slot futuristic        (type SYMBOL) (allowed-values T F) (default F))
        (slot merchants         (type SYMBOL) (allowed-values T F) (default F))
        (slot indians           (type SYMBOL) (allowed-values T F) (default F))
        (slot fireworks         (type SYMBOL) (allowed-values T F) (default F))
        (slot survival          (type SYMBOL) (allowed-values T F) (default F))
        (slot industry          (type SYMBOL) (allowed-values T F) (default F))
        (slot numbers           (type SYMBOL) (allowed-values T F) (default F))
        (slot castles           (type SYMBOL) (allowed-values T F) (default F))
        (slot vampyric          (type SYMBOL) (allowed-values T F) (default F))
        (slot renaissance_court (type SYMBOL) (allowed-values T F) (default F))
        (slot pirates           (type SYMBOL) (allowed-values T F) (default F))
        (slot witchcraft        (type SYMBOL) (allowed-values T F) (default F))
        (slot trains            (type SYMBOL) (allowed-values T F) (default F))
        (slot jewelry           (type SYMBOL) (allowed-values T F) (default F))
        (slot oriental          (type SYMBOL) (allowed-values T F) (default F))
        (slot forests           (type SYMBOL) (allowed-values T F) (default F))
        (slot roman             (type SYMBOL) (allowed-values T F) (default F))
        (slot glass             (type SYMBOL) (allowed-values T F) (default F))
        (slot chemistry         (type SYMBOL) (allowed-values T F) (default F))
        (slot gala_hotel        (type SYMBOL) (allowed-values T F) (default F)) 
        (slot lord_of_the_rings (type SYMBOL) (allowed-values T F) (default F))
        (slot tale              (type SYMBOL) (allowed-values T F) (default F))
        (slot crime             (type SYMBOL) (allowed-values T F) (default F))
        (slot restaurants       (type SYMBOL) (allowed-values T F) (default F))
        (slot mafia             (type SYMBOL) (allowed-values T F) (default F))
        (slot politics          (type SYMBOL) (allowed-values T F) (default F))     
)