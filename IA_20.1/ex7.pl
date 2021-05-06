%Consulta ?- uniao(Conj1,Conj2,Conj1UConj2)
uniao(L,L1,U):- sem_rep(L,K),sem_rep(L1,K1),uniao1(K,K1,U).

uniao1([],[],[]).
uniao1(L,L1,[X|K]):- pertence(X,L,L2),pertence(X,L1,L3),uniao1(L2,L3,K).
uniao1(L,L1,[X|K]):- pertence(X,L,L2),not(pertence1(X,L1)),uniao1(L2,L1,K).
uniao1(L,L1,[X|K]):- pertence(X,L1,L3),not(pertence1(X,L)),uniao1(L,L3,K).
pertence(X,[X|L],L).
pertence(X,[Z|Y],[Z|L]):- pertence(X,Y,L).
pertence1(X,[X|_]).
pertence1(X,[_|Y]):- pertence1(X,Y).
sem_rep([],[]).
sem_rep([X|L],[X|L1]):- not(pertence1(X,L)),sem_rep(L,L1),!.
sem_rep([_|L],L1):- sem_rep(L,L1),!.
