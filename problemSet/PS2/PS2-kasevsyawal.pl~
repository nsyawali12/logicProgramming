max3number(X,Y,Z):-
    X=Y,X=Z, write(X).
max3number(X,Y,Z):-
    Y=Z,Z=X, write(Y).
max3number(X,Y,Z):-
    Z=X,Z=Y, write(Z).
max3number(X,Y,Z):-
    X>Y,X>Z, write(X).
max3number(X,Y,Z):-
    Y>Z,Y>X, write(Y).
max3number(X,Y,Z):-
    Z>X,Z>Y, write(Z).
max3number(X,Y,Z):-
    X=Y, Y>Z, write(Y).
max3number(X,Y,Z):-
    X=Z, X>Y, write(X).
max3number(X,Y,Z):-
    Z=Y, Z>X, write(Z).

%problem 2
mypromise(1):-
    write('I will study hard for the midterm').

mypromise(X):-
    X>1,
    write('I will study hard for the midterm.'),nl,
    P is X-1,
    mypromise(P).

%problem 3
factorial(0,0).
factorial(1,1).

factorial(X,Y):-
    X>0,
    X1 is X-1,
    factorial(X1,Y1),
    Y is X*Y1.

%problem 4
sumcube(0,0).
sumcube(1,1).

sumcube(X,Y):-
    X>0,
    X1 is X-1,
    sumcube(X1,Y1),
    Y is Y1+(X^3).

%problem 5

connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(X,Y):-
    connected(X,Y).
path(X,Y):-
    connected(X,Z),
    path(Z,Y).


























