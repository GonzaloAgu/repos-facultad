% REQUIERE_MATERIAL
% dado un producto, verifica si requiere un material específico de forma directa o indirecta
% (es decir, como ingrediente directo o como ingrediente recursivo de alguno de sus subcomponentes).

requiere_material(Producto, Material) :-
    receta(Producto, ListaIngredientes),
    member(Material, ListaIngredientes).

requiere_material(Producto, Material) :-
    receta(Producto, ListaIngredientes),
    member(IngCompuesto, ListaIngredientes),
    requiere_material(IngCompuesto, Material).

/* 
    ingredientes_base(Producto, ListaMateriales)
    Tal que, dado un producto, permite obtener la lista plana de todos los recursos básicos (los 
    que no tienen receta) necesarios en la cadena para fabricar dicho 
    producto. No es necesario calcular cantidades en esta regla, solo listar qué 
    recursos básicos intervienen en todo el árbol de dependencias. 
*/

ingredientes_base(Producto, [Producto]) :-
    recurso_basico(Producto), !.

ingredientes_base(Producto, Basicos) :-
    receta(Producto, Ingredientes),
    maplist(ingredientes_base, Ingredientes, ListaDeListas),
    append(ListaDeListas, BasicosConRepetidos),
    list_to_set(BasicosConRepetidos, Basicos).  % sacamos repetidos


/*
    cantidad_necesaria(Producto, CantidadDeseada, MaterialBase, CantidadTotal)
    Dado un producto y la cantidad que se desea fabricar,
    calcula recursivamente la cantidad total requerida de un material básico específico,
    multiplicando las proporciones a través de todo el árbol de dependencias. 
*/


% Caso base: el producto requerido es el basico requerido
% (asumiendo que el usuario ingresó un recurso básico como MaterialBase, implicitamente se cumple que recurso_basico(Producto))
cantidad_necesaria(Producto, CantidadDeseada, MaterialBase, CantidadDeseada) :-
    Producto == MaterialBase, !.

% Caso base 2: el producto requerido es basico, pero no el basico que nos interesa contar
cantidad_necesaria(Producto, _, _, 0) :-
    recurso_basico(Producto), !.

% Caso recursivo: Cuando el Producto no es un recurso básico.
cantidad_necesaria(Producto, CantidadDeseada, MaterialBase, CantidadTotal) :-
    receta(Producto, Ingredientes),
    suma_ingredientes(Ingredientes, CantidadDeseada, MaterialBase, CantidadTotal).


% Regla auxiliar recursiva (recursividad indirecta) para sumar las ocurrencias de un ingrediente básico dentro de una lista de ingredientes
% desarmando a aquellos productos compuestos
suma_ingredientes([], _, _, 0).
suma_ingredientes([Ingrediente|Resto], CantidadDeseada, MaterialBase, Total) :-
    cantidad_necesaria(Ingrediente, CantidadDeseada, MaterialBase, SubtotalIngrediente),
    suma_ingredientes(Resto, CantidadDeseada, MaterialBase, SubtotalResto),
    Total is SubtotalIngrediente + SubtotalResto.