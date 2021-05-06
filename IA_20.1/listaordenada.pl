listaordenada([_]).
listaordenada([X|L]):- minlista(L,X),listaordenada(L).
minlista([],_).
minlista([X],X).
minlista([X|_],Y):- Y=<X.
