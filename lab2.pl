max(X, Y, U, Z) :-
    MaxXY is max(X, Y),print(MaxXY),
    U is max(MaxXY, Z).

fact_down(N, X) :- fact_down(N, 1, X).
fact_down(0, Acc, Acc).
fact_down(N, Acc, X) :-
    N > 0,
    NewAcc is Acc * N,
    N1 is N - 1,
    fact_down(N1, NewAcc, X).

fact_up(0, 1).
fact_up(N, X) :-
    N > 0,
    N1 is N - 1,
    fact_up(N1, R),
    X is R * N.

sum_digits_down(N, Sum) :- sum_digits_down(N, 0, Sum).
sum_digits_down(0, Acc, Acc).
sum_digits_down(N, Acc, Sum) :-
    N > 0,
    Digit is N mod 10,
    N1 is N // 10,
    NewAcc is Acc + Digit,
    sum_digits_down(N1, NewAcc, Sum).

sum_digits_up(0, 0).
sum_digits_up(N, Sum) :-
    N > 0,
    Digit is N mod 10,
    N1 is N // 10,
    sum_digits_up(N1, Rest),
    Sum is Rest + Digit.

square_free(N) :- square_free(N, 2).
square_free(_, D) :- D * D > N, !.
square_free(N, D) :-
    0 is N mod (D * D), !, fail.
square_free(N, D) :-
    D1 is D + 1,
    square_free(N, D1).

read_list(List) :-
    write('Enter list length: '),
    read(N),
    read_list(N, List).
read_list(0, []) :- !.
read_list(N, [H|T]) :-
    N > 0,
    read(H),
    N1 is N - 1,
    read_list(N1, T).
write_list([]).
write_list([H|T]) :-
    write(H), write(' '),
    write_list(T).

sum_list_down(List, Sum) :- sum_list_down(List, 0, Sum).
sum_list_down([], Acc, Acc).
sum_list_down([H|T], Acc, Sum) :-
    NewAcc is Acc + H,
    sum_list_down(T, NewAcc, Sum).

sum_list_up([], 0).
sum_list_up([H|T], Sum) :-
    sum_list_up(T, Rest),
    Sum is H + Rest.

remove_by_digit_sum([], _, []).
remove_by_digit_sum([H|T], TargetSum, Result) :-
    sum_digits_up(H, Sum),
    Sum =:= TargetSum,
    remove_by_digit_sum(T, TargetSum, Result).
remove_by_digit_sum([H|T], TargetSum, [H|Result]) :-
    sum_digits_up(H, Sum),
    Sum =\= TargetSum,
    remove_by_digit_sum(T, TargetSum, Result).

