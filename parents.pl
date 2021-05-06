parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female(ann).
female(liz).
female(pat).
female(pam).

male(tom).
male(bob).
male(jim).

father(X,Y) :- male(X),parent(X, Y).
mother(X,Y) :- female(X),female(X, Y).
#father(tom, bob).
#father(tom, liz).
#father(bob, ann).
#father(bob, pat).

#mother(pam, bob).
#mother(pat, jim).