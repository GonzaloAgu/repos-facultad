conectado(trelew, madryn).
conectado(trelew, gaiman).
conectado(gaiman, dolavon).
conectado(esquel, trevelin).

puedo_llegar(C1, C2) :-
    conectado(C1, C2).

%puedo_llegar(C1, C2) :-
 %   conectado(C2, C1).

puedo_llegar(C1, C2) :-
    puedo_llegar(C1, Ce),
    puedo_llegar(Ce, C2).
