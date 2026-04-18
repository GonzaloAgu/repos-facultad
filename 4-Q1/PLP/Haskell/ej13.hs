{- HLINT ignore "Redundant bracket" -}
import Data.Char
{--
Definir las funciones:
- sin_consonantes: dada una lista de palabras retorna la lista con las palabras sin sus consonantes.
- cuantas_consonantes: dada una lista de palabras retorna la lista con la cantidad de consonantes de cada palabra.
- h: dada una lista de palabras y una función, puede comportarse como las anteriores.
--}
{- HLINT ignore "Use infix" -}
esConsonante :: Char -> Bool
esConsonante char = notElem (toLower char) ['a', 'e', 'i', 'o', 'u']

quitarConsonantes :: String -> String
quitarConsonantes [] = []
quitarConsonantes (primero:resto) = 
    if esConsonante primero then quitarConsonantes resto
    else (primero:quitarConsonantes resto)


sinConsonantes :: [String] -> [String]
sinConsonantes lista_strings =  map quitarConsonantes lista_strings
