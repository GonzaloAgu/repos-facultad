{--
    Definir una función listanios, y todas sus auxiliares, que permitan generar 
    una lista de números que representan años pares, capicúas y no bisiestos, a 
    partir de un año dado como parámetro, siempre positivo.
--}



listanios :: Int -> [Int]
listanios inicio = 
    if cumple_condiciones inicio then (inicio:(listanios (inicio + 1)))
    else listanios (inicio + 1)


cumple_condiciones :: Int -> Bool
cumple_condiciones a = mod a 2 == 0 && (capicua a) && (not (bisiesto a))

capicua :: Int -> Bool
capicua a = (a == revers a)

bisiesto a =
    (mod a 4 == 0) || 
    (mod a 100 == 0) && (mod a 400 == 0)

revers :: Int -> Int
revers n = reversa2 n 0

reversa2 :: Int -> Int -> Int
reversa2 n x
    | n < 10 = n + (x * 10)
    | otherwise = reversa2 (div n 10) ((mod n 10) + (x * 10))