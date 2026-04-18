{--
Definir la función select (filter de Prelude) tal que dado un criterio de 
selección y una lista retorna los elementos de la lista que verifican el criterio.
--}


filtro :: (a -> Bool) -> [a] -> [a]
filtro f [] = []
filtro f (primero:resto) =
    if f primero
    then primero:filtro f resto
    else filtro f resto