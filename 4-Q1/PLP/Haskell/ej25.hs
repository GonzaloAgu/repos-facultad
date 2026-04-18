{--
Dada la función f:
  f [] x = x
  f (x:xs) y = f xs (x y)
Definir su prototipo y objetivo.
Aplicando f definir:
- verifican: dada una lista de valores y una lista de funciones, retorna los valores
  que luego de aplicar las funciones devuelven un resultado que se encuentra 
  en la lista de valores.
- saldoFinal: dado el saldo inicial y una lista de movimientos, obtener el saldo 
  final según el código de operación.
--}
