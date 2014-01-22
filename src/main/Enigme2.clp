;Engime 2

; suppression des faits
(clear)

; Dictionnaire termes
; KEYWORD		PARAMETER				Definition											Example
; -------------|-----------------------|---------------------------------------------------|----------------------------
; WAS			element place			"L'élément était à cet endroit"						WAS pierre cinema
; ITEM			object					"Objet"												ITEM fork
; HAS			character place 		"Le personnage avait a item "						HAS pierre ticket
; HASWHERE		character place item	"Le personnage avait cet item à cet endroit"		HAS pierre cinema ticket
; HASNOTWHERE	character place item	"Le personnage n'avait pas cet item a cet endroit"	HASNOT pierre cinema ticket
; HASNOT		character item			"Le personnage n'avait pas cet item"				HASNOT pierre ticket
; NOT			event					"Inverse la valeur boolenne de l'evenement"			NOT WAS pierre cinema	
; EAT			food item				"La nourriture a été consommé avec cet objet"		EAT cake fork
; AT-T			At time					"Heure (24h) heure evenement"						AT-T 15
; FROM-T		from time				"Heure (24h) départ évenement"						FROM-T 11
; TO-T			to time					"Heure (24h) fin évènement"							TO-T 15
; SEASON	    season outside			"La saison qu'il fait"								SEASON Summer


;Fait de base
(deffacts baseFacts
    (HASNOT Louis Carte-de-transport)
    (WAS Maxime Cuisine ITEM Cles AT-T 7)
    (WAS Maxime Cuisine FROM-T 8 TO-T 9)
    (HASWHERE Louis Cuisine Carte-de-transport AT-T 9)
    (HAS Carole Velo)
    (WAS Carole Salon FROM-T 8 TO-T 9)
    (HASNOT Maxime Cles AT-T 10)
    (SEASON Winter)
    )

;Regle de velo par rapport a la saison


;Regle pour la carte de transport en commun




(reset)
(run)
