{- HLINT ignore "Use foldr" -}
module Fase1 where
    import Data.Char (toLower)  

    comandosValidos = ['d', 'i', 'b', 's', 'D', 'I', 'B', 'S']
    comandosOpuestos = [('d', 'i'), ('b', 's')]

    data Explorador = Explorador {
        profundidad :: Int,
        sector:: Int
    } deriving (Show, Eq)


    validar :: String -> Bool
    validar [] = True
    validar (c:resto) = elem c comandosValidos && validar resto

    -- Auxiliar para ver si dos comandos se cancelan
    seCancelan :: Char -> Char -> Bool
    seCancelan c1 c2 = elem (toLower c1, toLower c2) comandosOpuestos || elem (toLower c2, toLower c1) comandosOpuestos

    normalizar :: String -> String
    normalizar [] = []
    normalizar [c] = [c]
    normalizar (c1:c2:resto)
        | seCancelan c1 c2 = normalizar resto
        | otherwise = c1:normalizar (c2:resto)

    {--
        NOTA:
            "normalizar" cumple a grandes rasgos con el objetivo, pero tiene el problema de que no detecta comandos opuestos que están separados por pares de comandos que se cancelan.
            Ej: "DDII" debería dar "", pero da "DI"

            Así que busqué como puedo considerar estos casos, y me encontré con "fold"
    --}

    normalizarv2 :: String -> String
    normalizarv2 listaComandos = foldr cancelar [] listaComandos

    {--
        Repaso de como actua foldr acá...
        
        normalizarv2 "SDIS" =>
        cancelar "S" (cancelar "D" (cancelar "I" (cancelar "S" []))) =>
        cancelar "S" (cancelar "D" (cancelar "I" "S")) =>
        cancelar "S" (cancelar "D" "IS") => 
        cancelar "S" "S" =>
        cancelar "S" "S" =>
        "SS"
    --}

    cancelar :: Char -> String -> String
    cancelar c [] = [c]
    cancelar c1 (c2:resto) 
        | seCancelan c1 c2 = resto
        | otherwise = c1:c2:resto

    simular :: Explorador -> String -> Maybe Explorador
    simular explorador comandos
        | not (validar comandos) = Nothing
        | otherwise = Just (ejecutarComandos explorador comandos)

    -- auxiliar
    ejecutarComandos :: Explorador -> String -> Explorador
    ejecutarComandos explorador [] = explorador
    ejecutarComandos explorador (c:restoComandos)
        | c == 'S' = ejecutarComandos (explorador {profundidad = profundidad explorador - 1}) restoComandos
        | c == 'B' = ejecutarComandos (explorador {profundidad = profundidad explorador + 1}) restoComandos
        | c == 'D' = ejecutarComandos (explorador {sector = sector explorador + 1 }) restoComandos
        | c == 'I' = ejecutarComandos (explorador {sector = sector explorador - 1 }) restoComandos
        | otherwise = error "No es un comando valido"