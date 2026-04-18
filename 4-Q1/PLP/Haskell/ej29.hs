{--
Dada la función:
  func _ _ _ [] = []
  func f g x (y:ys) | f (g y) x = y : func f g x ys
                    | otherwise = func f g x ys
Definir su prototipo y objetivo.
Aplicando func, definir:
- sublistas: dada una lista de valores y una función, devuelve una lista de 
  sublistas que agrupan aquellos elementos que, al aplicarle la función, 
  producen el mismo resultado.
- superanProm: dada una lista de materias, una lista de tuplas (alumno, materia, 
  nota1, nota2) y un promedio mínimo, obtiene una lista de duplas (materia, 
  alumnosAprobados) con los alumnos cuyo promedio supera el mínimo.
--}
