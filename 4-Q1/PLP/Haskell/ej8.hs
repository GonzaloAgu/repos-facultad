{--
Definir las funciones esta/noEsta tal que dado un elemento y una lista 
verifican que el elemento pertenece/no pertenece a la lista.
--}
{- HLINT ignore "Use foldr" -}

esta :: Eq a => a -> [a] -> Bool
esta x [] = False
esta x (primero:resto) = (x == primero) || esta x resto
    
noEsta x [] = True
noEsta x (primero:resto) = (x /= primero) && noEsta x resto