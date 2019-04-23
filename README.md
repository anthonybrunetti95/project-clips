# GameBoardSystemExpert 
*"L'uomo non smette di giocare perché invecchia, ma invecchia perché smette di giocare."* (GEORGE BERNARD SHAW)

## Prerequisiti

Per eseguire il sistema esperto è necessario scaricare [CLIPS 6.30](https://sourceforge.net/projects/clipsrules/files/CLIPS/6.30/) per il proprio sistema operativo.


## Contesto

Questo genere di sistema esperto si può collocare in questo scenario:
Questo genere di sistema esperto può avere come scenario di applicazione un'azienda di distribuzione, che vende al dettaglio giochi da tavolo. Nel caso in cui la l’azienda di distribuzione abbia una sede fisica o una piattaforma web, il Sistema Esperto andrà quindi ad abbassare i costi relativi alla retribuzione del personale addetto all'assistenza dei clienti.
Attualmente è possibile installare il sistema su un terminale e accedervi.

##  Architettura
L'architettura del sistema è molto modulare e si divide in diverse parti:

L'interfaccia utente: contiene tutte le funzioni necessarie per interagire con l'utente.
La Base di conoscenza: contiene tutti i fatti e le regole di inferenza che rappresentano il modello di conoscenza esperto che il sistema è in grado di manipolare ed elaborare durante l'esecuzione.
Il motore inferenziale: contiene il motore per dedurre nuove conoscenze prendendo in considerazione le risposte dell'utente alle domande selezionate dal sistema.
Il modulo aiuto: è in grado di fornire ulteriori informazioni all'utente non solo sul significato delle domande, ma anche sui motivi per cui tali domande sono state selezionate.

## Autore 
ANTHONY BRUNETTI
