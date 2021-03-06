% parent(X,Y) denotes that X is one of Y parent
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

% remark1

% define married by having son
married(X,Y):-
    parent(X,Z),
    parent(Y,Z),
    Y \== X.

% define female

female(X):-
    person(X,Y,Z),
    Y == 'female'.

% define male

male(X):-
    person(X,Y,Z),
    Y == 'male'.

% define dad and mom

dad(X,Y):-
    male(X),
    parent(X,Y).

mom(X,Y):-
    female(X),
    parent(X,Y).

% older and younger

older(X,Y,Z):-
    person(X,Y,Z),
    person(A,B,C),
    Z < C,
    X \== A.

younger(X,Y,Z):-
    person(X,Y,Z),
    person(A,B,C),
    Z > C,
    X \== A.

% paklik = uncle
% buklik = aunt
% pakde = uak laki laki
% bukde = uak perempuan

paklik(X,Y):-
    male(X),
    younger(X,Y,Z).

bulik(X,Y):-
    female(X),
    younger(X,Y,Z).
