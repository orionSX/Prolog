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

max_digit_up(0, 0).
max_digit_up(N, Max) :-
    D is N mod 10,
    N1 is N // 10,
    max_digit_up(N1, R),
    Max is max(D, R).

max_digit_down(N, Max) :- max_digit_down(N, 0, Max).
max_digit_down(0, Acc, Acc).
max_digit_down(N, Acc, Max) :-
    D is N mod 10,
    NewAcc is max(D, Acc),
    N1 is N // 10,
    max_digit_down(N1, NewAcc, Max).


min_odd_digit(N, Min) :- min_odd_digit(N, 10, Min).


min_odd_digit(0, 10, _) :- !, fail.

min_odd_digit(0, Acc, Acc).


min_odd_digit(N, Acc, Min) :-
    D is N mod 10,
    N1 is N // 10,
    (D mod 2 =:= 1, D < Acc -> NewAcc = D ; NewAcc = Acc),
    min_odd_digit(N1, NewAcc, Min).


read_input(List, Index) :-
    write('Введите список: '), read(List),
    write('Введите индекс: '), read(Index).


is_global_min(List, Index) :-
    nth0(Index, List, Elem),        
    min_list(List, Elem).           


show_result(true) :-
    write('Элемент по индексу — глобальный минимум'), nl.
show_result(false) :-
    write('Элемент по индексу — НЕ глобальный минимум'), nl.


run_task_15 :-
    read_input(List, Index),
    (is_global_min(List, Index) -> show_result(true) ; show_result(false)).

read_list(List) :-
    write('Введите список: '), read(List).


swap_min_max(List, Result) :-
    min_list(List, Min), max_list(List, Max),
    maplist(swap(Min, Max), List, Result).

swap(Min, Max, X, Y) :-
    (X =:= Min -> Y = Max ;
     X =:= Max -> Y = Min ;
     Y = X).


print_list(List) :-
    write('Результат: '), write(List), nl.


run_task_17 :-
    read_list(List),
    swap_min_max(List, Result),
    print_list(Result).


read_list_and_interval(List, A, B) :-
    write('Введите список: '), read(List),
    write('Введите границу A: '), read(A),
    write('Введите границу B: '), read(B).


max_in_interval(List, A, B) :-
    max_list(List, Max),
    Max >= A, Max =< B.


show_interval_result(true) :-
    write('Максимум входит в интервал'), nl.
show_interval_result(false) :-
    write('Максимум НЕ входит в интервал'), nl.


run_task_29 :-
    read_list_and_interval(List, A, B),
    (max_in_interval(List, A, B) -> show_interval_result(true) ; show_interval_result(false)).


solve_zxc :-   
    People = [[voronov, Vor], [pavlov, Pav], [levitsky, Lev], [sakharov, Sah]],


    
    permutation([dancer, painter, singer, writer], [Vor, Pav, Lev, Sah]),

   
    Vor \= singer,
   
    Lev \= singer,
  

   
    Pav \= painter,
 
    member([WriterName, writer], People),
    
   
    WriterName \= pavlov,
  

    member([PainterName, painter], People),
  
   
    PainterName \= WriterName,
       
   

   
    print_people(People).


print_people([]).
print_people([[Name, Profession] | Rest]) :-
    format('~w is the ~w.~n', [Name, Profession]),
    print_people(Rest).


count_divisors_not_div3(N, Count) :- count_divisors_not_div3(N, 1, 0, Count).
count_divisors_not_div3(N, D, Acc, Count) :-
    D =< N,
    N mod D =:= 0,
    D mod 3 =\= 0,
    Acc1 is Acc + 1,
    D1 is D + 1,
    count_divisors_not_div3(N, D1, Acc1, Count).
count_divisors_not_div3(N, D, Acc, Count) :-
    D =< N,
    (N mod D =\= 0 ; D mod 3 =:= 0),
    D1 is D + 1,
    count_divisors_not_div3(N, D1, Acc, Count).
count_divisors_not_div3(N, D, Acc, Acc) :- D > N.

read_number(N) :-
    write('Enter a number: '),
    read(N).

print_divisors_count :-
    read_number(N),
    count_divisors_not_div3(N, Count),
    write('Count of divisors not divisible by 3: '), write(Count), nl.


sum_digits(0, 0).
sum_digits(N, Sum) :-
    D is N mod 10,
    N1 is N // 10,
    sum_digits(N1, Rest),
    Sum is Rest + D.


prod_digits(0, 1).
prod_digits(N, Prod) :-
    D is N mod 10,
    N1 is N // 10,
    prod_digits(N1, Rest),
    Prod is Rest * D.


gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :-
    Y > 0,
    R is X mod Y,
    gcd(Y, R, G).

coprime(A, B) :- gcd(A, B, 1).

sum_special_divisors(N, Sum) :-
    sum_digits(N, SumD),
    prod_digits(N, ProdD),
    sum_special_divisors(N, 1, SumD, ProdD, 0, Sum).

sum_special_divisors(N, D, SumD, ProdD, Acc, Sum) :-
    D =< N,
    N mod D =:= 0,
    coprime(D, SumD),
    \+ coprime(D, ProdD),
    Acc1 is Acc + D,
    D1 is D + 1,
    sum_special_divisors(N, D1, SumD, ProdD, Acc1, Sum).
sum_special_divisors(N, D, SumD, ProdD, Acc, Sum) :-
    D =< N,
    (N mod D =\= 0 ; \+ coprime(D, SumD) ; coprime(D, ProdD)),
    D1 is D + 1,
    sum_special_divisors(N, D1, SumD, ProdD, Acc, Sum).
sum_special_divisors(N, D, SumD, ProdD, Acc, Sum) :- D > N, Sum = Acc.


print_special_divisor_sum :-
    read_number(N),
    sum_special_divisors(N, Sum),
    write('Special divisor sum: '), write(Sum), nl.
