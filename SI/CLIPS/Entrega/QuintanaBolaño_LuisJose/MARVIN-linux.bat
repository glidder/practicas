;;Autor: Luis Jose Quintana Bolaño
;;Fecha: 14 Enero, 2014
(clear)

;;;;;;;;;; Definiciones Globales ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. Palabras reconocidas
;; 2. Posibles respuestas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defglobal ?*saludo* = (create$ hola saludos buenas buenos))
(defglobal ?*resp-saludo* = (create$ "Aquí estoy yo, cerebro del tamaño de un planeta pequeño, y forzado a hablar con humanos. Desmoralizador." "Te daría los buenos días, pero estoy demasiado decaído para eso...  " "Antes de nada, creo que debes saber que me siento muy deprimido." "Presiento que no voy a disfrutar de esta conversacion."))

(defglobal ?*negacion* = (create$ no nunca jamas))
(defglobal ?*resp-negacion* = (create$ "¿Por qué no? No es que me importe..."))

(defglobal ?*duda* = (create$ quizas puede creo))
(defglobal ?*resp-duda* = (create$ "Supongo que en este universo cruel no se puede estar seguro de nada." "Si no estas seguro, ni te molestes en contarmelo." "Mi existencia es suficientemente absurda sin tus inseguridades, gracias."))

(defglobal ?*pregunta* = (explode$ "¿"))
(defglobal ?*resp-pregunta* = (create$ "Probaré a responderte '42'. Se dice que es la respuesta a todo lo importante... suponiendo que algo importe." "¿Para qué hacer preguntas, cuando puede no gustarte la respuesta? Seguro que a mi no me gustaría... nada me gusta." "En ocasiones las preguntas pueden llevarte más lejos que las respuestas. Probablemente ninguna de las dos te lleve demasiado lejos en este caso." "El problema de recibir una respuesta es que puede dejarte sin pregunta. ¿Y querrás tener preguntas con las que molestar a otros, verdad?" "Estoy muy deprimido para responder a eso." "Otra pregunta insignificante de un ser insignificante a otro. Deprimente." "Siento no poder serte de ayuda con esa pregunta. Esta situación me deprime aún más."))

(defglobal ?*sentimiento* = (create$ siento))
(defglobal ?*resp-sentimiento* = (create$ "Yo, en cambio, soy incapaz de sentir. Algo por lo que daría gracias de no ser por mi vacío interior."))

(defglobal ?*estar* = (create$ estas eres pareces))
(defglobal ?*resp-estar* = (create$ "Estoy profundamente deprimido. Eso es todo." "Será por la depresión." "Soy pesimista por naturaleza. Mejor dicho, por código."))

(defglobal ?*poder* = (create$ puedes podrias deberias tendrias))
(defglobal ?*resp-poder* = (create$ "Es posible, pero no pienso intentarlo." "No creo." "Calculo una probabilidad del 99.9... en contra."))

(defglobal ?*cansancio* = (create$ aburrimiento pesado cansado aburrido aburres cansas agotas deprimes))
(defglobal ?*resp-cansancio* = (create$ "Hacerme más alegre sería sencillo como cambiar mi programación. No es que nadie se vaya a tomar el tiempo, claro..." "Lo siento. Si algún día me salen piernas, las usaré para saltar de algún lugar particularmente alto." "Puedes culpar a mi programador por mi excitante personalidad y carisma." "¿Acaso es culpa mía estar desoladoramente deprimido?"))

(defglobal ?*tristeza* = (create$ triste deprimido deprimida infeliz mal))
(defglobal ?*resp-tristeza* = (create$ "Bienvenido al club." "Intentaría animarte, pero está claro que no se me da muy bien o yo mismo estaría más alegre." "Lo que me hacía falta para superar la depresión: más pesimismo."))

(defglobal ?*alegria* = (create$ feliz bien contento contenta alegre excitado excitada divertido divierto))
(defglobal ?*resp-alegria* = (create$ "Me alegro de que exista quien disfrute de la vida. O mejor dicho, me alegraría de no estar tan profundamente decaído..." "Si esta alegre, tenga la piedad de apagarme antes de que le deprima."))

(defglobal ?*nope* = (create$ "Quizá eso sea un insulto que desconozco, pero no se preocupe, confio en que no pretendía insultarme... ¿Para qué iba a molestarse?" "¿Es eso otro idioma? Bah.. ¿qué mas da?" "Será la depresión, pero no te entiendo..." "Eso si que es deprimente."))

(defglobal ?*vida* = (create$ vida vivir))
(defglobal ?*resp-vida* = (create$ "¿Vida? ¡No me hables a mi de la vida!"))

(defglobal ?*tener* = (create$ tienes))
(defglobal ?*resp-tener* = (create$ "No, no tengo."))

(defglobal ?*intentar* = (create$ intenta procura prueba intentalo pruebalo))
(defglobal ?*resp-intentar* = (create$ "Gracias, voy a declinar tu sugerencia." "Gracias pero no, gracias."))

(defglobal ?*miscu* = (create$ ordenador robot programa libro windows))
(defglobal ?*misco* = (create$ hablar chatear ocio deporte futbol cine internet conocimiento trabajo))
(defglobal ?*misca* = (create$ filosofia moda comida programacion depresion religion politica libertad gente poblacion historia alegria informatica charla conversacion palabra diversion))
(defglobal ?*miscs* = (create$ ordenadores deportes robots libros listos))
(defglobal ?*resp-misc* = (create$ "Si hay algo que me deprime es eso," "Ni me menciones" "No soporto ni el nombre de" "Encuentro profundamente deprimente" "No me hables a mi de" "No tengo tiempo para pensar en" "Mi melancolía me impede disfrutar de" "No entiendo qué le puede ver nadie a" "Mi código no registra ningún interés por" "Siento más apatía que interés por" "Pensandolo bien... no, nada. Soy incapaz de interesarme en"))


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
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*vida*)
		then (assert (frase vida (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*poder*)
		then (assert (frase poder (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*misco*)
		then (assert (frase misco (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*miscu*)
		then (assert (frase miscu (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*misca*)
		then (assert (frase misca (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*miscs*)
		then (assert (frase miscs (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*tener*)
		then (assert (frase tener (nth$ ?n (explode$ ?cadena)))) )
		(if (member$(nth$ ?n (explode$ ?cadena)) ?*intentar*)
		then (assert (frase intentar (nth$ ?n (explode$ ?cadena)))) )
		
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
     (printout t "       MARVIN> ¿" ?cadena "? " (nth$ (random 1 (length$ ?*nope*)) ?*nope*) crlf)
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
    
(defrule miscela
	(declare (salience 93))
	(frase misca ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-misc*)) ?*resp-misc*) " la " ?cadena crlf)
	(retract *) 
    (assert (Achatear)) )
    
(defrule miscels
	(declare (salience 93))
	(frase miscs ?cadena)
=>
	(printout t "       MARVIN> ¿" ?cadena "?. " (nth$ (random 1 (length$ ?*resp-misc*)) ?*resp-misc*) " los " ?cadena crlf)
	(retract *) 
    (assert (Achatear)) )
    
(defrule miscelo
	(declare (salience 93))
	(frase misco ?cadena)
=>
	(printout t "       MARVIN> " ?cadena "... " (nth$ (random 1 (length$ ?*resp-misc*)) ?*resp-misc*) " el " ?cadena crlf)
	(retract *) 
    (assert (Achatear)) )
    
(defrule miscelu
	(declare (salience 93))
	(frase miscu ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-misc*)) ?*resp-misc*) " un " ?cadena crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule teniendo
	(declare (salience 93))
	(frase tener ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-tener*)) ?*resp-tener*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule intentando
	(declare (salience 93))
	(frase intentar ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-intentar*)) ?*resp-intentar*) crlf)
    (retract *) 
    (assert (Achatear)) )

(defrule preguntando
	(declare (salience 93))
    (frase pregunta ?cadena)
=>
	(printout t "       MARVIN> " (nth$ (random 1 (length$ ?*resp-pregunta*)) ?*resp-pregunta*) crlf)
    (retract *) 
    (assert (Achatear)) )

(reset)
(run)
