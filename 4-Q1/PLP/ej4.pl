:- use_module(library(clpfd)).

result(A1, A2, A3, B1, B3, C1, C2, C3) :-
    [A1, A2, A3, B1, B3, C1, C2, C3] ins 0..9,
    
    A1 * A2 * A3 #= 6,
    (B1 * 5) - B3  #= 1,
    (C1 - C2) * C3 #= 4,
    (A1 - B1) * C1 #= 7,
    A2 + 5 #= C2,          % reescrita sin división
    (A3 + B3) - C3 #= 7,
    s
    label([A1, A2, A3, B1, B3, C1, C2, C3]).