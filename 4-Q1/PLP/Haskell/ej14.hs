{--
Dadas las siguientes funciones, determinar su comportamiento ante las 
invocaciones y el concepto que se aplica:
--}

ignoroArg1 x = "No me importa"
ignoroArg2 x = x

res = ignoroArg1 (1/0)

-- Se aplica el concepto de evaluación perezosa: los argumentos no se evalúan si no es necesario.