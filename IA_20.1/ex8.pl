%Consulta ?- intersec(Conj1,Conj2,Conj1^Conj2)
intersec(L,L1,D):- sem_rep(L,K),sem_rep(L1,K1),intersec1(K,K1,D).
%Consulta

intersec1([],_,[]).
intersec1(L,L1,[X|K]):- pertence(X,L,L2),pertence1(X,L1),intersec1(L2,L1,K).
intersec1([X|K],L1,[]):- not(pertence1(X,L1)), intersec1(K,L1,[]).
pertence(X,[X|L],L).
pertence(X,[Z|Y],[Z|L]):- pertence(X,Y,L).
pertence1(X,[X|_]).
pertence1(X,[_|Y]):- pertence1(X,Y).
sem_rep([],[]).
sem_rep([X|L],[X|L1]):- not(pertence1(X,L)),sem_rep(L,L1),!.
sem_rep([_|L],L1):- sem_rep(L,L1),!.
