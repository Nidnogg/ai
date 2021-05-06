%Consulta ?- fibo(N,N-esimoTermo).
fibo(N,F):- N=0,F=0;N=1,F=1.
fibo(N,F):- N>1,N1 is N-1,auxiliar(0,1,N1,F).
%Consulta

auxiliar(X,Y,1,F):- F is X+Y,!.
auxiliar(X,Y,K,F):- K1 is X+Y, N is K-1, auxiliar(Y,K1,N,F).
