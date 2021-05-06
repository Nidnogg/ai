listagem([X|Y],L):-
    X\=[],Y\=[],listagem(X,L1),listagem(Y,L2),concatena(L1,L2,L).
listagem([X|[]],L):- X\=[],listagem(X,L1),concatena(L1,[],L).
listagem([[]|Y],L):- listagem(Y,L2),concatena([],L2,L).
listagem([[]|[]],L):- concatena([],[],L).
listagem([X],L):- listagem(X,L).
listagem(X,[X]):- X\=[].
concatena([],L,L).
concatena([X|L1],L2,[X|L3]):- concatena(L1,L2,L3).
