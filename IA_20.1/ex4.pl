%Consulta ?- insere(Elemento,ListaOrdenada,ListaOrdenadaComELemento).
insere(X,[],[X]):- !.
insere(X,[Y|Lista],[Y|L]):- X>Y,insere(X,Lista,L),!.
insere(X,Lista,[X|Lista]).
