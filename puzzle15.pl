% ----------------------------------------------------------------
% INTELIGÊNCIA ARTIFICIAL (2020/2) - PUZZLE 15
% ----------------------------------------------------------------
% ----------------------------------------------------------------
% HENRIQUE VERMELHO DE TOLEDO | PEDRO VITOR MARQUES NASCIMENTO
% DRE: 116076549              | DRE:116037448
% ----------------------------------------------------------------


% -----------------------------------
% Parte I - Representação do Mapa
% -----------------------------------
/* Como usar: o espaço em branco é representado pelo número 999

EXEMPLO 1: Caso simples
------------------------
matriz([[ 1,  2,    3,  4],
 		[ 5,  6,  999,  7],
 		[ 9, 10,   11,  8],
 		[13, 14,   15, 12]]).

EXEMPLO 2: Caso pedido
------------------------
matriz([[15,  2,  1, 12],
 		[ 8,  5,  6, 11],
 		[ 4,  9, 10,  7],
 		[ 3, 14, 13,  999]]).

*/

matriz([[15,  2,  1, 12],
 		[ 8,  5,  6, 11],
 		[ 4,  9, 10,  7],
 		[ 3, 14, 13,  999]]).

% -----------------------------------
% Parte II - Calculando Objetivo
% -----------------------------------
% Uma matriz que não precise de Inversões
% -----------------------------------

objetivo(Matriz):-
    quantInversoesMatriz(Matriz, 0).


% -----------------------------------
% Parte III - Mapa é Valido
% -----------------------------------

matrizValida(Matriz):-
    tamanhoMatriz(Matriz, N, N),
    impar(N),
    quantInversoesMatriz(Matriz, Inversoes),
    not(impar(Inversoes)).

matrizValida(Matriz):-
    tamanhoMatriz(Matriz, N, N),
    not(impar(N)),
    achaZeroMatriz(Matriz, I, _),
    not(impar(N - I)),
    quantInversoesMatriz(Matriz, Inversoes),
    impar(Inversoes).

matrizValida(Matriz):-
    tamanhoMatriz(Matriz, N, N),
    not(impar(N)),
    achaZeroMatriz(Matriz, I, _),
    impar(N-I),
    quantInversoesMatriz(Matriz, Inversoes),
    not(impar(Inversoes)).

% -----------------------------------
% Parte IV - Funções Auxiliares
% -----------------------------------
% Funções utilizadas para manusear a matriz
% -----------------------------------

cortaLista(Lista, 0, [], Lista).
cortaLista(Lista, N, Lista, []):-
    tamanhoLista(lista, N).
cortaLista([H|T], IndiceCorte, [H|Lista1], Lista2):-
    Proximo is IndiceCorte - 1,
    cortaLista(T, Proximo, Lista1, Lista2).

% tamanhoLista: permite descobrir o tamanho de uma lista
tamanhoLista([], 0):-
    !.
tamanhoLista([_|T], TamanhoNovo):-
    tamanhoLista(T, Tamanho),
    TamanhoNovo is Tamanho + 1.

% tamanhoMatriz: permite descobrir o tamanho de uma matriz
tamanhoMatriz(Matriz, Altura, Largura):-
    tamanhoLista(Matriz, Altura),
    Matriz = [Linha|_],
    tamanhoLista(Linha, Largura).

% impar
impar(X):- 
    1 is mod(X, 2).

% elementoLista
elementoLista(0, [H|_], H):-
    !.
elementoLista(I, [_|T], Element):-
    Next is I-1,
    elementoLista(Next, T, Element).

% elementoMatriz
elementoMatriz(IndiceLinha, IndiceColuna, Matriz, Element):-
    elementoLista(IndiceLinha, Matriz, Linha),
    elementoLista(IndiceColuna, Linha, Element).

% achaZeroLista
achaZeroLista([999|_], 0):-!.
achaZeroLista([_|T], Index):-
    achaZeroLista(T, IndexAnterior),
    Index is IndexAnterior + 1.

% achaZeroMatriz
achaZeroMatriz(Matriz, 0, J):-
    elementoLista(0, Matriz, Linha),
    achaZeroLista(Linha, J).
achaZeroMatriz(Matriz, 1, J):-
    elementoLista(1, Matriz, Linha),
    achaZeroLista(Linha, J).
achaZeroMatriz(Matriz, 2, J):-
    elementoLista(2, Matriz, Linha),
    achaZeroLista(Linha, J).
achaZeroMatriz(Matriz, 3, J):-
    elementoLista(3, Matriz, Linha),
    achaZeroLista(Linha, J).

% matrizComoLista
matrizComoLista([], []).
matrizComoLista([H|T], ListaFinal):-
    matrizComoLista(T, Lista),
    append(H, Lista, ListaFinal).

% listaComoLista
listaComoMatriz(Lista, _, []):-
    tamanhoLista(Lista, 0),
    !.
listaComoMatriz(Lista, QuantColunas, [L1|R]):-
    cortaLista(Lista, QuantColunas, L1, L2),
    listaComoMatriz(L2, QuantColunas, R).

% somaSeMaior
somaSeMaior(A, B, Entrada, Saida):-
    A > B,
    Saida is Entrada + 1,
    !.
somaSeMaior(_, _, Entrada, Entrada).

% quantInversoesLista
quantInversoesLista([_|[]], [], 0):-
    !.
quantInversoesLista([_|Resto], [], Quant):-
    Resto = [_|T],
    quantInversoesLista(Resto, T, Quant),
    !.
quantInversoesLista([Elemento|Resto], [Proximo1|ProximoOutros], QuantidadeTotal):-
    % quantInversoesLista([1 | [2,3,4]], [3|[4]], Quant)
    quantInversoesLista([Elemento|Resto], ProximoOutros, Quantidade),
    somaSeMaior(Elemento, Proximo1, Quantidade, QuantidadeTotal).

% quantInversoesMatriz
quantInversoesMatriz(Matriz, Quantidade):-
    matrizComoLista(Matriz, [Primeiro | Resto]),
    quantInversoesLista([Primeiro | Resto], Resto, Quantidade).

% substituiElemento
substituiElemento(Lista, Indice, Elemento, ListaSaida):-
    cortaLista(Lista, Indice, L1, [_|L2]),
    append(L1,[Elemento|L2], ListaSaida).

% -----------------------------------
% Regras
% -----------------------------------

regra(Heuristica, (_,Matriz, G, _), esqDir, (esqDir, Saida, G_Final, H_Final)):-
    tamanhoMatriz(Matriz, N, N),
    achaZeroMatriz(Matriz, Zero_I, Zero_J),
    Alvo_J is Zero_J - 1,
    Alvo_J >= 0,
    elementoMatriz(Zero_I, Alvo_J, Matriz, Alvo),
    matrizComoLista(Matriz, Lista),
    AlvoIndice is Zero_I * N + Alvo_J,
    ZeroIndice is Zero_I * N + Zero_J,
    substituiElemento(Lista, AlvoIndice, 999, Lista2),
    substituiElemento(Lista2, ZeroIndice, Alvo, Lista3),
    listaComoMatriz(Lista3, N, Saida),
    heuristica(Heuristica, Saida, H_Final),
    G_Final is G + 1.

regra(Heuristica, (_,Matriz, G, _), dirEsq, (dirEsq, Saida, G_Final, H_Final)):-
    tamanhoMatriz(Matriz, N, N),
    achaZeroMatriz(Matriz, Zero_I, Zero_J),
    Alvo_J is Zero_J + 1,
    Alvo_J >= 0,
    elementoMatriz(Zero_I, Alvo_J, Matriz, Alvo),
    matrizComoLista(Matriz, Lista),
    AlvoIndice is Zero_I*N + Alvo_J,
    ZeroIndice is Zero_I*N + Zero_J,
    substituiElemento(Lista, AlvoIndice, 999, Lista2),
    substituiElemento(Lista2, ZeroIndice, Alvo, Lista3),
    listaComoMatriz(Lista3, N, Saida),
    heuristica(Heuristica, Saida, H_Final),
    G_Final is G + 1.

regra(Heuristica, (_,Matriz, G, _), cimaBaixo, (cimaBaixo, Saida, G_Final, H_Final)):-
    tamanhoMatriz(Matriz, N, N),
    achaZeroMatriz(Matriz, Zero_I, Zero_J),
    Alvo_I is Zero_I - 1,
    Alvo_I < N,
    elementoMatriz(Alvo_I, Zero_J, Matriz, Alvo),
    matrizComoLista(Matriz, Lista),
    AlvoIndice is Alvo_I*N + Zero_J,
    ZeroIndice is Zero_I*N + Zero_J,
    substituiElemento(Lista, AlvoIndice, 999, Lista2),
    substituiElemento(Lista2, ZeroIndice, Alvo, Lista3),
    listaComoMatriz(Lista3, N, Saida),
    heuristica(Heuristica, Saida, H_Final),
    G_Final is G + 1.

regra(Heuristica, (_,Matriz, G, _), baixoCima, (baixoCima, Saida, G_Final, H_Final)):-
    tamanhoMatriz(Matriz, N, N),
    achaZeroMatriz(Matriz, Zero_I, Zero_J),
    Alvo_I is Zero_I + 1,
    Alvo_I < N,
    elementoMatriz(Alvo_I, Zero_J, Matriz, Alvo),
    matrizComoLista(Matriz, Lista),
    AlvoIndice is Alvo_I*N + Zero_J,
    ZeroIndice is Zero_I*N + Zero_J,
    substituiElemento(Lista, AlvoIndice, 999, Lista2),
    substituiElemento(Lista2, ZeroIndice, Alvo, Lista3),
    listaComoMatriz(Lista3, N, Saida),
    heuristica(Heuristica, Saida, H_Final),
    G_Final is G + 1.

% -----------------------------------
% Heurísticas
% -----------------------------------

heuristica(foraDoLugar, Matriz, Valor):-
    tamanhoMatriz(Matriz, N, N),
    Indice is N*N - 1,
    foraDoLugarTotal(Matriz, Indice, Valor).

heuristica(manhattan, Matriz, Valor):-
    tamanhoMatriz(Matriz, N, N),
    Indice is N*N - 1,
    distanciaManhattanTotal(Matriz, Indice, Valor).

foraDoLugarTotal(Matriz, 0, Custo):-
    elementoMatriz(0, 0, Matriz, Elemento),
    tamanhoMatriz(Matriz, Tam, Tam),
    foraDoLugar(Elemento, 0, 0, Tam, Custo),
    !.

foraDoLugarTotal(Matriz, Indice, Custo):-
    Proximo is Indice - 1,
    foraDoLugarTotal(Matriz, Proximo, Custo1),
    tamanhoMatriz(Matriz, Tam, Tam),
    J is mod(Indice, Tam),
    I is (Indice - J)/Tam,
    elementoMatriz(I, J, Matriz, Elemento),
    foraDoLugar(Elemento, I, J, Tam, Custo2),
    Custo is Custo1 + Custo2,
    !.

foraDoLugar(999, I, J, N, 0):-
    I is N-1,
    J is N-1,
    !.
foraDoLugar(999, _, _, _, 1).

foraDoLugar(Elemento, I, J, N, 0):-
    Indice is Elemento - 1,
    J is mod(Indice, N),
    I is (Indice - J)/N,
    !.
foraDoLugar(_, _, _, _, 1).


distanciaManhattanTotal(Matriz, 0, Custo):-
    elementoMatriz(0, 0, Matriz, Elemento),
    distanciaManhattan(0, 0, Elemento, Matriz, Custo), 
    !.

distanciaManhattanTotal(Matriz, Indice, Acumulado):-
    Proximo is Indice - 1,
    distanciaManhattanTotal(Matriz, Proximo, Custo),
    tamanhoMatriz(Matriz, Tam, Tam),
    J is mod(Indice, Tam),
    I is (Indice - J)/Tam,
    elementoMatriz(I, J, Matriz, Elemento),
    distanciaManhattan(I, J, Elemento, Matriz, Distancia),
    Acumulado is Custo + Distancia.

distanciaManhattan(_,_, 999, _, 0):-
    !.

distanciaManhattan(I, J, Elemento, Matriz, Custo):-
    tamanhoMatriz(Matriz, Tam, Tam),
    Value is Elemento - 1,
    E_J is mod(Value, Tam),
    E_I is (Value-E_J)/Tam,
    Custo is abs(I-E_I) + abs(J-E_J).

% -----------------------------------
% Ordenar por Heurística
% -----------------------------------                                            

quicksort_by_h([],[]).
quicksort_by_h([A|T], Sorted):-
	pivoting(A, T, L1, L2),
    quicksort_by_h(L1, Sorted1),
    quicksort_by_h(L2, Sorted2),
	append(Sorted1, [A|Sorted2], Sorted).
   
pivoting(_, [], [], []).
pivoting(A, [B|T], [B|L], G):-
    A = (_, _, GA, HA),
    B = (_, _, GB, HB),
    FA is HA + GA,
    FB is HB + GB,
    FB =< FA,
    pivoting(A, T, L, G).
pivoting(A, [B|T], L, [B|G]):-
    A = (_, _, GA, HA),
    B = (_, _, GB, HB),
    FA is HA + GA,
    FB is HB + GB,
    FB > FA,
    pivoting(A, T, L, G).
                        
% -----------------------------------
% Funções para Busca
% -----------------------------------  

diff([], _, []).
diff([Node|T], L2, [(Acao, Matriz, G, H)|R]):-
    Node = (Acao, Matriz, G, H),
    not(member(Matriz, L2)),
    diff(T, L2, R).
diff([Node|T], L2, R):-
    Node = (_, Matriz, _, _),
    member(Matriz, L2),
    diff(T, L2, R).

listaMatrizes([], []).
listaMatrizes([(_, Matriz, _, _)|Proximos], [Matriz|Resultado]):-
    listaMatrizes(Proximos, Resultado).

vizinho(Heuristica, Node, FilhosN):-
    findall(L, regra(Heuristica, Node, _, L), FilhosN).

adicionaNaArvore((Acao, Atual) , VizinhosNovos, ArvoreAntiga, [(Acao, Atual, VizinhosNovos)|ArvoreAntiga]).

adicionaSePai(Atual, [PrimeiroDoCaminho|RestoCaminho], Arvore, [Atual|[PrimeiroDoCaminho|RestoCaminho]]):-
    member((_, Atual, Filhos), Arvore), 
    member(PrimeiroDoCaminho, Filhos),
    !.
adicionaSePai(_, Caminho, _, Caminho).

addNaFronteira(Vizinhos, FronteiraAntiga, Ordenada):-
    append(FronteiraAntiga, Vizinhos, FronteiraNova),
    quicksort_by_h(FronteiraNova, Ordenada).

% -----------------------------------
% Busca A*
% -----------------------------------  
% Como usar: busca_AStar(manhattan, C)

busca_AStar(Heuristica, Caminho):-
    matriz(Mapa),
    heuristica(Heuristica, Mapa, H),
    busca(Heuristica, [(_, Mapa, 0, H)], [], [], Caminho), !.

busca_AStar(_,_):-
    write('Nenhum caminho encontrado').

busca(_, [ (_,Matriz, _, _) |_],_,_, [Matriz]):- 
    objetivo(Matriz), 
    !.

busca(Heuristica, [ Node | NodesFronteira], Arvore, Visitados, CaminhoNovo) :- 
    Node = (Acao, Matriz, _, _),
    vizinho(Heuristica, Node, Vizinhos),
    listaMatrizes(NodesFronteira, MatrizesFronteira),
    append(Visitados, MatrizesFronteira, Repetidos),
    diff(Vizinhos, Repetidos, VizinhosNovos),
    addNaFronteira(VizinhosNovos, NodesFronteira, FronteiraAtualizada),
    listaMatrizes(VizinhosNovos, MatrizesVizinhasNovas),
    adicionaNaArvore((Acao, Matriz), MatrizesVizinhasNovas, Arvore, ArvoreNova),
    busca(Heuristica, FronteiraAtualizada, ArvoreNova, [Matriz|Visitados], Caminho),
    adicionaSePai(Matriz, Caminho, ArvoreNova, CaminhoNovo).