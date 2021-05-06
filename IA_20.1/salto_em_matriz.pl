% Define matriz como uma lista de listas, onde cada lista se refere à
% uma linha da matriz. A ordem das listas importa, ou seja, a primeira
% lista se refere sempre à primeira linha da matriz, a segunda lista se
% refere sempre a segunda linha da matriz, e assim sucessivamente.
matriz(M):- M=[[3,4,1,3,1],[3,3,3,g,2],[3,1,2,2,3],[4,2,3,3,3],[4,1,4,3,2]].

% Cláusulas que retornam um elemento da matriz mxn dada sua posição
% (i,j), onde 0=<i<m e 0=<j<n.
elemento_l((L,C),[X|_],K,E):- K=L,elemento_c(C,X,0,E).
elemento_l((L,C),[_|M],K,E):- K<L,K1 is K+1,elemento_l((L,C),M,K1,E).
elemento_c(C,[X|_],K,E):- not(X=g),K=C,E is X.
elemento_c(C,[X|_],K,E):- X=g,K=C,E=X.
elemento_c(C,[_|M],K,E):- K<C,K1 is K+1,elemento_c(C,M,K1,E).

% Cláusula que define a fronteira de um dado elemento.
fronteira((V,I,J,P),M,F):-
    % BCDE
    I1 is I+V,elemento_l((I1,J),M,0,E1),I2 is I-V,elemento_l((I2,J),M,0,E2),J3 is J+V,elemento_l((I,J3),M,0,E3),
    J4 is J-V,elemento_l((I,J4),M,0,E4),P1 is P+1,F=[(E1,I1,J,P1),(E2,I2,J,P1),(E3,I,J3,P1),(E4,I,J4,P1)],!;
    % CED
    I1 is I-V,elemento_l((I1,J),M,0,E1),J2 is J-V,elemento_l((I,J2),M,0,E2),J3 is J+V,elemento_l((I,J3),M,0,E3),
    P1 is P+1,F=[(E1,I1,J,P1),(E2,I,J2,P1),(E3,I,J3,P1)],!;
    % BED
    I1 is I+V,elemento_l((I1,J),M,0,E1),J2 is J-V,elemento_l((I,J2),M,0,E2),J3 is J+V,elemento_l((I,J3),M,0,E3),
    P1 is P+1,F=[(E1,I1,J,P1),(E2,I,J2,P1),(E3,I,J3,P1)],!;
    % CEB
    I1 is I-V,elemento_l((I1,J),M,0,E1),J2 is J-V,elemento_l((I,J2),M,0,E2),I3 is I+V,elemento_l((I3,J),M,0,E3),
    P1 is P+1,F=[(E1,I1,J,P1),(E2,I,J2,P1),(E3,I3,J,P1)],!;
    % CDB
    I1 is I-V,elemento_l((I1,J),M,0,E1),J2 is J+V,elemento_l((I,J2),M,0,E2),I3 is I+V,elemento_l((I3,J),M,0,E3),
    P1 is P+1,F=[(E1,I1,J,P1),(E2,I,J2,P1),(E3,I3,J,P1)],!;
    % CB
    I1 is I-V,elemento_l((I1,J),M,0,E1),I2 is I+V,elemento_l((I2,J),M,0,E2),P1 is P+1,F=[(E1,I1,J,P1),(E2,I2,J,P1)],!;
    % CD
    I1 is I-V,elemento_l((I1,J),M,0,E1),J2 is J+V,elemento_l((I,J2),M,0,E2),P1 is P+1,F=[(E1,I1,J,P1),(E2,I,J2,P1)],!;
    % CE
    I1 is I-V,elemento_l((I1,J),M,0,E1),J2 is J-V,elemento_l((I,J2),M,0,E2),P1 is P+1,F=[(E1,I1,J,P1),(E2,I,J2,P1)],!;
    % ED
    J1 is J-V,elemento_l((I,J1),M,0,E1),J2 is J+V,elemento_l((I,J2),M,0,E2),P1 is P+1,F=[(E1,I,J1,P1),(E2,I,J2,P1)],!;
    % EB
    J1 is J-V,elemento_l((I,J1),M,0,E1),I2 is I+V,elemento_l((I2,J),M,0,E2),P1 is P+1,F=[(E1,I,J1,P1),(E2,I2,J,P1)],!;
    % DB
    J1 is J+V,elemento_l((I,J1),M,0,E1),I2 is I+V,elemento_l((I2,J),M,0,E2),P1 is P+1,F=[(E1,I,J1,P1),(E2,I2,J,P1)],!;
    % B
    I1 is I+V,elemento_l((I1,J),M,0,E1),P1 is P+1,F=[(E1,I1,J,P1)],!;
    % C
    I1 is I-V,elemento_l((I1,J),M,0,E1),P1 is P+1,F=[(E1,I1,J,P1)],!;
    % D
    J1 is J+V,elemento_l((I,J1),M,0,E1),P1 is P+1,F=[(E1,I,J1,P1)],!;
    % E
    J1 is J-V,elemento_l((I,J1),M,0,E1),P1 is P+1,F=[(E1,I,J1,P1)],!;
    % Sem movimento válido
    F=[].

% Nó objetivo.
objetivo((g,_,_)).

% Verifica se algum nó foi repetido, independente de sua profundidade
repetido((V,I,J,_),[(V,I,J,_)|_]):- !.
repetido((V,I,J,_),[_|REP]):- repetido((V,I,J,_),REP).

% Gera árvore com busca em largura do nó inicial até o objetivo sem
% repetições.
busca_larg([X|_],_,REP,Arv):- objetivo(X),append(REP,[X],Arv),!.
busca_larg([X|L],M,REP,Arv):-
    not(repetido(X,REP)),append(REP,[X],REP1),fronteira(X,M,F),append(L,F,L1),busca_larg(L1,M,REP1,Arv),!.
busca_larg([_|L],M,REP,Arv):- busca_larg(L,M,REP,Arv).

% Descobre qual ação foi utilizada de um nó pai para o filho
acao((V,I,J,_),(_,I1,J1,_),Acao):-
    J1=J,K is I+V,I1=K,Acao=b;
    J1=J,K is I-V,I1=K,Acao=c;
    I1=I,K is J+V,J1=K,Acao=d;
    I1=I,K is J-V,J1=K,Acao=e.

% Busca a solução a partir da árvore gerada em busca_larg().
solucao_larg(_,_,X,[]):- objetivo(X),!.
solucao_larg(Arv,M,(V,I,J,P),[Acao|Sol]):-
    pertence((V1,I1,J1,P1),Arv,Arv1),K is P+1,K=P1,acao((V,I,J,P),(V1,I1,J1,P1),Acao),solucao_larg(Arv1,M,(V1,I1,J1,P1),Sol),!.

% EI é o estado inicial definido como (valor,i,j) com 0=<i<m e 0=<j<n e
% Sol é uma lista em que cada elemento representa uma ação (c-cima,
% b-baixo, e-esquerda e d-direita) e, lendo da esquerda para a direia,
% forma a sequência de ações que leva do estado inicial ao objetivo.
solucao((V,I,J),Sol):- matriz(M),busca_larg([(V,I,J,0)],M,[],[_|Arv]),solucao_larg(Arv,M,(V,I,J,0),Sol).

% Cláusulas auxiliares
pertence(X,[X|L],L).
pertence(X,[Z|Y],[Z|L]):- pertence(X,Y,L).
