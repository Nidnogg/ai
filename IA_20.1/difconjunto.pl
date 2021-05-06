pertence(X,[X|L],L).
pertence(X,[Z|Y],[Z|L]):- pertence(X,Y,L).
pertence1(X,[X|_]).
pertence1(X,[_|Y]):- pertence1(X,Y).
diferenca([],_,[]).
diferenca(L,L1,[X|K]):-
    pertence(X,L,L2),not(pertence1(X,L1)),diferenca(L2,L1,K).
diferenca([X|K],L1,[]):- pertence(X,L1,M), diferenca(K,M,[]).
