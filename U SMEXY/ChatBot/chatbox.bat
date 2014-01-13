(clear)

(defglobal ?*saludos* = (create$ hola saludos buenos buenas))
(defglobal ?*negacion* = (create$ no nunca jamas))
(defglobal ?*incertidumbres* = (create$ quizas puede))
(defglobal ?*interrogaciones* = (explode$ "¿"))

(deffunction  analisis1 (?cadena)
	(loop-for-count (?n 1(length$(explode$ ?cadena))) do
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*saludos*)
		then (assert (frase saludo (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*negacion*)
		then (assert (frase negacion (nth$ ?n (explode$ ?cadena)))) )	
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*incertidumbres*)
		then (assert (frase incertidumbre (nth$ ?n (explode$ ?cadena)))) )	
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*interrogaciones*)
		then (assert (frase interrogaciones (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) (create$ adios))
		then (assert (frase adios)) )	
		(assert (frase eco ?cadena))
		(if (str-index "me" ?cadena)
		then (bind ?cadena (str-cat (sub-string 1 (- (str-index "me" ?cadena) 1) ?cadena) le (sub-string (+ (str-index "me" ?cadena) 2) (str-length ?cadena) ?cadena))) 
			(assert (frase me ?cadena)))
		(if (str-index "nosotros" ?cadena)
		then (bind ?cadena (str-cat (sub-string 1 (- (str-index "nosotros" ?cadena) 1) ?cadena) ustedes (sub-string (+ (str-index "nosotros" ?cadena) 8) (str-length ?cadena) ?cadena))) 
			(assert (frase nosotros ?cadena)))
		(if (str-index "nos" ?cadena)
		then (bind ?cadena (str-cat (sub-string 1 (- (str-index "nos" ?cadena) 1) ?cadena) les (sub-string (+ (str-index "nos" ?cadena) 3) (str-length ?cadena) ?cadena))) 
			(assert (frase nos ?cadena)))
		(if (str-index "mi" ?cadena)
		then (bind ?cadena (str-cat (sub-string 1 (- (str-index "mi" ?cadena) 1) ?cadena) tu (sub-string (+ (str-index "mi" ?cadena) 2) (str-length ?cadena) ?cadena))) 
			(assert (frase mi ?cadena)))
		(if (str-index "nuestro" ?cadena)
		then (bind ?cadena (str-cat (sub-string 1 (- (str-index "nuestro" ?cadena) 1) ?cadena) su (sub-string (+ (str-index "nuestro" ?cadena) 7) (str-length ?cadena) ?cadena))) 
			(assert (frase nuestro ?cadena)))
		(if (str-index "yo" ?cadena)
		then (bind ?cadena (str-cat (sub-string 1 (- (str-index "yo" ?cadena) 1) ?cadena) usted (sub-string (+ (str-index "yo" ?cadena) 2) (str-length ?cadena) ?cadena))) 
			(assert (frase yo ?cadena)))
		(if (str-index "nosotros" ?cadena)
		then (bind ?cadena (str-cat (sub-string 1 (- (str-index "nosotros" ?cadena) 1) ?cadena) ustedes (sub-string (+ (str-index "nosotros" ?cadena) 8) (str-length ?cadena) ?cadena))) 
			(assert (frase nosotros ?cadena)))
	)
)
	
(defrule iniciandoChatbot
 ?ih <- (initial-fact)
=>
(retract ?ih)
(printout t crlf crlf crlf)	;
(printout t "        Comienza a hablar con el ChatbotECO" crlf)     
(printout t "        teclea cualquier frase sin caracteres raros y luego Enter" crlf crlf) 
(printout t "        para finalizar teclea ADIOS " crlf crlf) 
(assert (Achatear))  )

(defrule Chateando
 ?ih <- (Achatear)
=>
 (retract ?ih)
 (printout t  "           Tú> ")
 (bind ?resp (readline))
 (assert (respuesta (lowcase ?resp)))
 (analisis1 (lowcase ?resp)))
 
(defrule adios
  (declare (salience 100))
  (frase adios)
=>
  (printout t 
"         ChatbotECO> Muchas gracias por tu charla. Saludos" crlf crlf crlf)
  (retract *)
  (halt))
  
(defrule eco
	(declare (salience -1))
	(frase eco ?cadena)
=>
     (printout t 
"       ChatbotECO> ¿ " ?cadena " ?" crlf)
     (retract *)
     (assert (Achatear)))  ;;; volvemos al bucle para esperar otra resp

(defrule saludando
	(declare (salience 90))
    (frase saludo ?cadena)
=>
    (printout t "       ChatbotECO> "?cadena " =)" crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule negando
	(declare (salience 92))
    (frase negacion ?cadena)
=>
    (printout t "       ChatbotECO> "?cadena " seas tan negativo, hay que mirar el lado bueno siempre" crlf)
    (retract *) 
    (assert (Achatear)) )	
	
(defrule incertidumbre
	(declare (salience 91))
    (frase incertidumbre ?cadena)
=>
    (printout t "       ChatbotECO> ¿"?cadena "?, ¿Por qué dudas? " crlf)
    (retract *) 
    (assert (Achatear)) )	

(defrule interrogaciones
	(declare (salience 93))
    (frase interrogaciones ?cadena)
=>
    (printout t "       ChatbotECO> ¿Que piensa usted? " crlf)
    (retract *) 
    (assert (Achatear)) )	
	
(defrule me
	(declare (salience 80))
    (frase me ?cadena)
=>
    (printout t "       ChatbotECO> " ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule nosotros
	(declare (salience 81))
    (frase nosotros ?cadena)
=>
    (printout t "       ChatbotECO> " ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )
	
(defrule nos
	(declare (salience 82))
    (frase nos ?cadena)
=>
    (printout t "       ChatbotECO> " ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule mi
	(declare (salience 83))
    (frase mi ?cadena)
=>
    (printout t "       ChatbotECO> " ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule nuestro
	(declare (salience 84))
    (frase nuestro ?cadena)
=>
    (printout t "       ChatbotECO> " ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )
	
(defrule yo
	(declare (salience 85))
    (frase yo ?cadena)
=>
    (printout t "       ChatbotECO> " ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )

	
(reset)
(run)
