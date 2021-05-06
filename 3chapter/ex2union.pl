% exercicio 1

unite([], [], []).
unite([], L, [L]).
unite(L, [], [L]).
unite(List1,[],List1).
unite(List1, [Head2|Tail2], [Head2|Output]):-
    not(member(Head2,List1)), 
    unite(List1,Tail2,Output).
unite(List1, [Head2|Tail2], Output):-
    member(Head2,List1), 
    unite(List1,Tail2,Output). 

% exercicio 2

notInList([], [], []).
notInList([], L, L).
notInList(_, [], []).
notInList(L, [Head | L1], L2) :-
    member(Head, L),
	notInList(L, L1, L2).

notInList(L, [Head | L1], [Head| L2]) :-
    not(member(Head, L)),
    notInList(L, L1, L2).

	
    
    
    
    
    
    
    
    
