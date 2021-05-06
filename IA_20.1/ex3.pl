%Consulta ?- mult_ate_X(X, ListaComMultiplos).
mult_ate_X(X,[0|L]):- X>0, auxiliar(X,3,L).
mult_ate_X(0,[0]).
%Consulta

auxiliar(X,Mult,[Mult|L]):- Mult=<X, Prox is Mult+3, auxiliar(X,Prox,L).
auxiliar(X,Mult,[]):- Mult > X.
