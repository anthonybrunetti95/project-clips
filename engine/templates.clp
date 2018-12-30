;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                DEFINIZIONI DEI TEMPLATE               ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;====================================================;;



;;====================================================;;
; TEMPLATE PER I DATI DI UN GIOCO DA TA

(deftemplate board-game
        (slot label             (type SYMBOL))
        (slot board-game-name   (type STRING))
        
)


(deftemplate main-features
        (slot label             (type SYMBOL))
        (slot length            (type INTEGER))
        (slot weight            (type INTEGER)  (allowed-values 1 2 3))
        (slot coop-comp         (type STRING))
        
) 


(deftemplate players
        (slot label            (type SYMBOL))
        (slot 1players         (type BOOL))
        (slot 2players         (type BOOL))
        (slot 3players         (type BOOL))
        (slot 4players         (type BOOL))
        (slot 5players         (type BOOL))
        (slot 6players         (type BOOL))
        (slot 6players+        (type BOOL))
)

(deftemplate best-players
        (slot label             (type SYMBOL))
        (slot best-1players      (type BOOL))
        (slot best-2players      (type BOOL))
        (slot best-3players      (type BOOL))
        (slot best-4players      (type BOOL))
        (slot best-5players      (type BOOL))
        (slot best-6players      (type BOOL))
        (slot best-6players+     (type BOOL))
)
(deftemplate general-kind
        (slot label             (type SYMBOL))
        (slot german            (type BOOL))
        (slot american          (type BOOL))
        (slot filler            (type BOOL))
        (slot cardGame          (type BOOL))
        (slot party             (type BOOL))
        (slot wargame           (type BOOL))
        (slot family            (type BOOL))
)

 
(deftemplate secondary-kind
        (slot label             (type SYMBOL))
        (slot thematic          (type BOOL))
        (slot strategy          (type BOOL))
        (slot challenging       (type BOOL))
        (slot explorative       (type BOOL))
        (slot wtdplacement      (type BOOL))
        (slot hmovemnt          (type BOOL))
        (slot investigative     (type BOOL))
        (slot bidding           (type BOOL))
        (slot bluff             (type BOOL))
)


(deftemplate thematic-environment
        (slot label             (type SYMBOL))

        (slot greece            (type BOOL))
        (slot abstract          (type BOOL))
        (slot western           (type BOOL))
        (slot horror            (type BOOL))
        (slot gothic            (type BOOL))
        (slot lovecraft         (type BOOL))
        (slot war               (type BOOL))
        (slot dream             (type BOOL))
        (slot fantasy           (type BOOL))
        (slot farms             (type BOOL))
        (slot tailoring         (type BOOL))
        (slot futuristic        (type BOOL))
        (slot merchants         (type BOOL))
        (slot indians           (type BOOL))
        (slot fireworks         (type BOOL))
        (slot survival          (type BOOL))
        (slot industry          (type BOOL))
        (slot numbers           (type BOOL))
        (slot castles           (type BOOL))
        (slot vampyric          (type BOOL))
        (slot renaissance court (type BOOL))
        (slot pirates           (type BOOL))
        (slot witchcraft        (type BOOL))
        (slot trains            (type BOOL))
        (slot jewelry           (type BOOL))
        (slot oriental          (type BOOL))
        (slot forests           (type BOOL))
        (slot roman             (type BOOL))
        (slot glass             (type BOOL))
        (slot chemistry         (type BOOL))
        (slot gala_hotel        (type BOOL))
        (slot lord_of_the_rings (type BOOL))
        (slot tale              (type BOOL))
        (slot crime             (type BOOL))
        (slot restaurants       (type BOOL))
        (slot mafia             (type BOOL))
        (slot politics          (type BOOL))
       
      
)