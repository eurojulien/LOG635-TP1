;
; Fichier d'exemple pour l'initiation au langage JESS.
; Démontre la base de l'utilisation des faits et des règles.
;

; Suppression des faits
(clear)

; Faits de base
(deffacts faits
	(is-dead zenon)
	(meurtre from-t 1 to-t 4)
	(meurtre at-loc bluemountain)
	(at-loc denis bluemountain from-t 18 to-t 20)
	(at-loc daniel bluemountain at-time 2)
	(meurtre instr couteau)
	(have daniel couteau)
)

; Faits inutilisés
(deffacts unused
	(hello world)
	(bonjour monde)
)

; Règle de départ
(defrule startup
    =>
    (readline)
    (printout t "Laboratoire de l'équipe X! Règle de départ" crlf)
    (assert (started))
)

; Règles de déduction



(defrule voici-le-suspect
	(declare (salience 60))
	(meurtre at-loc ?loc)
	(meurtre from-t ?t1 to-t ?t2)
	(meurtre instr ?inst)
	(at-loc ?s ?loc at-time ?t3)
	(test (>= ?t3 ?t1))
	(test (<= ?t3 ?t2))
	(have ?s ?inst)
	(started)
	=>
	(printout t "Voici le suspect: " ?s crlf)
	(assert (is-suspect ?s))
)

(defrule voici-le-tueur
	(declare (salience 40))
	(is-suspect ?s)
	=>
	(assert (is-killer ?s))
	(printout t "Le tueur est " ?s crlf)
)

(defrule fin
	(declare (salience 39))
	?f <- (is-suspect ?s)
	=>
	(retract ?f)
	(printout t "L'exécution est terminée!" crlf)
	(halt)
)

(reset)
(run)