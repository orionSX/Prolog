% ------- Построение объектов --------
build_objects(permutation, Alphabet, _, Result) :-
    findall(P, permutation(Alphabet, P), Result).

build_objects(arrangement_no_repeat, Alphabet, K, Result) :-
    findall(A, arrangement_no_repeat(Alphabet, K, A), Result).

build_objects(arrangement_repeat, Alphabet, K, Result) :-
    findall(A, arrangement_repeat(Alphabet, K, A), Result).

build_objects(combination_no_repeat, Alphabet, K, Result) :-
    findall(C, combination_no_repeat(K, Alphabet, C), Result).

build_objects(combination_repeat, Alphabet, K, Result) :-
    findall(C, combination_repeat(K, Alphabet, C), Result).

% ------- Перестановки (перемешивание всех) -------
permutation([], []).
permutation(L, [X|T]) :-
    select(X, L, R),
    permutation(R, T).

% ------- Размещения без повторений -------
arrangement_no_repeat(_, 0, []).
arrangement_no_repeat(L, K, [X|T]) :-
    K > 0,
    select(X, L, R),
    K1 is K - 1,
    arrangement_no_repeat(R, K1, T).

% ------- Размещения с повторениями -------
arrangement_repeat(_, 0, []).
arrangement_repeat(L, K, [X|T]) :-
    K > 0,
    member(X, L),
    K1 is K - 1,
    arrangement_repeat(L, K1, T).

% ------- Сочетания без повторений -------
combination_no_repeat(0, _, []).
combination_no_repeat(K, [X|T], [X|R]) :-
    K > 0,
    K1 is K - 1,
    combination_no_repeat(K1, T, R).
combination_no_repeat(K, [_|T], R) :-
    K > 0,
    combination_no_repeat(K, T, R).

% ------- Сочетания с повторениями -------
combination_repeat(0, _, []).
combination_repeat(K, [X|T], [X|R]) :-
    K > 0,
    K1 is K - 1,
    combination_repeat(K1, [X|T], R).
combination_repeat(K, [_|T], R) :-
    K > 0,
    combination_repeat(K, T, R).


subset([], []).  
subset([H|T], [H|S]) :- subset(T, S).  
subset([_|T], S) :- subset(T, S).  
