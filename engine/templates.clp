;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                DEFINIZIONI DEI TEMPLATE               ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;====================================================;;



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
        (slot 1players         (type SYMBOL) (allowed-values TRUE FALSE))
        (slot 2players         (type SYMBOL) (allowed-values TRUE FALSE))
        (slot 3players         (type SYMBOL) (allowed-values TRUE FALSE))
        (slot 4players         (type SYMBOL) (allowed-values TRUE FALSE))
        (slot 5players         (type SYMBOL) (allowed-values TRUE FALSE))
        (slot 6players         (type SYMBOL) (allowed-values TRUE FALSE))
        (slot 6players+        (type SYMBOL) (allowed-values TRUE FALSE))
)

(deftemplate best-players
        (slot label             (type SYMBOL))
        (slot best-1players      (type SYMBOL) (allowed-values TRUE FALSE))
        (slot best-2players      (type SYMBOL) (allowed-values TRUE FALSE))
        (slot best-3players      (type SYMBOL) (allowed-values TRUE FALSE))
        (slot best-4players      (type SYMBOL) (allowed-values TRUE FALSE))
        (slot best-5players      (type SYMBOL) (allowed-values TRUE FALSE))
        (slot best-6players      (type SYMBOL) (allowed-values TRUE FALSE))
        (slot best-6players+     (type SYMBOL) (allowed-values TRUE FALSE))
)
(deftemplate general-kind
        (slot label             (type SYMBOL))
        (slot german            (type SYMBOL) (allowed-values TRUE FALSE))
        (slot american          (type SYMBOL) (allowed-values TRUE FALSE))
        (slot filler            (type SYMBOL) (allowed-values TRUE FALSE))
        (slot cardGame          (type SYMBOL) (allowed-values TRUE FALSE))
        (slot party             (type SYMBOL) (allowed-values TRUE FALSE))
        (slot wargame           (type SYMBOL) (allowed-values TRUE FALSE))
        (slot family            (type SYMBOL) (allowed-values TRUE FALSE))
)

 
(deftemplate secondary-kind
        (slot label             (type SYMBOL))
        (slot thematic          (type SYMBOL) (allowed-values TRUE FALSE))
        (slot strategy          (type SYMBOL) (allowed-values TRUE FALSE))
        (slot challenging       (type SYMBOL) (allowed-values TRUE FALSE))
        (slot explorative       (type SYMBOL) (allowed-values TRUE FALSE))
        (slot wtdplacement      (type SYMBOL) (allowed-values TRUE FALSE))
        (slot hmovemnt          (type SYMBOL) (allowed-values TRUE FALSE))
        (slot investigative     (type SYMBOL) (allowed-values TRUE FALSE))
        (slot bidding           (type SYMBOL) (allowed-values TRUE FALSE))
        (slot bluff             (type SYMBOL) (allowed-values TRUE FALSE))
)


(deftemplate thematic-environment
        (slot label             (type SYMBOL))
        (slot greece            (type SYMBOL) (allowed-values TRUE FALSE))
        (slot abstract          (type SYMBOL) (allowed-values TRUE FALSE))
        (slot western           (type SYMBOL) (allowed-values TRUE FALSE))
        (slot horror            (type SYMBOL) (allowed-values TRUE FALSE))
        (slot gothic            (type SYMBOL) (allowed-values TRUE FALSE))
        (slot lovecraft         (type SYMBOL) (allowed-values TRUE FALSE))
        (slot war               (type SYMBOL) (allowed-values TRUE FALSE))
        (slot dream             (type SYMBOL) (allowed-values TRUE FALSE))
        (slot fantasy           (type SYMBOL) (allowed-values TRUE FALSE))
        (slot farms             (type SYMBOL) (allowed-values TRUE FALSE))
        (slot tailoring         (type SYMBOL) (allowed-values TRUE FALSE))
        (slot futuristic        (type SYMBOL) (allowed-values TRUE FALSE))
        (slot merchants         (type SYMBOL) (allowed-values TRUE FALSE))
        (slot indians           (type SYMBOL) (allowed-values TRUE FALSE))
        (slot fireworks         (type SYMBOL) (allowed-values TRUE FALSE))
        (slot survival          (type SYMBOL) (allowed-values TRUE FALSE))
        (slot industry          (type SYMBOL) (allowed-values TRUE FALSE))
        (slot numbers           (type SYMBOL) (allowed-values TRUE FALSE))
        (slot castles           (type SYMBOL) (allowed-values TRUE FALSE))
        (slot vampyric          (type SYMBOL) (allowed-values TRUE FALSE))
        (slot renaissance-court (type SYMBOL) (allowed-values TRUE FALSE))
        (slot pirates           (type SYMBOL) (allowed-values TRUE FALSE))
        (slot witchcraft        (type SYMBOL) (allowed-values TRUE FALSE))
        (slot trains            (type SYMBOL) (allowed-values TRUE FALSE))
        (slot jewelry           (type SYMBOL) (allowed-values TRUE FALSE))
        (slot oriental          (type SYMBOL) (allowed-values TRUE FALSE))
        (slot forests           (type SYMBOL) (allowed-values TRUE FALSE))
        (slot roman             (type SYMBOL) (allowed-values TRUE FALSE))
        (slot glass             (type SYMBOL) (allowed-values TRUE FALSE))
        (slot chemistry         (type SYMBOL) (allowed-values TRUE FALSE))
        (slot gala_hotel        (type SYMBOL) (allowed-values TRUE FALSE))
        (slot lord_of_the_rings (type SYMBOL) (allowed-values TRUE FALSE))
        (slot tale              (type SYMBOL) (allowed-values TRUE FALSE))
        (slot crime             (type SYMBOL) (allowed-values TRUE FALSE))
        (slot restaurants       (type SYMBOL) (allowed-values TRUE FALSE))
        (slot mafia             (type SYMBOL) (allowed-values TRUE FALSE))
        (slot politics          (type SYMBOL) (allowed-values TRUE FALSE))     
)