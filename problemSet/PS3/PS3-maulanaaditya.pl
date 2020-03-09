% Problem 1
modadd(A,B,N,Y) :-
  Y is (A + B) mod N.

modmul(A,B,N,Y) :-
  Y is (A * B) mod N.

% Problem 2
product(A,A,A).
product(A,B,1) :- B < A.
product(A,B,Y) :-
  B1 is B-1,
  product(A,B1,Y1),
  MC is (10^9) + 7,
  modmul(B,Y1,MC,R),
  Y is R.

perm(N,R,Y) :-
  R =< N,
  N >= 0,
  R >= 0,
  product((N-R)+1,N,Result),
  Y is Result.

% Problem 3
fibo(F0,F1,0,F0).
fibo(F0,F1,1,F1).
fibo(F0,F1,N,F) :- 
  N >= 0,
  N1 is N-1,
  fibo(F0,F1,N1,R1),
  N2 is N-2,
  fibo(F0,F1,N2,R2),
  F is R1 + R2.

% Problem 4
draw(0).
draw(N) :-
  N >= 0, 
  N1 is N-1,
  write("*"),
  draw(N1).

inverttri(0).
inverttri(N) :-
  N >= 0,
  N1 is N-1,
  draw(N),
  nl,
  inverttri(N1).

count(Curr,N,Y) :-
  Y is N - Curr + 1.

startri(0,N).
startri(N,Max) :- 
  N >= 0,
  N1 is N-1,
  count(N,Max,Count),
  draw(Count),
  nl,
  startri(N1,Max).
startri(N) :- startri(N,N).

% Problem 5
:- op(600,xf,genap).
:- op(601,xf,ganjil).

X genap :- X mod 2 =:= 0.
X ganjil :- X mod 2 =:= 1.
