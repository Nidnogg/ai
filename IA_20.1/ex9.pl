%Consulta ?- sem_rep(Lista,ListaSemRepeticao).
sem_rep([],[]).
sem_rep([X|L],[X|L1]):- not(pertence(X,L)),sem_rep(L,L1),!.
sem_rep([_|L],L1):- sem_rep(L,L1),!.
%Consulta

pertence(X,[X|_]).
pertence(X,[_|Y]):- pertence(X,Y).
