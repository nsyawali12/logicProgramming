% prolog animal carnivor or herbivore

plant(grass).
plant(dandelions).
eats(tiger, meat).
eats(lion,meat).
eats(rabbit,veg).
eats(pig,meat).
eats(pig,veg).
animal(pig).
animal(lion).
animal(tiger).
animal(rabbit).

% start up prolog and type in the code below.
% 1. work through the code below and discuss find out what the system
% does.
% 2. What does the line can_eat(X,Y):- type(X, carnivore), animal(Y),
% not(X=Y). mean.
% 3. Add some rule(s) that mean an animal can not eat its own type.
% 4. Add animal (owl) and allow for these can also the cannibals.
% 5. Add plant (fly_trap) and animal (fly) adjust the rules to allow.
% this plant to eat flies.

% define type animal

type(X, omnivore):-
    eats(X,meat),
    eats(X,veg).
type(X, carnivore):-
    eats(X,meat),
    not(type(X,omnivore)).
type(X, herbivore):-
    eats(X,veg).

% define can eats
can_eats(X,Y):-
    type(X, carnivore),
    animal(Y),
    X \== Y.
can_eats(X,Y):-
    type(X, herbivore),
    plant(Y).
can_eats(X,Y):-
    type(X, omnivore),
    plant(Y).
