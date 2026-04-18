{--
Analizar las siguientes funciones, definir su objetivo y determinar los 
conceptos que se aplican:
queHace :: [Int] -> Int
queHace [] = error "lista vacía!"
queHace [x] = x
queHace (x:y:ys) = queHace (queHaceAux1 x y : ys)
queHaceAux1::Int->Int->Int
queHaceAux1 x y |x>y = queHaceAux2 y [x,x+x ..]
 |otherwise = queHaceAux2 x [y,y+y .. ]
queHaceAux2 :: Int -> [Int] -> Int
queHaceAux2 x (y:ys) |mod y x == 0 = y
 |otherwise = queHaceAux2 x ys
--}
