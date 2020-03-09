double(X,Y):-
    var(Y),
    Y is X*2;
    X is Y/2.

average(X,Y,Z):-
    var(X), X is Z*2-Y;
    var(Y), Y is Z*2-X;
    var(Z), Z is (X+Y)/2;
    Z is (X+Y)/2.

