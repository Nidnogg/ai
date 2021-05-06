Prolog-Bratko-cap3a - pág. 71: 3.1, 3.2, pág. 76: 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 3.11
Prolog-Bratko-cap3b - pág. 90: 3.16, 3.17, 3.18, 3.19, 3.20, 3.21



3.1)
a) delthree(L,L1) :- conc(L1, [_,_,_], L)
b) delfirstlastthree(L,L2) :- conc(L1, [_,_,_], L), conc([_,_,_], L2, L1).

3.2)
a)
last1(Item, List) :- conc([_], [Item], List).
last1(Item, List) :- conc([_], L1, List), last1(Item, L1).
b)
last2(Item, List) :- [_|[Item]] = List.
last2(Item, List) :- [_|L1] = List, last2(Item, L1).


3.3)
evenlength([]).
oddlength([_]).
evenlength([X|Y]) :- oddlength(Y).
oddlength([X|Y]) :- evenlength(Y).

3.4)
reverse1([],[]).
reverse1([X|L1], ReversedList) :- reverse1(L1, R1), conc(R1, [X], ReversedList).

3.5)
palindrome(List) :- reverse1(List,List).

3.6)
shift1([X|L1],L2) :- conc(L1, [X], L2).

3.7)
translate([],[]).
translate([X|L1],[T2|T1]) :- translate(L1,T1), means(X,T2).

3.8)
subset(_,[]).
subset(Super,[X|Sub]) :- subset(Super,Sub), member(X,Super).


3.16)
max(X,Y,Max) :- X >= Y, Max=X.
max(X,Y,Max) :- X < Y, Max=Y.


3.17)
maxlist([H|[T]],Max) :- max(H,T,Max).
maxlist([H|T],Max) :- maxlist(T,M1), max(H,M1,Max).

3.18)
sumlist([H|[T]],Sum) :- Sum is H + T.
sumlist([H|T],Sum) :- sumlist(T,S1), Sum is S1 + H.

3.19)
ordered([]).
ordered([X]).
ordered([H|T]) :- [T1|T2] = T, H =< T1, ordered(T).


henriquegayhenriquegayhenriquegayhenriquegayhenriquegayhenriquegayhenriquegayhenriquegay