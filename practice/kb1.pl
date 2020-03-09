woman(yolanda).
woman(mia).

woman(jody).
playAirGuitar(jody).
listensToMusic(mia).
happy(yolanda).
playsAirGuitar(mia) :- listensToMusic(mia).
playsAirGuitar(yolanda) :- listensToMusic(yolanda).
listensToMusic(yolanda):- happy(yolanda).

happy(vincent).
listensToMusic(butch).
playsAirGuitar(vincent):- listensToMusic(vincent),happy(vincent).
playsAirGuitar(butch):- happy(butch).
playsAirGuitar(butch):- listensToMusic(butch).

loves(vincent,mia).
loves(marcellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).


jealous(X,Y):- loves(X,Z),loves(Y,Z), X\==Y.
is_jealous(X):- jealous(X,Y).

wizard(harry).
wizard(ron).
wizard(hermione).
muggle(uncle_vernon).
muggle(aunt_petunia).
chases(crookshanks, scabbars).

eating(dudley).
happy(aunt_petunia) :- happy(dudley).
happy(uncle_vernon) :- happy(dudley), unhappy(harry).
happy(dudley) :- kicking(dudley,harry).
happy(dudley) :- eating(dudley).

father(albert,james).
father(james,harry).
mother(ruth,james).
mother(lili,harry).
wizard(lili).
wizard(ruth).
wizard(albert).
wizard(X):-
    father(Y,X),wizard(Y),
    mother(Z,X),wizard(Z).
mother_and_wizard(X,Y):- wizard(X),mother(X,Y),wizard(Y).
