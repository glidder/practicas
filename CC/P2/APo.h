#ifndef APO_H
#define APO_H
#include <cassert>
#include <iostream>

using namespace std;

template <typename T> 
class Apo{
public:
	explicit Apo(int maxNodos);
	void insertar(const T& e);
	void suprimir();
	void insertarE2(const T& e);
	void suprimirMaximo();
	T cima() const;
	bool vacio() const;
	Apo(const Apo<T>& a);
	Apo<T>& operator =(const Apo<T>& a); 
	~Apo();
private:
	typedef int nodo; 
	T* nodos;
	int maxNodos;
	nodo ultimo;
};

template <typename T>
inline Apo<T>::Apo(int maxNodos):
	nodos(new T[maxNodos]), maxNodos(maxNodos), ultimo(-1){}

template <typename T>
inline T Apo<T>::cima() const{
	assert(ultimo > -1);
	return nodos[0];
}

template <typename T>
inline bool Apo<T>::vacio() const{
	return (ultimo == -1);
}

template <typename T>
inline void Apo<T>::insertar(const T& e){
	assert(ultimo < maxNodos-1);
	nodo p = ++ultimo;
	while (p > 0 && e < nodos[(p-1)/2]){
		nodos[p] = nodos[(p-1)/2];
		p = (p-1)/2;
	}
	nodos[p] = e;
}

/** Ejercicio 2 **/
template <typename T>
void Apo<T>::insertarE2(const T& e){
	assert(ultimo < maxNodos-1);
	nodo p = ++ultimo;
	int profundidad(0);
	bool flag = false;
	//Calculamos profundidad
	for(nodo aux = p; aux != 0; aux = (aux-1)/2){
		++profundidad;
	}
	while(!flag && profundidad > 0 ){
		if(profundidad%2 == 0){//Nivel par
			//Tenemos que comprobar: abuelo <= e <= padre
			if(nodos[(((p-1)/2)-1)/2] <= e){//abuelo <= e
				if(e <= nodos[(p-1)/2]){//e <= padre
					flag = true;
				}else{
					--profundidad;
					nodos[p] = nodos[(p-1)/2];
					p = (p-1)/2;
				}
			}else{
				profundidad -= 2;
				nodos[p] = nodos[(((p-1)/2)-1)/2];
				p = (((p-1)/2)-1)/2;
			}
		}else{ //Nivel impar
			//Tenemos que comprobar: padre <= e <= abuelo
			if(nodos[(p-1)/2] <= e){//padre <= e
				if(profundidad > 1){
					if(e <= nodos[(((p-1)/2)-1)/2]){//e <= abuelo
						flag = true;
					}else{
						profundidad -= 2;
						nodos[p] = nodos[(((p-1)/2)-1)/2];
						p = (((p-1)/2)-1)/2;
					}
				}else{
					flag = true;
				}
			}else{
				--profundidad;
				nodos[p] = nodos[(p-1)/2];
				p = (p-1)/2;
				
			}
		}
	}
	nodos[p] = e;
	//Comprobación
	for(int i = 0; i <= ultimo; ++i){
		cout << nodos[i] << " ";
	}
	cout << endl;
}


/** Ejercicio 3 **/
template <typename T>
void Apo<T>::suprimirMaximo(){
	assert(ultimo > -1);
	//Buscamos el máximo
	nodo p;
	if(ultimo == 0){
		nodos[ultimo] = 0;
		--ultimo;
	}else{
		if(ultimo == 1){
			p = 1;
		}else{
			nodo p = (nodos[1]<nodos[2])?2:1;
		}
		//Listo
		bool b = false;
		while(!b){
			//Los casos: 
			//		1) No tiene hijo -> Borramos
			//		2) Sólo un hijo (izquierdo) -> Subimos y borramos
			//		3) Dos hijos -> Elegir entre los dos
			//		4) Nieto (por rama izquierda) -> Elegir entre el nieto y el hijo der.
			//		5) Dos nietos (por rama izquierda) -> 
			//											- Par (mínimo de nietos e hDer).
			//											- Impar (máximo de nietos e hDer).
			//		6) Tres o cuatro nietos ->
			//											- Par (mínimo de esos).
			//											- Impar (máximo de esos).
		}
	}
	
	
}

template <typename T>
inline void Apo<T>::suprimir(){
	assert(ultimo > -1);
	T e = nodos[ultimo];
	--ultimo;
	if (ultimo > -1){
		nodo p = 0;
		if (ultimo > 0){
			bool fin = false;
			while (p <= (ultimo-1)/2 && !fin) {
				nodo pMin;
				if (2*p+1 == ultimo) pMin = 2*p+1;
				else if (nodos[2*p+1] < nodos[2*p+2]) pMin = 2*p+1;
				else pMin = 2*p+2;
				if (nodos[pMin] < e) { // subir el hijo menor
					nodos[p] = nodos[pMin];
					p = pMin;
				}
				else
					fin = true;
			}
		}
		nodos[p] = e;
	}
}

template <typename T>
inline Apo<T>::~Apo(){
	delete[] nodos;
}

template <typename T>
Apo<T>::Apo(const Apo<T>& a):
	nodos(new T[a.maxNodos]), maxNodos(a.maxNodos), ultimo(a.ultimo){
	for (nodo n = 0; n <= ultimo; n++)
		nodos[n] = a.nodos[n];
}

template <typename T>
Apo<T>& Apo<T>::operator =(const Apo<T>& a){
	if (this != &a){
		if (maxNodos != a.maxNodos){
			delete[] nodos;
			maxNodos = a.maxNodos;
			nodos = new T[maxNodos];
		}
		ultimo = a.ultimo;
		for (nodo n = 0; n <= ultimo; n++)
			nodos[n] = a.nodos[n];
	}
	return *this;
}

#endif // APO_H
