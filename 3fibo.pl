fibo(1,0).
fibo(2,1).
fibo(X,N) :- X>2, X1 is X-1, X2 is X-2, fibo(X1,S1), fibo(X2,S2), N is S1 + S2.