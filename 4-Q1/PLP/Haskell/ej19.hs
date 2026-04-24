{--
    Definir la función ordenar tal que dado un criterio y una lista retorna la lista 
    ordenada según el criterio. 
--}

ordenar f lista
    | ordenada f lista = lista
    | otherwise = ordenar f (burbuja f lista)

ordenada :: (t -> t -> Bool) -> [t] -> Bool
ordenada _ [] = True
ordenada _ [x] = True
ordenada f (x:y:resto) = f x y && ordenada f (y:resto)  

burbuja :: (a->a->Bool) -> [a] -> [a]
burbuja _ [] = []
burbuja _ [x] = [x]

burbuja f (x:y:resto)
    | f x y = x:burbuja f (y:resto)
    | otherwise = y:burbuja f (x:resto)
