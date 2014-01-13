(defglobal ?*familia* = (create$ padre madre hijo hija abuelo abuela tio tia sobrino sobrina))
(defglobal ?*verbos* = (create$  "hola adios" "ADIOS HOLA"))
(defglobal ?*deportes* = (create$ futbol baloncesto natacion tenis ))
(bind ?caden "¿")

(nth$ 1 ?*verbos*)


			
		(if (~(str-compare ?cadena ?*rep*))
			then (assert (frase repetida))
		else
			(bind ?*rep* ?cadena) )


(defrule me
	(declare (salience 80))
    (frase me ?cadena)
=>
    (printout t "       ChatbotECO> " (sub-string 1 (- (str-index "me" ?cadena) 1) ?cadena) "le" (sub-string (+ (str-index "me" ?cadena) 2) (str-length ?cadena) ?cadena)  crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule nos
	(declare (salience 80))
    (frase cambiar ?cadena)
	(test(str-index "nos" ?cadena))
=>
    (printout t "       ChatbotECO> " (sub-string 1 (- (str-index "nos" ?cadena) 1) ?cadena) "les" (sub-string (+ (str-index "nos" ?cadena) 3) (str-length ?cadena) ?cadena)  crlf)
    (retract *) 
    (assert (Achatear)) )
	
(defrule mi
	(declare (salience 80))
    (frase cambiar ?cadena)
	(test(str-index "mi" ?cadena))
=>
    (printout t "       ChatbotECO> " (sub-string 1 (- (str-index "mi" ?cadena) 1) ?cadena) "tu" (sub-string (+ (str-index "mi" ?cadena) 2) (str-length ?cadena) ?cadena)  crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule nuestro
	(declare (salience 80))
    (frase cambiar ?cadena)
	(test(str-index "nuestro" ?cadena))
=>
    (printout t "       ChatbotECO> " (sub-string 1 (- (str-index "nuestro" ?cadena) 1) ?cadena) "su" (sub-string (+ (str-index "nuestro" ?cadena) 7) (str-length ?cadena) ?cadena)  crlf)
    (retract *) 
    (assert (Achatear)) )
	
	;(str-cat (sub-string 1 (- (str-index "me" ?cadena) 1) ?cadena) me (sub-string (+ (str-index "me" ?cadena) 2) (str-length ?cadena) ?cadena) )
	;caminar comer dormir trabajar escribir hacer limpiar soñar estudiar
	
(deffunction  cambiar-punto-vista (?cadena)
	(if (str-index "me" ?cadena)
	then (bind ?cadena (str-cat (sub-string 1 (- (str-index "me" ?cadena) 1) ?cadena) le (sub-string (+ (str-index "me" ?cadena) 2) (str-length ?cadena) ?cadena))) )
	(if (str-index "nos" ?cadena)
	then (bind ?cadena (str-cat (sub-string 1 (- (str-index "nos" ?cadena) 1) ?cadena) les (sub-string (+ (str-index "nos" ?cadena) 3) (str-length ?cadena) ?cadena))) )
	(if (str-index "mi" ?cadena)
	then (bind ?cadena (str-cat (sub-string 1 (- (str-index "mi" ?cadena) 1) ?cadena) tu (sub-string (+ (str-index "mi" ?cadena) 2) (str-length ?cadena) ?cadena))) )
	(if (str-index "nuestro" ?cadena)
	then (bind ?cadena (str-cat (sub-string 1 (- (str-index "nuestro" ?cadena) 1) ?cadena) su (sub-string (+ (str-index "nuestro" ?cadena) 7) (str-length ?cadena) ?cadena))) )
	(if (str-index "yo" ?cadena)
	then (bind ?cadena (str-cat (sub-string 1 (- (str-index "yo" ?cadena) 1) ?cadena) usted (sub-string (+ (str-index "yo" ?cadena) 2) (str-length ?cadena) ?cadena))) )
	(if (str-index "nosotros" ?cadena)
	then (bind ?cadena (str-cat (sub-string 1 (- (str-index "nosotros" ?cadena) 1) ?cadena) ustedes (sub-string (+ (str-index "nosotros" ?cadena) 8) (str-length ?cadena) ?cadena))) )
	(assert (frase cambiar ?cadena))
)

(defrule cambio
	(declare (salience 80))
    (frase cambiar ?cadena)
=>
    (printout t "       ChatbotECO> "?cadena crlf)
    (retract *) 
    (assert (Achatear)) )	
	
	
	(defrule cambio
	(declare (salience 80))
    (frase cambiar ?cadena)
=>
    (printout t "       ChatbotECO> " ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )	
