genera(2, [a, b, c]).
genera(3, [d, e, f]).
genera(4, [g, h, i]).
genera(5, [j, k, l]).
genera(6, [m, n, o]).
genera(7, [p, q, r, s]).
genera(8, [t, u, v]).
genera(9, [w, x, y, z]).


conversion([], []).

conversion([X|RestoX], [Y|RestoY]) :-
    genera(X, UnasLetras),
    member(Y, UnasLetras),
    conversion(RestoX, RestoY).