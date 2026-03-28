pertenece(Elemento, [Elemento|_]).
pertenece(Elemento, [_|Resto]) :-
    pertenece(Elemento, Resto).


% sin append
% agregar_al_frente(Li, Elemento, [Elemento|L]).


