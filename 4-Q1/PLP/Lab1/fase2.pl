/*
    Desarrollar la regla fabricacion_posible(Producto, Cantidad) tal que dado 
    un producto y una cantidad a fabricar, verifica lógicamente si el inventario actual 
    cuenta con los recursos suficientes para su fabricación. El sistema debe ser lo 
    suficientemente avanzado para utilizar componentes intermedios que ya estén en 
    el inventario (por ejemplo, si se necesita un motor y ya hay engranajes en el 
    inventario, no debe contabilizar el hierro requerido para fabricar esos engranajes). 
*/

fabricacion_posible(Producto, Cantidad) :-
    inventario(Producto, Stock),
    Stock >= Cantidad.

fabricacion_posible(Producto, Cantidad) :-
    \+ recurso_basico(Producto),
    receta(Producto, ListaIngredientes),
    agrupar_ingredientes(ListaIngredientes, Agrupados),
    verificar_agrupados(Agrupados, Cantidad).

/*
    AUXILIAR: agrupar_ingredientes
*/

% agrupamos ingredientes repetidos de las listas que devuelve receta/2 en pares como (hierro, 3)
agrupar_ingredientes([], []).
agrupar_ingredientes([Ingrediente|RestoIngredientes], [(Ingrediente, Count) | RestoIngredientesAgrupados]) :-
    contar_y_quitar(Ingrediente, [Ingrediente|RestoIngredientes], Count, NuevaLista),
    agrupar_ingredientes(NuevaLista, RestoIngredientesAgrupados).

% Cuenta cuántas veces aparece Ingrediente en ListaIngredientes y devuelve ListaIngredientes pero sin ocurrencias de Ingrediente.

/*
    AUXILIAR: contar_y_quitar
*/

% Caso base
contar_y_quitar(_, [], 0, []).

% Caso recursivo donde el ingrediente coincide
contar_y_quitar(Ingrediente, [Ingrediente|RestoIngredientes], Count, NuevaLista) :-
    contar_y_quitar(Ingrediente, RestoIngredientes, CountAux, NuevaLista),
    Count is CountAux + 1.

% Caso recursivo donde el ingrediente no coincide
contar_y_quitar(Ingrediente, [OtroIngrediente | Resto], Count, [OtroIngrediente | ListaSin]) :-
    Ingrediente \= OtroIngrediente,
    contar_y_quitar(Ingrediente, Resto, Count, ListaSin).


/*
    AUXILIAR: verificar_agrupados
*/

verificar_agrupados([], _).
verificar_agrupados([(Ingrediente, CantidadPorUnidad) | Resto], CantidadTotal) :-
    CantidadNecesaria is CantidadPorUnidad * CantidadTotal,
    fabricacion_posible(Ingrediente, CantidadNecesaria),
    verificar_agrupados(Resto, CantidadTotal).