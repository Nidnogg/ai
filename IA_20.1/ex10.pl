%Consulta
listaordenada([_]).
listaordenada([X|L]):- minlista(L,X),listaordenada(L).
%Consulta

minlista([],_).
minlista([X],X).
minlista([X|_],Y):- Y=<X.
