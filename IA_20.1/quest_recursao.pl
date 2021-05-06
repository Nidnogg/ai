soma(0,0).
soma(X,S):- X>0,K is X-1,somar(K,X,S).
somar(0,S,S):- !.
somar(X,Y,S):- K is X-1,K1 is X+Y, somar(K,K1,S).

fatorial(X,F):- X>1,K is X-1,fat(K,X,F).
fatorial(X,1):- X=1; X=0.
fat(1,F,F):- !.
fat(X,Y,F):- K is X-1, K1 is X*Y, fat(K,K1,F).

fibo(X,F):- X=1,F=0;X=2,F=1.
fibo(X,F):- X>2,N is X-1,K is 1,fibonacci(0,K,N,F).
fibonacci(X,Y,2,F):- F is X+Y,!.
fibonacci(X,Y,K,F):- K1 is X+Y, N is K-1, fibonacci(Y,K1,N,F).
