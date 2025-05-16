myAppend([],List,List).
myAppend([H|T],Y,[H|T1]):-
    myAppend(T,Y,T1).

in_list([El|_],El).
in_list([H|T],El):-in_list(T,El).