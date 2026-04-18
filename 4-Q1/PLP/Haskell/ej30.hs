{--
Dada la siguiente función:
  func _ [] [] = True
  func _ _ [] = False
  func _ [] _ = False
  func g (x:xs) (y:ys) = g x y && func g xs ys
Definir su prototipo y objetivo.
--}
