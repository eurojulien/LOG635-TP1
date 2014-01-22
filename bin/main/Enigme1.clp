; Enigme 1

; suppression des faits
(clear)

; Fait de base (Dictionnaire termes)
; KEYWORD	PARAMETER				Definition											Example
;
; WAS		element place			"L'élément était à cet endroit"						WAS pierre cinema
; ITEM		object					"Objet"												ITEM fork
; HAS		character place item	"Le personnage avait cet item à cet endroit"		HAS pierre cinema ticket
; HASNOT	character place item	"Le personnage n'avait pas cet item a cet endroit"	HASNOT pierre cinema ticket
; NOT		event					"Inverse la valeur boolenne de l'evenement"			NOT WAS pierre cinema	
; EAT		food item				"La nourriture a été consommé avec cet objet"		EAT cake fork
; AT-T		At time					"Heure (24h) heure evenement"						AT-T 15
; FROM-T	from time				"Heure (24h) départ évenement"						FROM-T 11
; TO-T		to time					"Heure (24h) fin évènement"							TO-T 15


; Fait de base
(deffacts baseFacts
	(WAS eagle ParcDesSinges FROM-T 11 TO-T 13)
    (WAS rabbit CageAuxLions FROM-T 11 TO-T 14)
	(HAS rabbit fork Cuisine FROM-T 10 TO-T 10)
	(WAS eagle Cuisine ITEM cake FROM-T 9 TO-T 9)
    (WAS crocodile EtangAuxGrenouilles ITEM fork FROM-T 13 TO-T 13)
    (HASNOT Cuisine cake FROM-T 13 TO 13)
    (EAT cake fork)
    (HAS crocodile fork FROM-T 10 TO-T 13)
)

; Règle de départ
