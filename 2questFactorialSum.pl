
sum(0,0).
sum(N,S) :-
   N > 0,
   N1 is N - 1,
   sum(N1, F1),
   S is N + F1.

factorial(0,1). 
factorial(N,S) :-
   N>0,
   N1 is N-1,
   factorial(N1,F1),
   S is N * F1.


