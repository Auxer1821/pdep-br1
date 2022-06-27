viveEnMansion(agatha).
viveEnMansion(mayordomo).
viveEnMansion(charles).

odia(agatha, Nombre):-
    viveEnMansion(Nombre),
    Nombre \= mayordomo.

odia(charles, Nombre) :-
    noLoOdia(Nombre,agatha).

odia(mayordomo,Nombre) :-
    odia(agatha,Nombre).

esMasRicoQue(agatha,Nombre):-
    noLoOdia(Nombre,mayordomo).

mata(Asesino,Muerto) :-
    odia(Asesino,Muerto),
    not(esMasRicoQue(Muerto,Asesino)).

noLoOdia(PrimerNombre,SegundoNombre):-
    viveEnMansion(PrimerNombre),
    viveEnMansion(SegundoNombre),
    not(odia(SegundoNombre,PrimerNombre)).
