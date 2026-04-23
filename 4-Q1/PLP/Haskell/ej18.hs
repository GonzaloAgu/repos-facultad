{--
    Definir la función extremo tal que dado un criterio de selección y una lista 
    retorna el elemento de la lista que verifica el criterio.
--}

extremo :: (a -> a -> Bool) -> [a] -> a
extremo _ [] = error "nooo"
extremo f [a] = a

extremo f (x:y:resto)
    | f x y = extremo f (x:resto)
    | otherwise = extremo f (y:resto)