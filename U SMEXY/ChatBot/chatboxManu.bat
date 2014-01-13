(clear)

(deffunction  analisis1 (?cadena)

(bind ?x (create$ a b c))
(bind ?caden "¿")

		
(loop-for-count (?n 1(length$(explode$ ?cadena))) do
		
	(if (member$(nth$ ?n (explode$ ?cadena)) (create$ hello salut))
		then (assert (frase saludo))
		else (assert (frase eco ?cadena)))
		
	(if (member$(nth$ ?n (explode$ ?cadena)) (explode$ ?caden))
		then (assert (frase1 saludo1))
		else (assert (frase eco ?cadena)))
		
	(if (member$(nth$ ?n (explode$ ?cadena)) (create$ quizas creo))
		then (assert (frase1 saludo1))
		else (assert (frase eco ?cadena)))
		
	(if (member$(nth$ ?n (explode$ ?cadena)) (create$ ))
		then (assert (frase1 saludo1))
		else (assert (frase eco ?cadena)))
		
		
)
	
		
		
	(if (str-index "hola" (lowcase ?cadena))
		then (assert (frase1 saludo1));;; podria activar otra regla para contestar al hola
		else (assert (frase eco ?cadena))
		) ;;; por defecto realiza el eco
		
	(if (str-index "buenas tardes" (lowcase ?cadena))
		then (assert (frase saludo));;; podria activar otra regla para contestar al hola
		else (assert (frase eco ?cadena))
		) ;;; por defecto realiza el eco
		

	(if (str-index "buenas noches" (lowcase ?cadena))
		then (assert (frase saludo));;; podria activar otra regla para contestar al hola
		else (assert (frase eco ?cadena))
		) ;;; por defecto realiza el eco

	(if (str-index "buenas tardes" (lowcase ?cadena))
		then (assert (frase saludo));;; podria activar otra regla para contestar al hola
		else (assert (frase eco ?cadena))
		) ;;; por defecto realiza el eco

)


(defrule iniciandoChatbot
 ?ih <- (initial-fact) ;;Asigna a la variable ih los hechos iniciales, para mas tarde poder eliminarlos
=>
(retract ?ih) ;;Elimina el hecho de la memoria activa
(printout t crlf crlf crlf)	;
(printout t 
"        Comienza a hablar con el ChatbotECO" crlf)     
(printout t
"        teclea cualquier frase sin caracteres raros y luego Enter" crlf crlf) 
(printout t
"        para finalizar teclea ADIOS " crlf crlf) 
(assert (Achatear))  )




(defrule Chateando
 ?ih <- (Achatear)
=>
 (retract ?ih)
 (printout t  "           Tú> ")
 (bind ?resp (readline))
 (assert (respuesta (lowcase ?resp)))
 (analisis1 (lowcase ?resp)))
 
 
 
 
 (defrule despedida
  (declare (salience 100)) ;;; prioridad mas alta que el resto de frases
  (respuesta "adios")
=>
  (printout t 
"         ChatbotECO> Muchas gracias por tu charla. Saludos" crlf crlf crlf)
  (retract *)
  (halt))
  
  
  
  
  
(defrule eco
	(declare (salience -1)) ;;; prioridad baja para intentar dar una respuesta mejor que el eco
	(frase eco ?cadena)
=>
     (printout t 
"       ChatbotECO> ¿ " ?cadena " ?" crlf)
     (retract *)
     (assert (Achatear)))  ;;; volvemos al bucle para esperar otra resp

	 
	 
	 
	 
(defrule saludando
(declare (salience 90))
    (frase saludo)
=>
    (printout t 
"       ChatbotECO>  Hola, ¿qué tal?  " crlf)
    (retract *)  ;;Borra todos los hechos
    (assert (Achatear)))
	
	
	
;;Vamos a mostrar otra respuesta
(defrule saludando1
(declare (salience 90))
    (frase1 saludo1)
=>
    (printout t 
"       ChatbotECO>  Hola, holita  " crlf)
    (retract *)  ;;Borra todos los hechos
    (assert (Achatear)))


(reset)
(run)