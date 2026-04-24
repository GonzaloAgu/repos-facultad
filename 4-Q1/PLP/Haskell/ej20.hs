{--
    Definir la función aplica tal que dadas una lista de funciones, una lista de 
    elementos y una lista de valores resultado, permita obtener una lista de 
    tuplas (elemento, resultado, posiciónDeLaPrimeraFunciónQueProduceElResultado).
--}

aplica [] [] [] = []
aplica funciones [a] [b] = [(a, b, buscarPos funciones a b 0)]
aplica funciones (a:restoElementos) (b:restoResultados) =
    (a, b, buscarPos funciones a b 0) : aplica funciones restoElementos restoResultados

buscarPos funciones elemento resultado start
    | start >= length funciones = -1
    | (funciones !! start) elemento == resultado = start
    | otherwise = buscarPos funciones elemento resultado (start + 1)
