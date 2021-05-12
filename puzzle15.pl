% ----------------------------------------------------------------
% INTELIGÊNCIA ARTIFICIAL (2020/2) - PUZZLE 15
% ----------------------------------------------------------------
% ----------------------------------------------------------------
% HENRIQUE VERMELHO DE TOLEDO | PEDRO VITOR MARQUES NASCIMENTO
% DRE: 116076549              | DRE:116037448
% ----------------------------------------------------------------

%%% ----------------------------------------
%%%  COMO USAR
%%% ----------------------------------------

% teste(-A,-B)
teste((manhattan,C1,G1),(errados,C2,G2)):-
    busca_AStar(manhattan, C1, G1),
	busca_AStar(errados, C2, G2).

/*

(1) É preciso definir como fato pelo menos uma matriz quadrada. Exemplo:

matriz([[ 1,  2,  3,  4],
 		[ 5,  6,  x,  7],
 		[ 9, 10, 11,  8],
 		[13, 14, 15, 12]]).
        
(2) Depois disso basta chamar:

busca_AStar(errados, Caminho1, QuantGerados1)
busca_AStar(manhattan, Caminho2, QuantGerados2)

(3) Caminho1 e Caminho2 são as ações. QuantGerados é o n. de nós gerados.

*/

matriz([[ 2,  11,  6,  4],
 	  [ 1, 14,  3,  7],
 	  [ 5, 13, 10,  8],
 	  [ 9, 15, x, 12]]).
%%% ----------------------------------------
%%% OBJETIVO
%%% ----------------------------------------

objetivo(Matriz):-
    matriz_quantInversoes(Matriz, 0).

%%------------------------------------------
%% REGRAS
%%------------------------------------------

% regra(+Node, ++Tipo, -ProximoNode)
regra(Node, dirEsq, (Final, G2, _)):-
    Node = (Matriz, G, _),
    matriz_find(Matriz, x, (X,Y)),
    AlvoX is X+1,
    AlvoY is Y,
    matriz_trocaPeca(Matriz, (X,Y), (AlvoX, AlvoY), Final),
    G2 is G + 1.
regra(Node, esqDir, (Final, G2, _)):-
    Node = (Matriz, G, _),
    matriz_find(Matriz, x, (X,Y)),
    AlvoX is X-1,
    AlvoY is Y,
    matriz_trocaPeca(Matriz, (X,Y), (AlvoX, AlvoY), Final),
    G2 is G + 1.
regra(Node, cimaBaixo, (Final, G2, _)):-
    Node = (Matriz, G, _),
    matriz_find(Matriz, x, (X,Y)),
    AlvoX is X,
    AlvoY is Y-1,
    matriz_trocaPeca(Matriz, (X,Y), (AlvoX, AlvoY), Final),
    G2 is G + 1.
regra(Node, baixoCima, (Final, G2, _)):-
    Node = (Matriz, G, _),
    matriz_find(Matriz, x, (X,Y)),
    AlvoX is X,
    AlvoY is Y+1,
    matriz_trocaPeca(Matriz, (X,Y), (AlvoX, AlvoY), Final),
    G2 is G + 1.

% vizinhos(+Node, -Vizinhos)
vizinhos(Node, Vizinhos):-
    findall(Final, regra(Node, _, Final), Vizinhos).

%%% ----------------------------------------
%%%  ESTRUTURAS
%%% ----------------------------------------

% GUIA:
% -----------------------------------------
% Matriz ~ [[1,2],[3,4]]
% Node ~ (Matriz, G, H)
% Arvore ~ [(Matriz, AcaoIntermediaria, Matriz), ...]

% addNaArvore(+Arvore, +NodePai, +NodesFilhos, -ArvoreAtualizada)
addNaArvore(Arvore, _, [], Arvore).
addNaArvore(Arvore1, NodePai, [NodeFilho|T], [(NodePai, Acao, NodeFilho)|Arvore2]):-
    addNaArvore(Arvore1, NodePai, T, Arvore2),
    regra(NodePai, Acao, NodeFilho).

% addNoCaminho(+NodeAtual, +Caminho, +Arvore, -CaminhoAtualizado)
addNoCaminho(NodeAtual, CaminhoAntigo, Arvore, [(NodeAtual, Acao, Node)|CaminhoAntigo]):-
    CaminhoAntigo = [(Node, _, _)|_],
    member((NodeAtual, Acao, Node), Arvore), !.
addNoCaminho(_, Caminho, _, Caminho).

% filtraVizinhosNovos(+Vizinhos, +NodesGerados, -VizinhosNovos)
filtraVizinhosNovos([], _, []).
filtraVizinhosNovos([Vizinho|Proximos], Gerados, VizinhosNovos):-
    Vizinho = (Matriz, _, _),
    member((Matriz, _, _), Gerados), !,
    filtraVizinhosNovos(Proximos, Gerados, VizinhosNovos).
filtraVizinhosNovos([Vizinho|Proximos], Gerados, [Vizinho|VizinhosNovos]):-
    filtraVizinhosNovos(Proximos, Gerados, VizinhosNovos).


%%% ----------------------------------------
%%%  BUSCA A*
%%% ----------------------------------------


% busca_AStar(++Heuristica, -Acoes, -QuantidadeGerados)
busca_AStar(Heuristica, Acoes, QuantidadeGerados):-
    matriz(M),
    matriz_valida(M),
    heuristica(Heuristica, M, H),
    NodeInicial = (M, 0, H),
	busca(Heuristica, [NodeInicial], [], [], Caminho, QuantidadeGerados),
    extraiAcoes(Caminho, Acoes),
    !.
busca_AStar(_, _, _):-
    matriz(M),
    matriz_valida(M),
    print('Nenhum Caminho encontrado'), nl,
    !.
busca_AStar(_, _, _):-
    print('Matriz Fornecida eh invalida'), nl.

% busca(++Heuristica, +Fronteira, +Gerados, +Arvore, -Caminho)
busca(_, [Node|Resto], _, _, [(Node, fim, 0)], Gerados):- 
    Node = (Matriz, _, _),
    objetivo(Matriz), 
    length([Node|Resto], Gerados),
    !.
busca(Heuristica, [Node|Fronteira], Historico, Arvore1, CaminhoIterado, QuantGerados) :- 
    vizinhos(Node, Vizinhos), 
    filtraVizinhosNovos(Vizinhos, Historico, VizinhosNovos),
    avaliaLista(VizinhosNovos, Heuristica, VizinhosAvaliados),
    atualizaFronteira(VizinhosAvaliados, Fronteira, FronteiraAtualizada),
    addNaArvore(Arvore1, Node, VizinhosAvaliados, Arvore2),
    busca(Heuristica, FronteiraAtualizada, [Node|Historico], Arvore2, Caminho, Gerados),
    QuantGerados is Gerados + 1,
    addNoCaminho(Node, Caminho, Arvore2, CaminhoIterado).

% atualizaFronteira(+VizinhosNovos, +Fronteira, -FronteiraAtualizada)
atualizaFronteira([], Fronteira, Fronteira).
atualizaFronteira([Vizinho|Proximos], Fronteira, FronteiraAtualizada):-
    Vizinho = (Matriz, G, _),
    member((Matriz, G2, H), Fronteira),
    G2 > G,
    subtract(Fronteira, [(Matriz, G2, H)], NFronteira),
    adicionaNaFronteira(Vizinho, NFronteira, NFronteira2),
	atualizaFronteira(Proximos, NFronteira2, FronteiraAtualizada),
    !.
atualizaFronteira([Vizinho|Proximos], Fronteira, FronteiraAtualizada):-
    Vizinho = (Matriz, G, _),
    member((Matriz, G2, _), Fronteira),
    G2 =< G,
	atualizaFronteira(Proximos, Fronteira, FronteiraAtualizada), 
    !.
atualizaFronteira([Vizinho|Proximos], Fronteira, FronteiraAtualizada):-
    adicionaNaFronteira(Vizinho, Fronteira, Fronteira2),
	atualizaFronteira(Proximos, Fronteira2, FronteiraAtualizada).

% adicionaNaFronteira(+Elemento, +Fronteira, -FronteiraAtualizada).
adicionaNaFronteira(Elemento, [], [Elemento]).
adicionaNaFronteira(Elemento, [Primeiro|Fronteira], [Elemento, Primeiro|Fronteira]):-
    Elemento = (_, G1, H1),
    Primeiro = (_, G2, H2),
    G1 + H1 =< G2 + H2,
    !.
adicionaNaFronteira(Elemento, [Primeiro|Fronteira], [Primeiro|Fronteira2]):-
    adicionaNaFronteira(Elemento, Fronteira, Fronteira2).

% extraiAcoes(+NodesCaminho, -AcoesCaminho)
extraiAcoes([],[]).
extraiAcoes([(_, Acao ,_)|T], [Acao|Acoes]):-
    extraiAcoes(T, Acoes).
    

%%------------------------------------------
%% HEURISTICAS
%%------------------------------------------

% avaliaLista(+Vizinhos, ++Heuristica, -VizinhosAvaliados)
avaliaLista([], _, []).
avaliaLista([H|T], Heuristica, [(Matriz, G, F)|R]):-
    avaliaLista(T, Heuristica, R),
    H = (Matriz, G, _),
    heuristica(Heuristica, Matriz, F).
    
% heuristica(++Tipo, +Matriz, -Estimativa)
heuristica(manhattan, Matriz, Estimativa):-
    matriz_paraLista(Matriz, Lista),
    manhattanLista(Lista, Matriz, Estimativa).    
heuristica(errados, Matriz, Estimativa):-
    matriz_paraLista(Matriz, Lista),
    erradoLista(Lista, Matriz, Estimativa).

% distanciaManhattan (+Elemento, +Matriz, -Custo)
distanciaManhattan(x,_,0):-!.
distanciaManhattan(Elemento, Matriz, Custo):-
    matriz_find(Matriz, Elemento, (J, I)),
    coordenadasIdeais(Elemento, Matriz, (E_J, E_I)),
    Custo is abs(I-E_I) + abs(J-E_J).

% manhattanLista (+Lista, +Matriz, -Custo)
manhattanLista([], _, 0).
manhattanLista([Elemento|Proximos], Matriz, Custo):-
    manhattanLista(Proximos, Matriz, C1),
    distanciaManhattan(Elemento, Matriz, C2),
    Custo is C1 + C2.

% coordenadasIdeais(+Elemento, +Matriz, -Coordenadas)
coordenadasIdeais(Elemento, Matriz, (E_J, E_I)):-
    matriz_tamanho(Matriz, Tam, _),
    Value is Elemento - 1,
    E_J is mod(Value, Tam),
    E_I is (Value-E_J)/Tam.

% erradoLista (+Lista, +Matriz, -Custo)
erradoLista([], _, 0).
erradoLista([Elemento|Proximos], Matriz, Custo):-
    distanciaManhattan(Elemento, Matriz, Manhattan),
    Manhattan > 0, !,
    erradoLista(Proximos, Matriz, C1),
    Custo is C1 + 1.
erradoLista([_|Proximos], Matriz, Custo):-
    erradoLista(Proximos, Matriz, Custo).


%%------------------------------------------
%% MATRIZES
%%------------------------------------------

/*
EXEMPLO DEFINICAO:

matriz([[1, 2, 3], 
        [4, 5, 6], 
        [7, 8, x]]).
*/

% matriz_paraLista(+Matriz, -Lista)
matriz_paraLista([], []).
matriz_paraLista([H|T], ListaFinal):-
    matriz_paraLista(T, Lista),
    append(H, Lista, ListaFinal).

% matriz_deLista(+Lista, -Matriz)
matriz_deLista(Lista, _, []):-
    length(Lista, 0),
    !.
matriz_deLista(Lista, QuantColunas, [L1|R]):-
    lista_split(Lista, QuantColunas, L1, L2),
    matriz_deLista(L2, QuantColunas, R).

% matriz_tamanho(+Matriz, -Largura, +Altura)
matriz_tamanho(Matriz, Width, Height):-
    Matriz = [Linha|_],
    length(Linha, Width),
    length(Matriz, Height).

% matriz_getElemento(+Matriz, +Coordenadas, -Elemento)
matriz_getElemento(Matriz, (X, Y), Elemento):-
    nth0(Y, Matriz, Linha),
    nth0(X, Linha, Elemento).

% matriz_setElemento(+Matrizm, +Coordenadas, -MatrizAtualizada)
matriz_setElemento(Matriz, (X, Y), Elemento, MatrizFinal):-
    matriz_tamanho(Matriz, W, _),
	matriz_paraLista(Matriz, Lista),
	IndiceLinear is Y*W + X,
    lista_split(Lista, IndiceLinear, L1, [_|L2]),
    append(L1, [Elemento|L2], L3),
    matriz_deLista(L3, W, MatrizFinal).

% matriz_trocaPeca(+Matriz, +Coordenadas1, +Coordenadas2, -MatrizAtualizada)
matriz_trocaPeca(Matriz, (A,B), (C,D), MatrizFinal):-
    matriz_getElemento(Matriz, (A,B), E1),
    matriz_getElemento(Matriz, (C,D), E2),
    matriz_setElemento(Matriz, (A,B), E2, Matriz2),
    matriz_setElemento(Matriz2, (C,D), E1, MatrizFinal).

% matriz_find(+Matriz, +Elemento, -Coordenadas)
matriz_find(Matriz, Elemento, (X,Y)):-
    matriz_paraLista(Matriz, Lista),
    matriz_tamanho(Matriz, _, H),
    lista_find(Lista, Elemento, I),
    X is mod(I, H),
    Y is div(I - X, H).

% matriz_quantInversoes(+Matriz, -Quantidade)
matriz_quantInversoes(Matriz, Quantidade):-
    matriz_paraLista(Matriz, Lista),
    subtract(Lista, [x], Lista1),
    lista_quantInversoes(Lista1, Quantidade).

% matriz_valida(+Matriz)
matriz_valida(Matriz):-
    matriz_tamanho(Matriz, N, N),
    impar(N),
    matriz_quantInversoes(Matriz, Inversoes),
    not(impar(Inversoes)).
matriz_valida(Matriz):-
    matriz_tamanho(Matriz, N, N),
    not(impar(N)),
    matriz_find(Matriz, x, (_,I)),
    Row is N - I,
    not(impar(Row)),
    matriz_quantInversoes(Matriz, Inversoes),
    impar(Inversoes),!.
matriz_valida(Matriz):-
    matriz_tamanho(Matriz, N, N),
    not(impar(N)),
    matriz_find(Matriz, x, (_,I)),
    Row is N - I,
    impar(Row),
    matriz_quantInversoes(Matriz, Inversoes),
    not(impar(Inversoes)),!.

%%------------------------------------------
%% LISTAS
%%------------------------------------------

% lista_split(+Lista, +Indice, -Lista1, -Lista2)
lista_split(Lista, 0, [], Lista).
lista_split([H|T], IndiceCorte, [H|Lista1], Lista2):-
    Proximo is IndiceCorte - 1,
    lista_split(T, Proximo, Lista1, Lista2).

% lista_find(+Lista, +Elemento, -Indice)
lista_find([Elemento|_], Elemento, 0).
lista_find([_|T], Elemento, Indice):-
    lista_find(T, Elemento, I),
    Indice is I + 1.
    
% lista_quantInversoes(+Lista, -Quantidade)
lista_quantInversoes([_|[]], 0):- !.
lista_quantInversoes([Elemento|Sucessores], Quantidade):-
    lista_quantInversoes(Sucessores, Q1),
    somaMenores(Elemento, Sucessores, Q2),
    Quantidade is Q1 + Q2.

%%------------------------------------------
%% GERAL
%%------------------------------------------

% impar(+Numero)
impar(X):- 
    1 is mod(X, 2).

% somaMenores(+Elemento, +Lista, -Soma)
somaMenores(_, [], 0).
somaMenores(Elemento, [H|T], Quant):-
    somaMenores(Elemento, T, I),
    H < Elemento,
    Quant is I + 1.
somaMenores(Elemento, [H|T], I):-
    somaMenores(Elemento, T, I),
    H >= Elemento.

