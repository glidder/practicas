/*f(x,y)= { 1 si x>y, 2 si y>x, 0 en otro caso}*/
	IF X1 > X2 GOTO A
	IF X2 > X1 GOTO B
	GOTO E
[B]	Y++
[A]	Y++
