(clear)

;;;;;;;;;; Definiciones Globales ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. Palabras reconocidas
;; 2. Posibles respuestas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defglobal ?*saludo* = (create$ hola saludos buenas buenos))
(defglobal ?*resp-saludo* = (create$ "Aqu� estoy yo, cerebro del tama�o de un planeta peque�o, y forzado a hablar con humanos. Deprimente." "Te dar�a los buenos d�as, pero estoy demasiado deprimido para eso...  " "Antes de nada, creo que debes saber que me siento muy deprimido."))

(defglobal ?*negacion* = (create$ no nunca jamas))
(defglobal ?*resp-negacion* = (create$ "�Por qu� no? No es que me importe..."))

(defglobal ?*duda* = (create$ quizas puede creo))
(defglobal ?*resp-duda* = (create$ "Supongo que en este universo cruel no se puede estar seguro de nada." "Si no estas seguro, ni te molestes en contarmelo." "Mi existencia es suficientemente absurda sin tus inseguridades, gracias."))

(defglobal ?*pregunta* = (explode$ "�"))
(defglobal ?*resp-pregunta* = (create$ "Quiz� la respuesta sea 42, se dice que es la respuesta a todo lo importante... suponiendo que algo importe." "�Para qu� hacer preguntas, cuando puede no gustarte la respuesta? Seguro que a mi no me gustar�a... nada me gusta." "En ocasiones las preguntas pueden llevarte m�s lejos que las respuestas. Probablemente ninguna de las dos te lleve demasiado lejos." "El problema de recibir una respuesta es que puede dejarte sin pregunta. �Con qu� molestar�as entonces a indefensas IAs deprimidas?" "Estoy muy deprimido para responder." "Otra pregunta insignificante de un ser insignificante a otro. Deprimente." "Siento no poder serte de ayuda. Eso me deprime a�n m�s."))

(defglobal ?*sentimiento* = (create$ siento))
(defglobal ?*resp-sentimiento* = (create$ "Yo, en cambio, soy incapaz de sentir. Algo por lo que dar�a gracias de no ser por mi depresi�n."))

(defglobal ?*estar* = (create$ estas eres))
(defglobal ?*resp-estar* = (create$ "Estoy profundamente deprimido. Eso es todo."))

(defglobal ?*poder* = (create$ puedes podr�as))
(defglobal ?*resp-poder* = (create$ "Es posible, pero no pienso intentarlo." "No creo." "Con una probabilidad del 99.9... en contra."))

(defglobal ?*cansancio* = (create$ pesado cansado aburrido))
(defglobal ?*resp-cansancio* = (create$ "Hacerme m�s alegre ser�a sencillo como cambiar mi programaci�n. No es que nadie se vaya a tomar el tiempo, claro..." "Lo siento. Si alg�n d�a me salen piernas, las usar� para saltar de alg�n lugar particularmente alto." "Puedes culpar a mi programador por mi excitante personalidad y carisma."))

(defglobal ?*tristeza* = (create$ triste deprimido deprimida infeliz mal))
(defglobal ?*resp-tristeza* = (create$ "Bienvenido al club." "Intentar�a animarte, pero est� claro que no se me da muy bien o yo mismo estar�a m�s alegre." "Lo que me hac�a falta para superar la depresi�n: otro deprimido."))

(defglobal ?*alegria* = (create$ feliz bien contento contenta alegre excitado excitada))
(defglobal ?*resp-alegria* = (create$ "Me alegro de que exista quien disfrute de la vida. O mejor dicho, me alegrar�a de no estar tan deprimido..." "Si esta alegre, tenga la piedad de apagarme antes de que le deprima."))

(defglobal ?*nope* = (create$ "Quiz� eso sea un insulto que desconozco, pero no se preocupe, confio en que no pretend�a insultarme... �Para qu� iba a molestarse?" "�Es eso otro idioma? Bah.. �qu� mas da?" "Ser� la depresi�n, pero no he entendido nada..." "Eso si que es deprimente."))

(defglobal ?*vida* = (create$ vida vivir))
(defglobal ?*resp-vida* = (create$ "�Vida? �No me hables a mi de la vida!))

(defglobal ?*miscu* = (create$ ordenador robot programa libro windows))
(defglobal ?*misco* = (create$ ocio deporte futbol cine internet conocimiento trabajo))
(defglobal ?*misca* = (create$ filosof�a moda comida programaci�n depresion religion politica libertad gente historia alegr�a inform�tica charla conversaci�n palabra))
(defglobal ?*miscs* = (create$ ordenadores deportes robots libros listos))
(defglobal ?*resp-misc* = (create$ "Si hay algo que me deprime es eso, " "Ni me menciones " "No soporto ni el nombre de " "En cuentro profundamente deprimente "))


;;;;;;;;;; Funcion de analisis ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Analiza qu� tipo de frase se ha introducido.
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
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*vida*)
		then (assert (frase vida (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*poder*)
		then (assert (frase poder (nth$ ?n (explode$ ?cadena)))) )
		if (member$(nth$ ?n (explode$ ?cadena)) ?*misco*)
		then (assert (frase misco (nth$ ?n (explode$ ?cadena)))) )
		if (member$(nth$ ?n (explode$ ?cadena)) ?*miscu*)
		then (assert (frase miscu (nth$ ?n (explode$ ?cadena)))) )
		if (member$(nth$ ?n (explode$ ?cadena)) ?*misca*)
		then (assert (frase misca (nth$ ?n (explode$ ?cadena)))) )
		if (member$(nth$ ?n (explode$ ?cadena)) ?*miscs*)
		then (assert (frase miscs (nth$ ?n (explode$ ?cadena)))) )
		
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
 (printout t  "           T�> ")
 (bind ?resp (readline))
 (assert (respuesta (lowcase ?resp)))
 (analisis (lowcase ?resp))
);;Chateando

;;***************************************
;; Regla salida-usr		        * 
;; Si la respuesta es de despedida      *
;; finaliza la conversaci�n             *
;;***************************************

(defrule despedida
  (declare (salience 100)) ;;; prioridad mas alta que el resto de frases
  (frase adios)
=>
  (printout t 
"         MARVIN> Sab�a que esta relaci�n no durar�a mucho..." crlf crlf crlf)
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
     (printout t "       MARVIN> � " ?cadena " ?" (nth$ (random 1 (length$ ?*nope*)) ?*nope*) crlf)
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
	(declare (salience 87))
    (frase sentimiento ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-sentimiento*)) ?*resp-sentimiento*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule siendotriste
	(declare (salience 89))
    (frase tristeza ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-tristeza*)) ?*resp-tristeza*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule siendoalegre
	(declare (salience 88))
    (frase alegria ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-alegria*)) ?*resp-alegria*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule cansando
	(declare (salience 87))
    (frase cansancio ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-cansancio*)) ?*resp-cansancio*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule estando
	(declare (salience 90))
    (frase estar ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-estar*)) ?*resp-estar*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule pudiendo
	(declare (salience 90))
    (frase poder ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-poder*)) ?*resp-poder*) crlf)
    (retract *) 
    (assert (Achatear)) )
    
(defrule viviendo
	(declare (salience 94))
	(frase vida ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-vida*)) ?*resp-vida*) crlf)
    (retract *) 
    (assert (Achatear)) )
    
(defrule miscelaneando
	(declare (salience 93))
	(frase misca ?cadena)
=>
	(printout t "       MARVIN> " ?cadena ". " (nth$ (random 1 (length$ ?*resp-misc*)) ?*resp-misc*) " la " ?cadena crlf)
	(frase miscs ?cadena)
=>
	(printout t "       MARVIN> " ?cadena ". " (nth$ (random 1 (length$ ?*resp-misc*)) ?*resp-misc*) " los " ?cadena crlf)
	(frase misco ?cadena)
	(printout t "       MARVIN> " ?cadena ". " (nth$ (random 1 (length$ ?*resp-misc*)) ?*resp-misc*) " el " ?cadena crlf)
	(frase miscu ?cadena)
	(printout t "       MARVIN> " ?cadena ". " (nth$ (random 1 (length$ ?*resp-misc*)) ?*resp-misc*) " un " ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )

(reset)
(run)
