parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pam,ann). %Adicionei para ann e pat serem irmãos
parent(pam,pat). %Adicionei para ann e pat serem irmãos
parent(pat,jim).
female(pam).
female(liz).
female(ann).
female(pat).
male(tom).
male(bob).
male(jim).
father(X,Y) :- male(X), parent(X,Y).
mother(X,Y) :- female(X), parent(X,Y).

irmaos(X,Y) :- father(F,X),mother(M,X),father(F,Y),mother(M,Y),X\=Y.