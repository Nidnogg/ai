pertence(X,[X|Y],Y).
pertence(X,[Z|Y],[Z|K]):- pertence(X,Y,K).
subconjunto(_,[]).
subconjunto(L,[X|P]):- pertence(X,L,L1),subconjunto(L1,P).
