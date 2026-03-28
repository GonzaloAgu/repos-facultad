mejor_vuelto(0, []).

mejor_vuelto(X, [1000|Resto]) :-
    X >= 1000,
    NuevoX is X - 1000,
    mejor_vuelto(NuevoX, Resto).

mejor_vuelto(X, [500|Resto]) :-
    X >= 500,
    NuevoX is X - 500,
    mejor_vuelto(NuevoX, Resto).
    
mejor_vuelto(X, [200|Resto]) :-
    X >= 200,
    NuevoX is X - 200,
    mejor_vuelto(NuevoX, Resto).
   
mejor_vuelto(X, [100|Resto]) :-
    X >= 100,
    NuevoX is X - 100,
    mejor_vuelto(NuevoX, Resto).
   
mejor_vuelto(X, [50|Resto]) :-
    X >= 50,
    NuevoX is X - 50,
    mejor_vuelto(NuevoX, Resto).

mejor_vuelto(X, [20|Resto]) :-
    X >= 20,
    NuevoX is X - 20,
    mejor_vuelto(NuevoX, Resto).

mejor_vuelto(X, [10|Resto]) :-
    X >= 10,
    NuevoX is X - 10,
    mejor_vuelto(NuevoX, Resto).

mejor_vuelto(X, [5|Resto]) :-
    X >= 5,
    NuevoX is X - 5,
    mejor_vuelto(NuevoX, Resto).

mejor_vuelto(X, [2|Resto]) :-
    X >= 2,
    NuevoX is X - 2,
    mejor_vuelto(NuevoX, Resto).

mejor_vuelto(X, [1|Resto]) :-
    X >= 1,
    NuevoX is X - 1,
    mejor_vuelto(NuevoX, Resto).

