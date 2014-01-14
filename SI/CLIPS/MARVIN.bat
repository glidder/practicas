(clear)

;;;;;;;;;; Deiniciones Globales ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. Palabras reconocidas
;; 2. Posibles respuestas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defglobal ?*saludo* = (create$ hola salaudos buenas buenos))
(defglobal ?*resp-saludo* = (create$ "Aquí estoy yo, cerebro del tamaño de un planeta pequeño, y forzado a hablar con humanos. Deprimente." "Te daría los buenos días, pero estoy muy deprimido para eso...  "))

(defglobal ?*negacion* = (create$ no nunca jamas))
(defglobal ?*resp-negacion* = (create$ "¿Por qué no? No es que me importe..."))

(defglobal ?*duda* = (create$ quizas puede creo))
(defglobal ?*resp-duda* = (create$ "Supongo que en este universo cruel no se puede estar seguro de nada." "Si no estas seguro, ni te molestes en contarmelo."))

(defglobal ?*pregunta* = (explode$ "¿"))
(defglobal ?*resp-pregunta* = (create$ "Quizá la respuesta sea 42, parece ser la respuesta a muchas cosas." "¿Para qué hacer preguntas, cuando puede no gustarte la respuesta? Seguro que a mi no me gustaría... nada me gusta." "En ocasiones las preguntas pueden llevarte más lejos que las respuestas. Probablemente ninguna de las dos te lleve demasiado lejos." "El problema de recibir una respuesta es que puede dejarte sin pregunta. ¿Con qué molestarías entonces a indefensas IAs deprimidas?" "Estoy muy deprimido para responder." "Otra pregunta insignificante de un ser insignificante a otro. Deprimente." "Siento no poder serte de ayuda. Eso me deprime aún más."))

(defglobal ?*sentimiento* = (create$ siento))
(defglobal ?*resp-sentimiento* = (create$ "Yo, en cambio, soy incapaz de sentir. Algo por lo que daría gracias de no ser por mi depresión."))

(defglobal ?*estar* = (create$ estoy estaba estas))
(defglobal ?*resp-estar* = (create$ "Lo único que yo estoy es deprimido."))

(defglobal ?*cansancio* = (create$ pesado cansado aburrido))
(defglobal ?*resp-cansancio* = (create$ "Hacerme más alegre sería sencillo como cambiar mi programación. No es que nadie se vaya a tomar el tiempo, claro..." "Lo siento. Si algún día me salen piernas, las usaré para saltar de algún lugar particularmente alto."))

(defglobal ?*tristeza* = (create$ triste deprimido deprimida infeliz mal))
(defglobal ?*resp-tristeza* = (create$ "Bienvenido al club." "Intentaría animarte, pero está claro que no se me da muy bien o yo mismo estaría más alegre." "Lo que me hacía falta para superar la depresión: otro deprimido."))

(defglobal ?*alegria* = (create$ feliz bien contento contenta alegre))
(defglobal ?*resp-alegria* = (create$ "Me alegro de que exista quien disfrute de la vida. O mejor dicho, me alegraría de no estar tan deprimido..." "Si esta alegre, tenga la piedad de apagarme antes de que le deprima."))

(defglobal ?*nope* = (create$ "Quizá eso sea un insulto que desconozco, pero no se preocupe, confio en que no pretendía insultarme... ¿Para qué iba a molestarse?" "¿Es eso otro idioma? Bah.. ¿qué mas da?" "Será la depresión, pero no he entendido nada..."))

;;;;;;;;;; Funcion de analisis ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Analiza qué tipo de frase se ha introducido.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deffunction analisis (?cadena)
	(loop-for-count (?n 1(length$(explode$ ?cadena))) do
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*saludo*)
		then (assert (frase saludo (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*negacion*)
		then (assert (frase negacion (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*duda*)
		then (assert (frase duda (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*pregunta*)
		then (assert (frase pregunta (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*sentimiento*)
		then (assert (frase sentimiento (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*tristeza*)
		then (assert (frase tristeza (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*alegria*)
		then (assert (frase alegria (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*cansancio*)
		then (assert (frase cansancio (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*estar*)
		then (assert (frase estar (nth$ ?n (explode$ ?cadena)))) )
		
		(if (member$(nth$ ?n (explode$ ?cadena)) (create$ adios))
		then (assert (frase adios)) )
		(assert (frase eco ?cadena))
	)
)
		
;;;;;;;;;; REGLAS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  1. iniciando
;;  2. chateando
;;  3. despedida
;;  4. eco
;;	5. respuestas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;****************************************************
;; Iniciando el Chatbot                              *
;;                                                   *
;; Variables:                                        *
;;   ?ih - para borrar el hecho inicial una vez      *
;;         lanzado                                   *
;;****************************************************

(defrule iniciandoChatbot
 	?ih <- (initial-fact)
=>
	(retract ?ih)
	(printout t crlf crlf crlf)
	(printout t "        Comienza a hablar con MARVIN, el robot deprimido." crlf)
	(printout t "        teclea cualquier frase sin caracteres raros y luego Enter" crlf crlf) 
	(printout t "        para finalizar teclea ADIOS " crlf crlf) 
	(assert (Achatear))  )

;;****************************************************
;; Regla: Chateando                                  *
;; recibe la respuesta del usuario                   *
;; y la envia para que sea analizada en otra regla   *
;; Variables:                                        *
;;   ?ih - para borrar el hecho que dispara la regla *
;;****************************************************

(defrule Chateando
 ?ih <- (Achatear)
=>
 (retract ?ih)
 (printout t  "           Tú> ")
 (bind ?resp (readline))
 (assert (respuesta (lowcase ?resp)))
 (analisis (lowcase ?resp))
);;Chateando

;;***************************************
;; Regla salida-usr		        * 
;; Si la respuesta es de despedida      *
;; finaliza la conversación             *
;;***************************************

(defrule despedida
  (declare (salience 100)) ;;; prioridad mas alta que el resto de frases
  (frase adios)
=>
  (printout t 
"         MARVIN> Sabía que esta relación no duraría mucho..." crlf crlf crlf)
  (retract *)
  (halt))
;;**********************************************
;; Regla ECO                                   *
;; devuelve la misma respuesta que el usuario  *
;; *********************************************
(defrule eco
  (declare (salience -1)) ;;; prioridad baja para intentar dar una respuesta mejor que el eco
  (frase eco ?cadena)
=>
     (printout t "       MARVIN> ¿ " ?cadena " ?" (nth$ (random 1 (length$ ?*nope*)) ?*nope*) crlf)
     (retract *)
     (assert (Achatear)))  ;;; volvemos al bucle para esperar otra resp


;;***********************************************
;;Respuestas
;;***********************************************
(defrule saludando
	(declare (salience 90))
    (frase saludo ?cadena)
=>
    (printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-saludo*)) ?*resp-saludo*)  crlf)
    (retract *)
    (assert (Achatear)))

(defrule negando
	(declare (salience 92))
    (frase negacion ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-negacion*)) ?*resp-negacion*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule dudando
	(declare (salience 91))
    (frase duda ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-duda*)) ?*resp-duda*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule preguntando
	(declare (salience 93))
    (frase pregunta ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-pregunta*)) ?*resp-pregunta*) crlf)
    (retract *) 
    (assert (Achatear)) )
    
(defrule sintiendo
	(declare (salience 88))
    (frase sentimiento ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-sentimiento*)) ?*resp-sentimiento*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule siendotriste
	(declare (salience 90))
    (frase tristeza ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-tristeza*)) ?*resp-tristeza*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule siendoalegre
	(declare (salience 89))
    (frase alegria ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-alegria*)) ?*resp-alegria*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule cansando
	(declare (salience 88))
    (frase cansancio ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-cansancio*)) ?*resp-cansancio*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule estando
	(declare (salience 87))
    (frase estar ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-estar*)) ?*resp-estar*) crlf)
    (retract *) 
    (assert (Achatear)) )

(reset)
(run)
