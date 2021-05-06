par([]).
impar([_]).
par([X|Y]):- impar(Y).
impar([X|Y]):- par(Y).
