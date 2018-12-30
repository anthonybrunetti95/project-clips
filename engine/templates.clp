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
        (slot filer             (type BOOL))
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
)


(deftemplate thematic-environment
        (slot label             (type SYMBOL))
        (slot greece            (type BOOL))
        (slot abstract          (type BOOL))
        (slot wizardry          (type BOOL))
        (slot whesten           (type BOOL))
        (slot horror            (type BOOL))
        (slot lovecraft         (type BOOL))
        (slot realistic         (type BOOL))
        (slot farm              (type BOOL))
        (slot gothic            (type BOOL))
        (slot futuristic        (type BOOL))
        (slot renaissance       (type BOOL))
        (slot pirates           (type BOOL))
        (slot indios            (type BOOL))
)