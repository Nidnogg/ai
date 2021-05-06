conc([], L, L).
conc([X|L1], L2, [X|L3]) :- conc(L1, L2, L3).

%3.1
del(L, L1) :- conc(L1, [_,_,_], L).


%3.2
del2(L,L1) :- 
  conc(L1, [_,_,_], L2).
  conc([_,_,_], L2, L).


%3.3
evenLength([]).
evenLength([L | [L1 | Tail]]) :-
  evenLength(Tail).

oddLength([_]).
oddLength([_ | [L1 | Tail]]) :- oddLength([_]).

%3.4
conc([], L, L).
conc([X|L1], L2, [X|L3]) :- conc(L1, L2, L3).

reverse([],[]).
reverse([A | B], L) :- reverse(B,R), conc(R,[A],L).

%3.5
palindrome([],[]).
palindrome(List) :- reverse(List, List).

%3.6
shift([X|L1],L2) :- conc(L1, [X], L2).

  
%3.7
means(0, zero).
means(1, one).
means(2, two).
means(3, three).
means(4, four).
means(5, five).
means(6, six).
means(7, seven).
means(8, eight).
means(9, nine).

translate([],[]).
translate([Letter | Tail], [Number|R]) :- 
  means(Letter,Number), translate(Tail,R).