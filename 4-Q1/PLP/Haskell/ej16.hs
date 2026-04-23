{--
Definir la función mcd tal que dados 2 enteros retorne el máximo común 
divisor.
--}

mcd :: Int -> Int -> Int
mcd a 0 = a
mcd a b = mcd b (mod a b)