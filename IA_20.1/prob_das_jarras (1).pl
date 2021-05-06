encher1((_,J2),(4,J2)).
encher2((J1,_),(J1,3)).
esvaziar1((_,J2),(0,J2)).
esvaziar2((J1,_),(J1,0)).
passar12((J1,J2),(J1a,J2a)):- J2a is J1+J2,J2a<3,J1a is J1-(3-J2),J1a>0;
                              J1-(3-J2)=<0,J2a is J1+J2,J1a is 0;
                              J2a is 3, J1a is J1-(3-J2),J1a>0.
passar21((J1,J2),(J1a,J2a)):- J1a is J1+J2,J1a<4,J2a is J2-(4-J1),J2a>0;
                              J2-(4-J1)=<0,J1a is J1+J2, J2a is 0;
                              J1a is 4,J2a is J2-(4-J1),J2a>0.

% Item (a)
objetivo(X):- X=(2,0);X=(2,1);X=(2,2);X=(2,3).

% Item (b)
acao((J1,J2),Acao,(J1a,J2a)):- Acao=encher1,encher1((J1,J2),(J1a,J2a));
                               Acao=encher2,encher2((J1,J2),(J1a,J2a));
                               Acao=esvaziar1,esvaziar1((J1,J2),(J1a,J2a));
                               Acao=esvaziar2,esvaziar2((J1,J2),(J1a,J2a));
                               Acao=passar12,passar12((J1,J2),(J1a,J2a));
                               Acao=passar21,passar21((J1,J2),(J1a,J2a)).

% Item (c)
vizinho((J1,J2),FilhosN):- findall((J1a,J2a),acao((J1,J2),_,(J1a,J2a)),L),sem_rep(L,K),pertence((J1,J2),K,FilhosN).
% Tirar estados que se repetem
sem_rep([],[]).
sem_rep([X|L],[X|L1]):- not(member(X,L)),sem_rep(L,L1),!.
sem_rep([_|L],L1):- sem_rep(L,L1),!.
% Tirar o estado (J1,J2)
pertence(X,[X|L],L).
pertence(X,[Z|Y],[Z|L]):- pertence(X,Y,L).


% Item (d),(e),(f)
% Consulta ?- busca_larg([(j1,j2)],[],X), onde (j1,j2) é o estado
% inicial e X a lista de passos
busca_larg([(J1,J2)|_],REP,X):- objetivo((J1,J2)),append(REP,[(J1,J2)],X),!.
busca_larg([(J1,J2)|L],REP,X):- not(member((J1,J2),REP)),vizinho((J1,J2),FilhosN),diferenca(FilhosN,REP,L1),append(L,L1,L2),
                              append(REP,[(J1,J2)],REP1),busca_larg(L2,REP1,X),!.
busca_larg([_|L],REP,X):- busca_larg(L,REP,X).

% Item (g)
% Consulta ?- busca_prof([(j1,j2)],[],X), Onde (j1,j2) é o estado
% inicial e X a lista de passos
busca_prof([(J1,J2)|_],REP,X):- objetivo((J1,J2)),append(REP,[(J1,J2)],X),!.
busca_prof([(J1,J2)|L],REP,X):- not(member((J1,J2),REP)),vizinho((J1,J2),FilhosN),diferenca(FilhosN,REP,L1),append(L1,L,L2),
                              append(REP,[(J1,J2)],REP1),busca_prof(L2,REP1,X),!.
busca_prof([_|L],REP,X):- busca_prof(L,REP,X).

% Regras auxiliares
pertence1(X,[X|_]).
pertence1(X,[_|Y]):- pertence1(X,Y).
diferenca([],_,[]).
diferenca(L,L1,[X|K]):- pertence(X,L,L2),not(pertence1(X,L1)),diferenca(L2,L1,K).
diferenca([X|K],L1,[]):- pertence(X,L1,M), diferenca(K,M,[]).
