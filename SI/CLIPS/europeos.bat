(defrule europeos
	(nombre ?x ?y ?z)
	(nacionalidad Es)
	(profesion escritor)
		=>	(assert (intelectual_europeo ?x ?y ?z))
			(printout t ?x " " ?y " " ?z " " " es intelectual europeo" crlf))
(agenda)
