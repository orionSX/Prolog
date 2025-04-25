men():-man(X),print(X),nl,fail.
women():-woman(X),print(X),nl,fail.
parent(X):-parent(X,Y),print(Y),nl,fail.
mother(X,Y):-parent(X,Y),woman(X),nl.
mother(X):-mother(Y,X),woman(Y),print(Y).
brother(X,Y):-parent(Z,X),parent(Z,Y),man(X),Y\=X.
brothers(X):-man(Z),parent(Z,X),parent(Z,Y),man(Y),Y\=X,print(Y),nl,fail.
b_s(X,Y):-man(Z),parent(Z,X),parent(Z,Y),Y\=X.
b_s(X):-b_s(X,Y),print(Y),nl,fail.

son(X,Y):-man(X),parent(Y,X).
son(X):-parent(X,Y),man(Y),print(Y),nl,fail.
husband(X,Y):-man(X),woman(Y),parent(X,Z),parent(Y,Z).
husband(X):-husband(Y,X),print(Y).

grand_pa(X,Y):-man(X),parent(X,Z),parent(Z,Y).
grand_pas(X):-grand_pa(Y,X),print(Y),nl,fail.
grand_pa_and_da(X,Y):-grand_pa(X,Y),woman(Y);grand_pa(Y,X),woman(X).
aunt(X,Y):-woman(X),parent(Z,Y),b_s(X,Z).
aunts(X):-aunt(Y,X),print(Y),nl,fail.