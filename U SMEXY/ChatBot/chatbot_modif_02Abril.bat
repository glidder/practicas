(clear)

(defglobal ?*rep* = "")

(defglobal ?*saludos* = (create$ hola saludos buenos buenas))
(defglobal ?*negacion* = (create$ no nunca jamas))
(defglobal ?*incertidumbres* = (create$ quizas puede creo))
(defglobal ?*interrogaciones* = (explode$ "¿"))

(defglobal ?*neg* = (create$ "¿Dices que no, solo para ser negativo?" "¿De verdad?" "Es bueno ser mas positivo"))
(defglobal ?*duda* = (create$ "¿Por que no estas seguro?" "Yo tampoco estoy seguro"))
(defglobal ?*int* = (create$"¿Que cree que deberia responder?" "que piensa usted?"))

(defglobal ?*verbos* = (create$ jugar cantar bailar leer escribir trabajar llorar correr cocinar observar))
(defglobal ?*resp-verb* = (create$ "A mi me gusta " "Es muy gratificante " "La verdad es que no se me da muy bien "))

(defglobal ?*familia* = (create$ padre madre hijo hija hermano hermana tio tia abuelo abuela))
(defglobal ?*resp-familia* = (create$ "Te llevas bien con tu " "Es agradable tu " "Se parece a ti tu "))

(defglobal ?*deportes* = (create$ futbol tenis baloncesto balonmano badminton voleibol atletismo ))
(defglobal ?*resp-deportes* = (create$ "Me gusta mucho el " "Yo juego mucho al " "Es muy bueno practicar " "Me gustaria hacer "))

(defglobal ?*animales* = (create$ perro gato loro ))
(defglobal ?*resp-animales* = (create$ "Me gustaria tener un " "Nunca he tenido un " "Comprame un " "Mi padre tenia un "))

(defglobal ?*animales-pl* = (create$ perros gatos loros ))
(defglobal ?*resp-animales-pl* = "Los animales son muy bonitos, y dan mucha compania, pero son muy caros de mantener")

(defglobal ?*adjetivos1* = (create$ feliz bien contento contenta alegre))
(defglobal ?*resp-adj1* = (create$ "Me alegro de que este " "Dicen que es bueno para la salud estar " "Yo tambien estoy "))

(defglobal ?*adjetivos2* = (create$ triste deprimido deprimida infeliz mal))
(defglobal ?*resp-adj2* = (create$ "Siento que este " "Intente no pensar en que esta " "Haga algo que le guste para no estar "))


(deffunction  analisis1 (?cadena)
	(if (= (str-compare ?cadena ?*rep*) 0)
		then (assert (frase repetida))
	else
		(bind ?*rep* ?cadena) )
		
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
			
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*verbos*)
			then (assert (frase verbos (nth$ ?n (explode$ ?cadena)))))
			
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*familia*)
			then (assert (frase familia (nth$ ?n (explode$ ?cadena)))))

		(if (member$(nth$ ?n (explode$ ?cadena)) ?*deportes*)
			then (assert (frase deportes (nth$ ?n (explode$ ?cadena)))))

		(if (member$(nth$ ?n (explode$ ?cadena)) ?*animales*)
			then (assert (frase animales (nth$ ?n (explode$ ?cadena)))))

		(if (member$(nth$ ?n (explode$ ?cadena)) ?*animales-pl*)
			then (assert (frase animales1 (nth$ ?n (explode$ ?cadena)))))
			
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*adjetivos1*)
			then (assert (frase adj1 (nth$ ?n (explode$ ?cadena)))) )	
		
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*adjetivos2*)
			then (assert (frase adj2 (nth$ ?n (explode$ ?cadena)))) )
	)
			
)

	
(defrule repeticion
 (declare (salience 99))
    (frase repetida)
=>
 (printout t "       ChatbotECO> No seas repetitivo" crlf)
    (retract *) 
    (assert (Achatear)) )		
	
	
(defrule adjetivos-buenos
 (declare (salience 86))
    (frase adj1 ?cadena)
=>
 (printout t "       ChatbotECO> "(nth$ (random 1 (length$ ?*resp-adj1*)) ?*resp-adj1*) ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )	

(defrule adjetivos-malos
 (declare (salience 86))
    (frase adj1 ?cadena)
=>
 (printout t "       ChatbotECO> "(nth$ (random 1 (length$ ?*resp-adj2*)) ?*resp-adj2*) ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule verbos
 (declare (salience 86))
    (frase verbos ?cadena)
=>
 (printout t "       ChatbotECO> " (nth$ (random 1 (length$ ?*resp-verb*)) ?*resp-verb*) ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )
	
	
	
(defrule familia
 (declare (salience 86))
    (frase familia ?cadena)
=>
 (printout t "       ChatbotECO> "  "¿" (nth$ (random 1 (length$ ?*resp-familia*)) ?*resp-familia*) ?cadena "?" crlf)
    (retract *) 
    (assert (Achatear)) )
		

(defrule deportes
 (declare (salience 86))
    (frase deportes ?cadena)
=>
 (printout t "       ChatbotECO> " (nth$ (random 1 (length$ ?*resp-deportes*)) ?*resp-deportes*) ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )

	
(defrule animales
 (declare (salience 86))
    (frase animales ?cadena)
=>
 (printout t "       ChatbotECO> " (nth$ (random 1 (length$ ?*resp-animales*)) ?*resp-animales*) ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )
		
	
	
(defrule animales1
 (declare (salience 86))
    (frase animales1 ?cadena)
=>
 (printout t "       ChatbotECO> " ?*resp-animales-pl* crlf)
    (retract *) 
    (assert (Achatear)) )
	
	
	
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
	(printout t "         ChatbotECO> Muchas gracias por tu charla. Saludos" crlf crlf crlf)
	(retract *)
	(halt))
 


 
(defrule eco
	(declare (salience -1))
	(frase eco ?cadena)
=>
     (printout t "       ChatbotECO> ¿ " ?cadena " ?" crlf)
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
	(printout t "       ChatbotECO> " (nth$ (random 1 (length$ ?*neg*)) ?*neg*) crlf)
    (retract *) 
    (assert (Achatear)) )	
	
	
	
	
(defrule incertidumbre
	(declare (salience 91))
    (frase incertidumbre ?cadena)
=>
	(printout t "       ChatbotECO> " (nth$ (random 1 (length$ ?*duda*)) ?*duda*) crlf)
    (retract *) 
    (assert (Achatear)) )	

	
	
	
(defrule interrogaciones
	(declare (salience 93))
    (frase interrogaciones ?cadena)
=>
	(printout t "       ChatbotECO> " (nth$ (random 1 (length$ ?*int*)) ?*int*) crlf)
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
