;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                DEFINIZIONI DEI TEMPLATE               ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;====================================================;;



;;====================================================;;
; TEMPLATE PER I DATI DI UN GIOCO DA TAVOLO

(deftemplate board-game
        (slot label             (type SYMBOL))
        (slot board-game-name   (type STRING))
        (slot main-features
                (slot players           (type INTEGER))
                (slot best              (type FLOAT))
                (slot length            (type FLOAT))
                (slot weight            (type FLOAT))
                (slot designeres        (type STRING))
        ) 
        (slot players
                (slot Solo-player       (type BOOL))
                (slot 2-players         (type BOOL))
                (slot 3-players         (type BOOL))
                (slot 4-players         (type BOOL))
                (slot 5-players         (type BOOL))
                (slot 6-players         (type BOOL))
                (slot higher-6-players  (type BOOL))
        )
        (slot general-kind
                (slot german            (type BOOL))
                (slot american          (type BOOL))
                (slot filer             (type BOOL))
                (slot cardGame          (type BOOL))
                (slot party             (type BOOL))
                (slot wargame           (type BOOL))
                (slot family            (type BOOL))
        )
        (slot secondary-kind
                (slot thematic          (type BOOL))
                (slot strategy          (type BOOL))
                (slot challenging       (type BOOL))
        )
        (slot thematic-environment
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
)