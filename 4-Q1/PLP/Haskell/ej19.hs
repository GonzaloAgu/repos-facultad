{--
    Definir la función ordenar tal que dado un criterio y una lista retorna la lista 
    ordenada según el criterio.
--}

ordenar f lista
    | ordenada lista = listArray
    | otherwise ordenar burbuja lista

ordenada :: [a] -> Bool
ordenada lista = True

burbuja :: (a->a->Bool) -> [a] -> [a]
burbuja _ [] = []
burbuja _ [x] = [x]

burbuja f (x:y:resto)
    | f x y = (x:burbuja f (y:resto))
    | otherwise = (y:burbuja f (x:resto))
