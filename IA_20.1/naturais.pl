natural(0).
natural(s(X)):- natural(X).

menor_igual(0,0).
menor_igual(0,s(Y)):- natural(Y).
menor_igual(s(X),s(Y)):- natural(X),natural(Y),menor_igual(X,Y).

soma(0,0,0).
soma(s(X),Y,Z):- natural(X),Z=s(K),soma(X,Y,K).
soma(0,s(Y),Z):- natural(Y), Z=s(K),soma(0,Y,K).

multiplica(0,Y,0):- natural(Y),!.
multiplica(X,0,0):- natural(X),!.
multiplica(X,Y,Z):- natural(X),natural(Y),multi(X,Y,0,Z).
multi(0,_,Z,Z).
multi(s(X),Y,Mul,Z):- soma(Y,Mul,K),multi(X,Y,K,Z).

minimo(N1,N2,Min):- menor_igual(N1,N2),Min=N1,!.
minimo(N1,N2,Min):- natural(N1),natural(N2),Min=N2.
