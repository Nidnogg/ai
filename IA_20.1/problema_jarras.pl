%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Problema das Jarras %%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
/* 
 Exemplo de Execução do codigo:
 			search([(0,0)],L,[(0,0)]) 
*/


/*
 Letra A
 Função Objetivo que seria o 2 que queremos alcançar 
 Jarra 1 com capacidade de 4l
*/
objetivo((2,_)).

/*
 Letra B
 Ações possiveis durante o problema
*/
acao((J1,J2),encher1,(J1a,J2)):- J1>=0,
    J1 < 4, 
    J1a is 4.

acao((J1,J2),encher2,(J1,J2a)):- J2>=0,
    J2<3,
    J2a is 3.

acao((J1,J2),esvaziar1,(J1a,J2)):- J1>0,
    J1a is 0.

acao((J1,J2),esvaziar2,(J1, J2a)):- J2>0,
    J2a is 0.

acao((J1,J2),passar12,(J1a,J2a)):- J1>0,
    J2 < 3, 
    J1 =< (3 - J2), 
    J1a is 0, 
    J2a is J2+J1.

acao((J1,J2),passar12,(J1a,J2a)):- J1>0,
    J2 < 3, 
    J1 > (3 - J2), 
    J1a is J1 - (3 - J2), 
    J2a is 3.

acao((J1,J2),passar21,(J1a,J2a)):- J2>0,
    J1 < 4, 
    J2 =< (4 - J1), 
    J2a is 0, 
    J1a is J2+J1.

acao((J1,J2),passar21,(J1a,J2a)):- J2>0,
    J1 < 4, 
    J2 > (4 - J1), 
    J2a is J2 - (4 - J1), 
    J1a is 4.

/*
 Letra C 
 Função que encontra todos vertices vizinhos a partir 
 de um par de estados inicial 
*/
vizinho(N,FilhosN):- findall(L,acao(N,_,L),FilhosN).

% Letra D
% Função que Concatena elementos na lista
conc([],L,L).

conc([X|L1], L2, [X|L3]) :-
    conc(L1,L2,L3).

% Adiciona elementos a fronteira
add_to_frontier(NN, F1, F2) :- 
   conc(F1 , NN, F2). % Fila - Busca em largura.
   %conc(NN, F1, F2).  % Pilha - Busca em Profundidade. - > Letra G
% Para fazer a letra G, seria só comentar a linha 77 e descomentar a linha 78 (ou seja, essa alteração deveria ser feita nas duas linhas acima)



/* 
 Até aqui seria a letra D e quando deichamos a função search como esta a baixo
 O que acontece aqui é que fica retornando True
 Isso ocorre pois ele não está armazenando os nós em nenhuma lista,
 ou seja, ele sempre que encontra uma nova solução ele retorna true como resposta
 como se ele tivesse falando que tem resposta, mas sem informar qual
 */

/*search([Node |_]) :- objetivo(Node).
  search([Node | F1]) :- vizinho(Node, NN),
  add_to_frontier(NN, F1, F2),
  search(F2).*/

/*
 Letra E e F 
 Dessa forma a partir do seguinte temos as duas seguintes letras
 Sendo que a letra E seria sem essa funcao naoContem e 
 a letra F seria com ela, para que assim eliminassemos elementos repetidos 
 */ 

% Dadas duas listas L1 e L2, retorne a lista L3 que 
% contém todos os elementos de L1 que não estão em L2.
naoContem([],_,[]).

naoContem([X|Y], L2, [X| Y1]) :-
    not(member(X, L2)),
    naoContem(Y, L2, Y1).

% Caso quando L2 contém algum elemento X 
naoContem([X|Y], L2, Y1) :-
    member(X, L2),
    naoContem(Y, L2, Y1).

% Função Principal do Problema
search([Node|_],[Node],_) :- objetivo(Node).
search([Node|F1],F3,LN) :- vizinho(Node, L1), % LN é a lista de node ja descobertos.
    naoContem(L1,LN,L2), % Para responder a f), verifico se os vizinhos do Node já foram descobertos.
    conc(LN,L2,LN2),  % Concateno em LN2 todos os vizinhos decobertos até aqui.
    add_to_frontier(L2, F1, F2), % Add L2, que são todos os novos vizinhos descortos. 
    search(F2,R,LN2), % R é o return dos estados do Node
    conc([Node],R,F3). % Insiro todos os estados do node em F3.