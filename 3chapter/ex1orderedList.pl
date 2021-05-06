addToOrdered([], X, [X]).
addToOrdered([X| Tail] , X, [X|Tail]).

%addToOrdered([5,6], 3, X).
addToOrdered([Head | Tail] , X, [X,Head|Tail]):-
    Head > X.

%addToOrdered([2,4], 3, X).
% H = 2
% V = 3
% T = [4]
% 2 < 3
addToOrdered([Head | Tail], X, [Head|X1]) :-
    Head < X,
    %addToOrdered([4], 3, T1). -> output is [3, 4]
    addToOrdered(Tail, X, X1).
    



multiple4(Max, Result):-
    subida(Max, 4, Result).

subida(Max, X2, []):-
    X2 > Max.

subida(Max, Curr, [Curr | Result]):-
    Curr < Max,
    Next is Curr + 4,
    subida(Max, Next, Result).