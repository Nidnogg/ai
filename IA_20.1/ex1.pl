%Consulta ?- int_entre(Lista,A,B,ListaDeElementosEntreAeB).
int_entre([X|Li],A,B,[X|Lf]):- X>=A,X=<B,int_entre(Li,A,B,Lf),!.
int_entre([_|Li],A,B,Lf):- int_entre(Li,A,B,Lf).
int_entre([],_,_,[]).
