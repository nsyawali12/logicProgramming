modadd(A,B,N,Result):-
    X is A+B,
    Result is X mod N.

modmul(A,B,N,Result):-
    X is A*B,
    Result is X mod N.

%problem2.
%
perm(X, Y, R).
perm([X|Y], R) :-
    permute(Y, R1),
    select(X, R, R1).


%problem3.


%problem 4


%problem 5
