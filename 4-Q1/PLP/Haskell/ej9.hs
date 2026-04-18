{--
Aplicando la siguiente función, definir las funciones cuadrado, cubo y cuarta, 
tales que dado un entero retornan la correspondiente potencia del mismo:
pot :: Integer -> Integer -> Integer
pot n x = x ^ n
--}

pot :: Integer -> Integer -> Integer
pot n x = x ^ n

cuadrado x = pot x 2
cubo x = pot x 3