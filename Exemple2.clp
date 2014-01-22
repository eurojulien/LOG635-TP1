(clear)

(deffacts listFaits
	(blessure-crime transchante)
	
	(personnage Marc est un constructeur)
	(personnage Paul est un musicien)
	(suspect-a Robert masse)
)

;Constantes pour déterminer l'arme selon la blessure
(deffacts constantes
	(blessure transchante peut etre faite par arme couteau)
	(blessure transchante peut etre faite par arme katana)
	(blessure transchante peut etre faite par arme hache)
	(blessure contendante peut etre faite par arme masse)
	(blessure contendante peut etre faite par arme saxophone)
)

(defrule blessure-crime-determine-arme
	(declare (salience 30) )
	(blessure-crime ?blessure)
	(blessure ?blessure peu etre faite par arme ?arme)
	=>
	(printout t "L'arme du crime peu etre le/la " ?arme "." crlf)
	(assert (arme-crime-possible ?arme))
)


;Les metiers
(defrule constructeur-possede-hache-masse
	(declare (salience 39) )
	(personnage ?nom est un constructeur)
	=>
	(printout t ?nom " est un constructeur donc il a une hache et une masse." crlf)
	(assert (suspect-a ?nom hache))
	(assert (suspect-a ?nom masse))
)

(defrule musicien-possede-saxophone
	(declare (salience 38) )
	(personnage ?nom est un musicien)
	=>
	(printout t ?nom " est un musicien donc il a un saxophone." crlf)
	(assert (suspect-a ?nom saxophone))
)


;Regle de fin !
(defrule meutrier
	(declare (salience 41) )
	(arme-crime-possible ?arme)
	(suspect-a ?nom ?arme)
	(blessure ?blessure peu etre faite par arme ?arme)
	=>
	(printout t "Le crime a été fait par " ?nom " avec le/la " ?arme ", une blessure " ?blessure "." crlf)
	(assert (Meurtrier ?nom))
	(halt)
)

(reset)
(run)