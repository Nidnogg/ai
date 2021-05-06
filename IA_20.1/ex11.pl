unificavel([],_,[]).
unificavel([X|L],T,L1):- not(X=T),unificavel(L,T,L1),!.
unificavel([X|L],T,[X|L1]):- unificavel(L,T,L1).
