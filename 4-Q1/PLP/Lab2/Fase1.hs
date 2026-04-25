{- HLINT ignore "Use foldr" -}
module Fase1 where
    import Data.Char (toLower)  

    comandosValidos = ['d', 'i', 'b', 's', 'D', 'I', 'B', 'S']

    validar :: String -> Bool
    validar [] = True
    validar (c:resto) = elem c comandosValidos && validar resto

    -- Auxiliar para ver si dos comandos se cancelan
    comandosOpuestos = [('d', 'i'), ('b', 's')]
    seCancelan c1 c2 = notElem (toLower c1, toLower c2) comandosOpuestos && notElem (toLower c2, toLower c1) comandosOpuestos

    normalizar :: String -> String
    normalizar [] = []
    normalizar [c] = [c]
    normalizar (c1:c2:resto)
        | seCancelan c1 c2 = (c1:normalizar (c2:resto))
        | otherwise = normalizar resto
