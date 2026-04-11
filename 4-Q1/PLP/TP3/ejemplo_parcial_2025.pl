f(E, [E|_], 1) :- !.
f(E, [_|Resto], P) :-
    f(E, Resto, Ps),
    P is Ps + 1.

% 5)



total_compras(_, [], 0).

total_compras(Sector, [c(Sector, Gasto)|Resto], T) :-
    total_compras(Sector, Resto, Subtotal),
    T is Gasto + Subtotal.

total_compras(Sector, [c(OtroSector, _)|Resto], T) :-
    Sector \= OtroSector,
    total_compras(Sector, Resto, T).