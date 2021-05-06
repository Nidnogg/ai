dividelista(L,L1,L2):- particao(L1,L2,L).
pertence(X,[X|Y],Y).
pertence(X,[Z|Y],[Z|K]):- pertence(X,Y,K).
particao([X],[],[X]).
particao([],[X],[X]).
particao([],[],[]).
particao([X|L1],[Y|L2],L):-
    pertence(X,L,K1),pertence(Y,K1,K2), particao(L1,L2,K2).

