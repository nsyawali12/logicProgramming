% Problem 1

% parent(X,Y) denotes that X is one of Y’s parent
parent(anya,clara). parent(anya,edward). parent(anya,fiona).
parent(benjamin,clara). parent(benjamin,edward). parent(benjamin,fiona).
parent(clara,hannah). parent(clara,ira). parent(clara,lucas).
parent(david,hannah). parent(david,ira). parent(david,lucas).
parent(fiona,mike). parent(fiona,nancy).
parent(george,mike). parent(george,nancy).
parent(ira,peter). parent(ira,quincy).
parent(james,peter). parent(james,quincy).
parent(kiana,raymond). parent(kiana,sarah). parent(kiana,tina).
parent(lucas,raymond). parent(lucas,sarah). parent(lucas,tina).
parent(nancy,umberto). parent(nancy,victoria).
parent(oscar,umberto). parent(oscar,victoria).

/* person(Person,Gender,Birthyear) explains that the person Person is
of gender Gender and born at Birthyear */
person(anya,female,1938). person(benjamin,male,1929).
person(clara,female,1959). person(david,male,1950).
person(edward,male,1963).
person(fiona,female,1965). person(george,male,1955).
person(hannah,female,1980).
person(ira,female,1982). person(james,male,1979).
person(kiana,female,1990). person(lucas,male,1989).
person(mike,male,1991).
person(nancy,female,1994). person(oscar,male,1992).
person(peter,male,2005). person(quincy,female,2008).
person(raymond,male,2013). person(sarah,female,2015).
person(tina,female,2018).
person(umberto,male,2016). person(victoria,female,2019).

older(X,Y) :-  person(X,_,AX), person(Y,_,AY), AX < AY.

male(X) :- person(X,male,_).
female(X) :- person(X,female,_).

sibling(X,Y) :- parent(Z,X), parent(Z,Y), X \= Y.
married(X,Y) :- parent(X,Z), parent(Y,Z), X \= Y.

pakde(X,Y) :- parent(Z,Y), sibling(X,Z), male(X), older(X,Z).
pakde(X,Y) :- parent(Z,Y), sibling(P,Z), married(X,P), male(X), older(P,Z).

paklik(X,Y) :- parent(Z,Y), sibling(X,Z), male(X), older(Z,X).
paklik(X,Y) :- parent(Z,Y), sibling(P,Z), married(X,P), male(X), older(Z,P).

bude(X,Y) :- parent(Z,Y), sibling(X,Z), female(X), older(X,Z).
bude(X,Y) :- parent(Z,Y), sibling(P,Z), married(X,P), female(X), older(P,Z).

bulik(X,Y) :- parent(Z,Y), sibling(X,Z), female(X), older(Z,X).
buli(X,Y) :- parent(Z,Y), sibling(P,Z), married(X,P), female(X), older(Z,P).

% Problem 2
next(legi,pahing). next(pahing,pon).
next(pon,wage). next(wage,kliwon).
next(kliwon,legi).

day(X,1,X).
day(X,2,Y) :- next(X,Y).
day(X,N,Y) :-
  N > 0,
  N1 is N - 1,
  day(X,N1,Z),
  next(Z,Y).

% Problem 3
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

%% Part A
travelable(X,Y) :-
  byCar(X,Y);
  byTrain(X,Y);
  byPlane(X,Y).

travelable(X,Y) :-
  (byCar(X,Z); byTrain(X,Z); byPlane(X,Z)),
  travelable(Z,Y).

%% Part B
travelwhere(X,Y,go(X,Y)) :- 
  byCar(X,Y);
  byPlane(X,Y);
  byTrain(X,Y).

travelwhere(X,Y,go(X,Z,GO)) :- 
  (byCar(X,Z); byTrain(X,Z); byPlane(X,Z)),
  travelwhere(Z,Y,GO).

%% Part C
travelhow(X,Y,go(X,Y,car)) :- 
  byCar(X,Y).
travelhow(X,Y,go(X,Y,plane)) :- 
  byPlane(X,Y).
travelhow(X,Y,go(X,Y,train)) :- 
  byTrain(X,Y).

travelhow(X,Y,go(X,Z,car,GO)) :-
  byCar(X,Z),
  travelhow(Z,Y,GO).

travelhow(X,Y,go(X,Z,plane,GO)) :-
  byPlane(X,Z),
  travelhow(Z,Y,GO).

travelhow(X,Y,go(X,Z,train,GO)) :-
  byTrain(X,Z),
  travelhow(Z,Y,GO).

% Problem 4
gcd(0,0,_) :- write("gcd error").
gcd(X,0,X).
gcd(0,X,X).
gcd(X,X,X).

gcd(A,B,Res) :-
  A >= 0,
  B >= 0, 
  A > B,
  N is A-B,
  gcd(N,B,Res).

gcd(A,B,Res) :-
  A >= 0,
  B >= 0, 
  A < B,
  N is B-A,
  gcd(A,N,Res).

% Problem 5
:- op(650, xfx, suka).
alia suka mie.
alia suka bakso.
alia suka rendang.
alia suka eskrim.
bambang suka bakso.
bambang suka sate.
bambang suka coklat.
bambang suka eskrim.
caca suka sate.
caca suka mie.
caca suka bakso.
caca suka coklat.
dani suka bakso.
dani suka sate.
dani suka rendang.
dani suka eskrim.

:- op(640, xfy, dan).
X suka A dan B :- 
  X suka A,
  X suka B. 

% Problem 6
subfactorial(0, 1).
subfactorial(1, 0).
subfactorial(N, X) :- 
  N > 1, 
  N1 is N-1, 
  N2 is N-2, 
  subfactorial(N1, X1), 
  subfactorial(N2, X2), 
  X is (N-1) * (X1+X2).