/*Producto*/
	Z2 <- X2
[B]	IF Z2 != 0 GOTO A
	GOTO E
[A]	Z2 <- Z2 - 1
	Z1 <- X1 + Y
	Y <- Z1
	GOTO B
