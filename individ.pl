
generate_words(N, K, Filename) :-
    open(Filename, write, Stream),
    alphabet(Alphabet),
    findall(Word, valid_word(N, K, Alphabet, Word), Words),
    write_words(Stream, Words),
    close(Stream).


alphabet([a,b,c,d,e,f]).


valid_word(N, K, Alphabet, Word) :-
    length(Word, N),
    maplist(member_letter(Alphabet), Word),
    msort(Word, Sorted),                % Сортируем для подсчета
    encode_counts(Sorted, Counts),      % Получаем частоты вида [a-1, b-2, ...]
    check_counts(Counts, K).


member_letter(Alphabet, X) :- member(X, Alphabet).


encode_counts([], []).
encode_counts([H|T], [H-N|R]) :-
    count_same(H, [H|T], N, Rest),
    encode_counts(Rest, R).


count_same(_, [], 0, []).
count_same(X, [X|T], N, Rest) :-
    count_same(X, T, N1, Rest),
    N is N1 + 1.
count_same(X, [Y|T], 0, [Y|T]) :- X \= Y.


check_counts(Counts, K) :-
    include(has_count(2), Counts, TwoTwos),
    include(has_count(K), Counts, OneK),
    length(TwoTwos, 2),
    length(OneK, 1),
    \+ (member(_-Count, Counts), Count > 1, Count \= 2, Count \= K).


has_count(C, _-C).


write_words(_, []).
write_words(Stream, [W|Ws]) :-
    print(W),
    atomic_list_concat(W, '', Atom),
    writeln(Stream, Atom),
    write_words(Stream, Ws).
