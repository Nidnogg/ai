ultimo(X,[X],[]).
ultimo(X,[Y|L],[Y|P]):- ultimo(X,L,P).
reverso([],[]).
reverso([X],[X]).
reverso([X|Lista],[Y|L]):- ultimo(Y,[X|Lista],[X|P]),reverso([X|P],L).
palindromo(L):- reverso(L,L).
