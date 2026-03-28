primario(rojo).
primario(azul).
primario(verde).

formado_por(amarillo, azul, verde).
formado_por(morado, azul, rojo).
formado_por(naranja, amarillo, rojo).

secundario(Color) :-
    formado_por(Color, _, _).

complementario(C1, C2) :-
    formado_por(C1, CP1, CP2),
    primario(CP1),
    primario(CP2),
    primario(C2),
    C2 \= CP1,
    C2 \= CP2.

