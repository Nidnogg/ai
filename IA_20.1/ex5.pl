%Consulta ?- uni_ord(Conj1_ordenado,Conj2_ordenado,Conj1UConj2_ordenado)
uni_ord(L,L1,U):- sem_rep(L,K),sem_rep(L1,K1),uniord(K,K1,U).

uniord([],L,L):- !.
uniord(L,[],L):- !.
uniord([X|L],[X|L1],[X|U]):- uniord(L,L1,U).
uniord([X|L],[Y|L1],[X|U]):- X<Y,uniord(L,[Y|L1],U).
uniord([X|L],[Y|L1],[Y|U]):- X>Y,uniord([X|L],L1,U).
pertence(X,[X|L],L).
pertence(X,[Z|Y],[Z|L]):- pertence(X,Y,L).
pertence1(X,[X|_]).
pertence1(X,[_|Y]):- pertence1(X,Y).
sem_rep([],[]).
sem_rep([X|L],[X|L1]):- not(pertence1(X,L)),sem_rep(L,L1),!.
sem_rep([_|L],L1):- sem_rep(L,L1),!.
