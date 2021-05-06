concatena([],L,L).
concatena([X|L1],L2,[X|L3]):- concatena(L1,L2,L3).
l_tres(L,L1):- concatena(L1,[A,B,C],L).
tres_l_tres([X,Y,Z|L],L2):- concatena(L2,[A,B,C],L).
