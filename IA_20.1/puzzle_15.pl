%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PUZZLE 15 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Para executar o programa podemos executar com o comando main(X)
%% onde X é uma lista com as alterações
%% Estado Final desejado -> Função Objetivo
estado_final(	[[1,2,3,4],
				[5,6,7,8],
				[9,10,11,12],
				[13,14,15,b]]).


%% Caso deseje mudar o estado inicial, é só alterar nessa parte abaixo
estado_inicial([[1,2,3,4], 
               [5,6,b,7], 
               [9,10,11,8], 
               [13,14,15,12]]).

%% O estado Inicial do enunciado do programa seria representado dessa forma:
%% estado_inicial([[15,2,1,12],
%%				[8,5,6,11],
%%				[4,9,10,7],
%%				[3,14,13,b]]).
%% O b representa o estado em branco 
%% Não conseguimos resolver o problema, devido ao loop infinito que ele esta causando
%% Ele consegue chegar no final no estado inicial informado no programa,
%% Mas para esse caso do enunciado ele dá tempo excedido




%% Peça se move para direita
%% primera linha e suas possibilidades
direita([[b,A,B,C],
          [D,E,F,G],
          [H,I,J,K],
          [L,M,N,O]],
		[[A,b,B,C],
          [D,E,F,G],
          [H,I,J,K],
          [L,M,N,O]]).
direita([[A,b,B,C],
          [D,E,F,G],
          [H,I,J,K],
          [L,M,N,O]],
		[[A,B,b,C],
          [D,E,F,G],
          [H,I,J,K],
          [L,M,N,O]]).
direita([[A,B,b,C],
          [D,E,F,G],
          [H,I,J,K],
          [L,M,N,O]],
		[[A,B,C,b],
          [D,E,F,G],
          [H,I,J,K],
          [L,M,N,O]]).

%% segunda linhas e suas possibilidades
direita([[A,B,C,D],
          [b,E,F,G],
          [H,I,J,K],
          [L,M,N,O]],
		[[A,B,C,D],
          [E,b,F,G],
          [H,I,J,K],
          [L,M,N,O]]).
direita([[A,B,C,D],
          [E,b,F,G],
          [H,I,J,K],
          [L,M,N,O]],
		[[A,B,C,D],
          [E,F,b,G],
          [H,I,J,K],
          [L,M,N,O]]).
direita([[A,B,C,D],
          [E,F,b,G],
          [H,I,J,K],
          [L,M,N,O]],
		[[A,B,C,D],
          [E,F,G,b],
          [H,I,J,K],
          [L,M,N,O]]).

%% terceira linha e suas possibilidades
direita([[A,B,C,D],
          [E,F,G,H],
          [b,I,J,K],
          [L,M,N,O]],
		[[A,B,C,D],
          [E,F,G,H],
          [I,b,J,K],
          [L,M,N,O]]).
direita([[A,B,C,D],
          [E,F,G,H],
          [I,b,J,K],
          [L,M,N,O]],
		[[A,B,C,D],
          [E,F,G,H],
          [I,J,b,K],
          [L,M,N,O]]).
direita([[A,B,C,D],
          [E,F,G,H],
          [I,J,b,K],
          [L,M,N,O]],
		[[A,B,C,D],
          [E,F,G,H],
          [I,J,K,b],
          [L,M,N,O]]).

%% quarta linha e suas possibilidades
direita([[A,B,C,D],
          [E,F,G,H],
          [I,J,K,L],
          [b,M,N,O]],
		[[A,B,C,D],
          [E,F,G,H],
          [I,J,K,L],
          [M,b,N,O]]).
direita([[A,B,C,D],
          [E,F,G,H],
          [I,J,K,L],
          [M,b,N,O]],
		[[A,B,C,D],
          [E,F,G,H],
          [I,J,K,L],
          [M,N,b,O]]).
direita([[A,B,C,D],
          [E,F,G,H],
          [I,J,K,L],
          [M,N,b,O]],
		[[A,B,C,D],
          [E,F,G,H],
          [I,J,K,L],
          [M,N,O,b]]).


%% Peça se move para esquerda
%% primeira linhas e suas possibilidads
esquerda(	[[A,b,B,C],
              [D,E,F,G],
              [H,I,J,K],
              [L,M,N,O]],
			[[b,A,B,C],
              [D,E,F,G],
              [H,I,J,K],
              [L,M,N,O]]).
esquerda(	[[A,B,b,C],
              [D,E,F,G],
              [H,I,J,K],
              [L,M,N,O]],
			[[A,b,B,C],
              [D,E,F,G],
              [H,I,J,K],
              [L,M,N,O]]).
esquerda(	[[A,B,C,b],
              [D,E,F,G],
              [H,I,J,K],
              [L,M,N,O]],
			[[A,B,b,C],
              [D,E,F,G],
              [H,I,J,K],
              [L,M,N,O]]).

%% segunda linha e suas possibilidades
esquerda(	[[A,B,C,D],
              [E,b,F,G],
              [H,I,J,K],
              [L,M,N,O]],
			[[A,B,C,D],
              [b,E,F,G],
              [H,I,J,K],
              [L,M,N,O]]).
esquerda(	[[A,B,C,D],
              [E,F,b,G],
              [H,I,J,K],
              [L,M,N,O]],
			[[A,B,C,D],
              [E,b,F,G],
              [H,I,J,K],
              [L,M,N,O]]).
esquerda(	[[A,B,C,D],
              [E,F,G,b],
              [H,I,J,K],
              [L,M,N,O]],
			[[A,B,C,D],
              [E,F,b,G],
              [H,I,J,K],
              [L,M,N,O]]).

%% terceira linha e suas possibilidades 
esquerda(	[[A,B,C,D],
              [E,F,G,H],
              [I,b,J,K],
              [L,M,N,O]],
			[[A,B,C,D],
              [E,F,G,H],
              [b,I,J,K],
              [L,M,N,O]]).
esquerda(	[[A,B,C,D],
              [E,F,G,H],
              [I,J,b,K],
              [L,M,N,O]],
			[[A,B,C,D],
              [E,F,G,H],
              [I,b,J,K],
              [L,M,N,O]]).
esquerda(	[[A,B,C,D],
              [E,F,G,H],
              [I,J,K,b],
              [L,M,N,O]],
			[[A,B,C,D],
              [E,F,G,H],
              [I,J,b,K],
              [L,M,N,O]]).

%% quarta linha e suas possibilidades
esquerda(	[[A,B,C,D],
              [E,F,G,H],
              [I,J,K,L],
              [M,b,N,O]],
			[[A,B,C,D],
              [E,F,G,H],
              [I,J,K,L],
              [b,M,N,O]]).
esquerda(	[[A,B,C,D],
              [E,F,G,H],
              [I,J,K,L],
              [M,N,b,O]],
			[[A,B,C,D],
              [E,F,G,H],
              [I,J,K,L],
              [M,b,N,O]]).
esquerda(	[[A,B,C,D],
              [E,F,G,H],
              [I,J,K,L],
              [M,N,O,b]],
			[[A,B,C,D],
              [E,F,G,H],
              [I,J,K,L],
              [M,N,b,O]]).


%% Peça se move para acima
%% a primeira linha é impossibilitada de avançar mais em cima
%% segunda linha e suas possibilidades
acima(	[[A,B,C,D],
		[b,E,F,G],
		[H,I,J,K],
		[L,M,N,O]],
		[[b,B,C,D],
		[A,E,F,G],
		[H,I,J,K],
		[L,M,N,O]]).
acima(	[[A,B,C,D],
		[E,b,F,G],
		[H,I,J,K],
		[L,M,N,O]],
		[[A,b,C,D],
		[E,B,F,G],
		[H,I,J,K],
		[L,M,N,O]]).
acima(	[[A,B,C,D],
		[E,F,b,G],
		[H,I,J,K],
		[L,M,N,O]],
		[[A,B,b,D],
		[E,F,C,G],
		[H,I,J,K],
		[L,M,N,O]]).
acima(	[[A,B,C,D],
		[E,F,G,b],
		[H,I,J,K],
		[L,M,N,O]],
		[[A,B,C,b],
		[E,F,G,D],
		[H,I,J,K],
		[L,M,N,O]]).

%% terceira linha e suas possibilidades
acima(	[[A,B,C,D],
		[E,F,G,H],
		[b,I,J,K],
		[L,M,N,O]],
		[[A,B,C,D],
		[b,F,G,H],
		[E,I,J,K],
		[L,M,N,O]]).
acima(	[[A,B,C,D],
		[E,F,G,H],
		[I,b,J,K],
		[L,M,N,O]],
		[[A,B,C,D],
		[E,b,G,H],
		[I,F,J,K],
		[L,M,N,O]]).
acima(	[[A,B,C,D],
		[E,F,G,H],
		[I,J,b,K],
		[L,M,N,O]],
		[[A,B,C,D],
		[E,F,b,H],
		[I,J,G,K],
		[L,M,N,O]]).
acima(	[[A,B,C,D],
		[E,F,G,H],
		[I,J,K,b],
		[L,M,N,O]],
		[[A,B,C,D],
		[E,F,G,b],
		[I,J,K,H],
		[L,M,N,O]]).

%% quarta linha e suas possibilidades
acima(	[[A,B,C,D],
		[E,F,G,H],
		[I,J,K,L],
		[b,M,N,O]],
		[[A,B,C,D],
		[E,F,G,H],
		[b,J,K,L],
		[I,M,N,O]]).
acima(	[[A,B,C,D],
		[E,F,G,H],
		[I,J,K,L],
		[M,b,N,O]],
		[[A,B,C,D],
		[E,F,G,H],
		[I,b,K,L],
		[M,J,N,O]]).
acima(	[[A,B,C,D],
		[E,F,G,H],
		[I,J,K,L],
		[M,N,b,O]],
		[[A,B,C,D],
		[E,F,G,H],
		[I,J,b,L],
		[M,N,K,O]]).
acima(	[[A,B,C,D],
		[E,F,G,H],
		[I,J,K,L],
		[M,N,O,b]],
		[[A,B,C,D],
		[E,F,G,H],
		[I,J,K,b],
		[M,N,O,L]]).


%% Peça se move para abaixo
%% linha número 1 e suas possibilidades
abaixo(	[[b,A,B,C],
		[D,E,F,G],
		[H,I,J,K],
		[L,M,N,O]],
		[[D,A,B,C],
		[b,E,F,G],
		[H,I,J,K],
		[L,M,N,O]]).
abaixo(	[[A,b,B,C],
		[D,E,F,G],
		[H,I,J,K],
		[L,M,N,O]],
		[[A,E,B,C],
		[D,b,F,G],
		[H,I,J,K],
		[L,M,N,O]]).
abaixo(	[[A,B,b,C],
		[D,E,F,G],
		[H,I,J,K],
		[L,M,N,O]],
		[[A,B,F,C],
		[D,E,b,G],
		[H,I,J,K],
		[L,M,N,O]]).
abaixo(	[[A,B,C,b],
		[D,E,F,G],
		[H,I,J,K],
		[L,M,N,O]],
		[[A,B,C,G],
		[D,E,F,b],
		[H,I,J,K],
		[L,M,N,O]]).

%% linha número 2 e suas possibilidades
abaixo(	[[A,B,C,D],
		[b,E,F,G],
		[H,I,J,K],
		[L,M,N,O]],
		[[A,B,C,D],
		[H,E,F,G],
		[b,I,J,K],
		[L,M,N,O]]).
abaixo(	[[A,B,C,D],
		[E,b,F,G],
		[H,I,J,K],
		[L,M,N,O]],
		[[A,B,C,D],
		[E,I,F,G],
		[H,b,J,K],
		[L,M,N,O]]).
abaixo(	[[A,B,C,D],
		[E,F,b,G],
		[H,I,J,K],
		[L,M,N,O]],
		[[A,B,C,D],
		[E,F,J,G],
		[H,I,b,K],
		[L,M,N,O]]).
abaixo(	[[A,B,C,D],
		[E,F,G,b],
		[H,I,J,K],
		[L,M,N,O]],
		[[A,B,C,D],
		[E,F,G,K],
		[H,I,J,b],
		[L,M,N,O]]).

%% linha numero 3 e suas possibilidades
abaixo(	[[A,B,C,D],
		[E,F,G,H],
		[b,I,J,K],
		[L,M,N,O]],
		[[A,B,C,D],
		[E,F,G,H],
		[L,I,J,K],
		[b,M,N,O]]).
abaixo(	[[A,B,C,D],
		[E,F,G,H],
		[I,b,J,K],
		[L,M,N,O]],
		[[A,B,C,D],
		[E,F,G,H],
		[I,M,J,K],
		[L,b,N,O]]).
abaixo(	[[A,B,C,D],
		[E,F,G,H],
		[I,J,b,K],
		[L,M,N,O]],
		[[A,B,C,D],
		[E,F,G,H],
		[I,J,N,K],
		[L,M,b,O]]).
abaixo(	[[A,B,C,D],
		[E,F,G,H],
		[I,J,K,b],
		[L,M,N,O]],
		[[A,B,C,D],
		[E,F,G,H],
		[I,J,K,O],
		[L,M,N,b]]).
%% quarta linha é a ultima, portanto não se pode ir abaixo


%% Funções que relacionam o movimento da peça no Tabuleiro
operador(T,esquerda,Tn,1) 	:-  esquerda(T,Tn).
operador(T,acima,Tn,1)		:-  acima(T,Tn).
operador(T,direita,Tn,1)	:-  direita(T,Tn).
operador(T,abaixo,Tn,1)		:-  abaixo(T,Tn).


%% O custo do movimento é 1
%% no(Estado, Pai, Operador, Custo).
%% Função Principal do nosso programa
main(X) :- 
  %% criamos o nó inicial e inicializamos a lista 
  %% abertos com o estado inicial e fechados com o estado final 
  estado_inicial(C), % Extraio o estado inicial definido 
  main([no(C, none, 0, 0)], [], Operadores),
  %% Uma vez que acabo a recursão, já temos a solução.
  %% (se chegou até aqui é por que é verdadeiro)
  %% e o que fazemos é dar volta nos operadores
  reverse(Operadores, X).


%% Se o estado atual é igual ao estado final, ele retorna true e segue 
main([NoAtual|_], _,Operadores) :-
  %% instanciamos o nó atual para tirar o estado e comprovar  se é a solução
  NoAtual = no(EstadoAtual,_,_,_), 
  estado_final(EstadoAtual), 
  %% se o estado final é a solução, então terminamos,
  %% extraimos os operadores e cortamos a expansão.
  tira_op(NoAtual, Operadores), !.
  

main([NoAtual|RestoAbertos], Fechados, Operadores) :- 
  NoAtual = no(EstadoAtual,_,_,_),
  %% expandimos o no atual
  gera_proximos(NoAtual, [EstadoAtual|Fechados], NosSucessores),
  %% inserimos de forma ordenada os sucessores na lista de abertos
  insere_proximos(NosSucessores, RestoAbertos, NovosAbertos),
  %% voltamos a buscar uma vez adicionados os nós abertos
  main(NovosAbertos, [EstadoAtual|Fechados], Operadores).


insere_proximos([Cabeca|Resto],AbertosOrg,AbertosFinal) :- inserir_lista(Cabeca,AbertosOrg,AbertosTrans),
                                 									insere_proximos(Resto,AbertosTrans,AbertosFinal).
%% Fica como está se não tem sucessores
insere_proximos([],Abertos,Abertos).


inserir_lista(No,Abertos,Abertos) :- no_repetido(No,Abertos), ! .
inserir_lista(No,[H|T],[No,H|T]) :- menor_custo(No,H), ! .
%% se o nó é mais barato que a cabeça ele é posto como primeiro
inserir_lista(No,[No1|R],[No1|S]) :- inserir_lista(No,R,S), !.
%% se não se cumpriu o predicado anterior, então temos que inserir-lo
%% na posição que corresponda a ordem ascendente
inserir_lista(No,[],[No]).
%% se não se insere ao final 


%% Verifica se é um nó repetido
no_repetido(NoA, [NoB|_]) :-  NoA = no(Est,_,_,_),
								NoB = no(Est,_,_,_).


%% Verifica o que tem o menor custo
menor_custo( NoA , NoB ) :- func_heuristica(NoA, FnA),
						    func_heuristica(NoB, FnB),
						    FnA < FnB.


gera_proximos(NoAtual, Fechados, NosSucessores) :- 
	  NoAtual = no(EstadoAtual,_,_,CustoPai), /* instanciar componentes del NoAtual*/
	  findall(no(EstadoSucessor, NoAtual, Operador, CustoSucessor), 
          (operador(EstadoAtual, Operador, EstadoSucessor, CustoOperador),
           \+member(EstadoSucessor, Fechados),
           CustoSucessor is CustoPai + CustoOperador), 
          NosSucessores).
	  %% verifica todas as possibilidades que podem ser feitas no nó atual
	  %% Nesse processo colocamos o pai dos novos nós ao nó atual
	  %% e acrescenta o custo ao operador


%% Retira o Operador
tira_op(no(_, none, _, _), []).
tira_op(no(_, Pai, Operador, _), [Operador|Operadores]) :- tira_op(Pai, Operadores).


%% Função Auxiliar para escolher a Heuristica Utilizada
func_heuristica(No_Atual,Fn) :- No_Atual = nodo(EstadoAtual,_,_,Gn),
					primeira_heuristica(EstadoAtual, Hn),
					Fn is Gn + Hn.


%% Heuristica com o número de peças fora da posição correta
primeira_heuristica(Atual, Hn) :- estado_final(Final), % Extrai o objetivo
			flatten(Atual, AtualPlana), % Tira as listas de listas e transforma em uma lista
			flatten(Final, FinalPlana), % Tira as listas de listas e transforma em uma lista
			fora_da_posicao(AtualPlana,FinalPlana,Hn). % Encontra o numero de peças fora da sua  posição final correta


%% Verifica se esta fora da posição o objeto inserido
fora_da_posicao([],[],0). %% Caso base 
fora_da_posicao([0|T1],[0|T2],Qtd) :- fora_da_posicao(T1,T2,Qtd). %% Quando o Tail das listas for igual
fora_da_posicao([H|T1],[H|T2],Qtd) :- fora_da_posicao(T1,T2,Qtd). %% Quando a cabeças das listas forem iguais, segue a recursão 
fora_da_posicao([H1|T1],[H2|T2],Qtd) :- H1\==H2, %% Se o Nó não está no lugar certo, ele soma um a Number para contar todos os nós qu enão estão nas suas posições
										fora_da_posicao(T1,T2,N), %% segue a recursão 
										Qtd is N+1. %% Soma o numero de nós deslocados 

