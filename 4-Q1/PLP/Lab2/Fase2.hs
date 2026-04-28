module Fase2 where
    import Fase1
    import Data.Maybe (fromJust)

    esExploracionCiclica :: String -> Bool
    esExploracionCiclica ruta
        | not (validar ruta) = error "Ruta no valida"
        -- Al haber validado la ruta, tengo garantizado que "simular" devuelve Explorador, pero el compilador no lo sabe
        -- asi que tuve que usar la funcion fromJust que me permite evitar errores de compilación
        | otherwise = fromJust(simular Explorador {sector = 0, profundidad = 0} ruta) == Explorador {sector = 0, profundidad = 0}
    

    -- Asumo que las rutas son validas
    hayRiesgoDeColision :: Explorador -> String -> Explorador -> String -> Bool
    hayRiesgoDeColision exp1 [] exp2 _ = superpuestos exp1 exp2
    hayRiesgoDeColision exp1 _ exp2 [] = superpuestos exp1 exp2
    hayRiesgoDeColision exp1 (mov1:restoRuta1) exp2 (mov2:restoRuta2) = superpuestos exp1 exp2 || hayRiesgoDeColision(ejecutarComandos exp1 [mov1]) restoRuta1 (ejecutarComandos exp2 [mov2]) restoRuta2


    -- Auxiliar para chequear si dos exploradores estan superpuestos
    superpuestos :: Explorador -> Explorador -> Bool 
    superpuestos exp1 exp2 = (sector exp1 == sector exp2) && (profundidad exp1 == profundidad exp2)