;Engime 2

; suppression des faits
(clear)

; Dictionnaire termes
; KEYWORD		PARAMETER				Definition											Example
; -------------|-----------------------|---------------------------------------------------|----------------------------
;

;*MDT - Mode de transportation

;Fait de base
(deffacts baseFacts
    (SUSPECT Louis)
    (SUSPECT Carole)
    (SUSPECT Maxime)
    (ITEM Carte-de-transport)
    (ITEM Velo)
    (ITEM Cles)
    (ITEM Voiuture)
    (MDT Carte-de-transport)
    (MDT Velo)
    (MDT Voiuture)
    (SUSPECT NEED MDT)
    (SEASON Hiver NO Velo)
    (SEASON Printemps YES Velo)
    (SEASON Automne YES Velo)
    (SEASON Ete YES Velo)
    (USE Voiture NEED Cles)
    (USE Velo INSTEAD Voiture)
    (USE Carte-de-transport INSTEAD Voiture) 
    )

;autres fait
(deffacts situation 
	(HAVE Louis ITEMNOT Carte-de-transport AT-T 8)
    (Maxime AT-LOC Cuisine ITEM Cles AT-T 7)
    (Maxime AT-LOC Cuisine FROM-T 8 TO-T 9)
    (Louis AT-LOC Cuisine ITEM Carte-de-transport AT-T 9)
    (Carole ITEM Velo)
    (Carole AT-LOC Salon FROM-T 8 TO-T 9)
    (Maxime ITEMNOT Cles AT-T 10)
    (SEASONNOW Hiver)
)

;Regle de depart
(defrule startup
    =>
    (readline)
    (printout t "LOG635 - Labo 1 - Engime 2 - Equipe 4 - Groupe 2" crlf)
    (assert (started))
)

;Regle qui utilise velo
(defrule velo-saison
    (declare (salience 40) )
	(NEEDS ?Cles)
    =>
)

;Regle qui utilise carte pour transport en commun
(defrule has-carte-de-transport
    (declare (salience 38) )
    =>
)

;Regle besoin de Cles pour utiliser Voiture
(defrule cles-voiture
    (declare (salience 41) )
    =>
)

;Regle de fin
(defrule qui-a-la-voiture
    (declare (salience 41) )
    =>
    (halt)
)

(reset)
(run)