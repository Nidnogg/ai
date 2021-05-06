
% Existe um grafo G tal que G é representado por uma lista. O primeiro elemento V é sempre um vértice
% seguido de uma lista L de vértices adjacentes ao mesmo
 
% Exemplo de consulta: graph([A,[B,C,D],B,[],C,[D],D,[]]).

% A resposta é todas as possibilidades de coloração sem que haja duas colores iguais nas adjacências.

% Tais combinações de colores são fatos 
% listados abaixo que serão exaustivamente tentados ao longo do algoritmo

color(yellow,blue).
color(yellow,red).
color(yellow,green).

color(blue,red).
color(blue,yellow).
color(blue,green).

color(red,green).
color(red,yellow).
color(red,blue).

color(green,blue).
color(green,yellow).
color(green,red).

% Este trecho percorre todas as adjacencias ao vértice V1, definindo uma color para o par de 
% vértices, entre as possibilidades possiveis.  
vertex(_,[]).
vertex(V1,[A1|A2]):-
    color(V1,A1),
    vertex(V1,A2).

% Percorre o grafo sempre definindo um vértice V1 associado a sua lista L1
% de adjacencias. 
graph([]).    
graph([V1,L1|Tail]):-
    vertex(V1,L1),
    graph(Tail). % Colocaria um cut apos a chamada graph(Tail), para 
% sempre retornar apenas uma possibilidade de coloração. Que pela ordem 
% dos fatos de color(), sempre será em decolorrencia do primero vertice V=yellow.