% -- FACTORIAL
factorial(0, 1) :- !.
factorial(N, M) :-
    N > 0,
    N1 is N - 1,    
    factorial(N1, X),   % X = (N - 1)!
    M is N * X.         % M = N * (N - 1)!

% -- SUMA DE PARES
suma_pares(L, 0) :-
    length(L, 0).
suma_pares(L, 0) :-
    length(L, 1).

suma_pares([_X1|[X2|Nums]], Res) :-
    suma_pares(Nums, ResTemp),
    Res is X2 + ResTemp.

% CONSIGNA
generar_pass([N1|Numero], [C1,C2,C3]) :-
    factorial(N1, C1),
    length(Numero, Len1),
    C2 is Len1 + 1,
    suma_pares([N1|Numero], SumaPares),
    C3 is SumaPares.
