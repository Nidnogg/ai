
% Exercicio 1
addToOrdered([], X, [X]).
addToOrdered([X| Tail] , X, [X|Tail]).

addToOrdered([Head | Tail] , X, [X,Head|Tail]):-
    Head > X.

addToOrdered([Head | Tail], X, [Head|X1]) :-
    Head < X,
    addToOrdered(Tail, X, X1).
    

% Exercicio 2
multiple4(Max, Result):-
    countUp(Max, 4, Result).

countUp(Max, X2, []):-
    X2 > Max.

countUp(Max, Curr, [Curr | Result]):-
    Curr < Max,
    Next is Curr + 4,
    countUp(Max, Next, Result).