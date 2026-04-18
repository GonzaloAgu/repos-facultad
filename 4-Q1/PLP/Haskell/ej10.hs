{--
Definir la función collect (map de Prelude) tal que dada una función y una 
lista aplica la función a cada elemento de la lista y retorna la lista de 
resultados
--}


miMap _ [] = []
miMap f [x] = [f x]
miMap f (primero:resto) =
    f primero:miMap f resto