% Recursos basicos
recurso_basico(hierro).
recurso_basico(cobre).
recurso_basico(carbon).
recurso_basico(arena).
recurso_basico(petroleo).

% Nivel 1
receta(lingote_hierro, [hierro, carbon]).
receta(lingote_cobre, [cobre, carbon]).
receta(vidrio, [arena, arena]).
receta(plastico, [petroleo, petroleo]).

% Nivel 2
receta(engranaje, [lingote_hierro, lingote_hierro]).
receta(cable, [lingote_cobre]).
receta(cinta_mecanica, [engranaje, lingote_hierro]).

% Nivel 3
receta(circuito_basico, [cable, cable, cable, plastico]).
receta(motor, [engranaje, engranaje, engranaje, engranaje, lingote_hierro, lingote_hierro, cable, cable, cable, cable, cable]).

% Nivel 4
receta(circuito_avanzado, [circuito_basico, circuito_basico, cable, cable, cable, cable, plastico, plastico]).
receta(brazo_robotico, [motor, circuito_basico, engranaje, engranaje]).
receta(panel_solar, [circuito_basico, circuito_basico, vidrio, vidrio, vidrio, vidrio, vidrio, cable, cable, cable, cable]).
receta(ensambladora, [circuito_avanzado, circuito_avanzado, engranaje, engranaje, engranaje, engranaje, engranaje, lingote_hierro, lingote_hierro, lingote_hierro, lingote_hierro, lingote_hierro, lingote_hierro, lingote_hierro, lingote_hierro, lingote_hierro, lingote_hierro]).