% Male(x) states that x is a male.
% /* Bob, Charlie, David, Hans, & Jim Are Male */
male(bob).
male(charlie).
male(david).
male(hans).
male(jim).
% female(x) states that x is a female.
% /* Alice, Emma, fiona, Grace, Irene, Kelly, & Lily are female */
female(alice).
female(emma).
female(fiona).
female(grace).
female(irene).
female(kelly).
female(lily).
% parent(x,y) states that x is a parent of y
parent(alice,charlie).
parent(bob,charlie).
parent(bob,emma).
parent(charlie,fiona).
parent(charlie,grace).
parent(emma,irene).
parent(fiona,david).
parent(fiona,lily).
parent(grace,jim).
parent(grace,kelly).
parent(hans,jim).
parent(hans,kelly).
% adult(x) states that x is an adult.
% Alice, Bob, Charlie, Emma, Fiona, Grace, & Hans are adults.
adult(alice).
adult(bob).
gentleman(X):- male(X),adult(X).
lady(X):- female(X),adult(X).
teen_boy(X):- male(X),teen(X).
teen_girl(X):- female(X),teen(X).
little_boy(X):- male(X),kid(X).
little_girl(X):- female(X),kid(X).
adult(charlie).
adult(emma).
adult(fiona).
adult(grace).
adult(hans).
% teen(x) states that x is a teenager.
% Irene, David, & Lily are teenagers.
teen(irene).
teen(david).
teen(lily).
% kid(x) states that x is a little child.
% Jim & Kelly are little children.
kid(jim).
kid(kelly).
loves_FIFA17(X):- teen_boy(X); little_boy(X).
loves_CandyCrush(X):- teen_girl(X); little_girl(X).
child(X,Y):- parent(Y,X).
father(X,Y):- parent(X,Y),male(X).
mother(X,Y):- parent(X,Y),female(X).
grandparent(X,Y):- parent(X,Z),parent(Z,Y).
grandchild(X,Y):- grandparent(Y,X).

grandfather(X,Y):- grandparent(X,Y),male(X).
grandmother(X,Y):- grandparent(X,Y),female(X).

has_a_child(X):- parent(X,_).

is_a_daddy(X):- father(X,_Y).
is_a_mommy(X):- mother(X,_Y).

sibling(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    X \== Y.

cousin(X,Y):-
    parent(Z,X),
    parent(U,Y),
    sibling(Z,U).


uncle(X,Y):-
    cousin(Z,Y),
    parent(X,Z),
    male(X).

aunt(X,Y):-
    cousin(Z,Y),
    parent(X,Z),
    female(X).












