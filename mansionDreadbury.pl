viveEnMansion(agatha).
viveEnMansion(mayordomo).
viveEnMansion(charles).

odia(agatha, Odiado):-
    viveEnMansion(Odiado),
    Odiado \= mayordomo.

odia(charles, Odiado) :-
    noLoOdia(Odiado,agatha).

odia(mayordomo,Odiado) :-
    odia(agatha,Odiado).

esMasRicoQue(agatha,Nombre):-
    noLoOdia(Nombre,mayordomo).

mata(Asesino,Muerto) :-
    odia(Asesino,Muerto),
    not(esMasRicoQue(Muerto,Asesino)).

noLoOdia(NoOdiado,Odiador):-
    viveEnMansion(NoOdiado),
    viveEnMansion(Odiador),
    not(odia(Odiador,NoOdiado)).

% 1 ?- mata(Asesino,agatha).
% Asesino = agatha ;
% false.

% 2 ?- odia(_,milhouse).
% false.

% 3 ?- odia(agatha,Persona).
% Persona = agatha ;
% Persona = charles.

% 4 ?- odia(Odiador,Odiado).  
% Odiador = Odiado, Odiado = agatha ;
% Odiador = agatha,
% Odiado = charles ;
% Odiador = charles,
% Odiado = mayordomo ;
% Odiador = mayordomo,
% Odiado = agatha ;
% Odiador = mayordomo,
% Odiado = charles.

% 5 ?- odia(mayordomo,_).      
% true .