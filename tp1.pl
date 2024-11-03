father(john , jim).
father(jack , john).
father(ramy , younes).
mother(jane , jim).

parent(P1 , P2):- father(P1 , P2).
parent(P1 , P2):- mother(P1 , P2).

grandparent(P1 , P2):- parent(P3 , P2) , parent(P1 , P3).
