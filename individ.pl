generate_words(N, K, Filename) :-
    setup_call_cleanup(
        open(Filename, write, Stream),
        (alphabet(Alphabet),
         generate_all_words(N, K, Alphabet, Stream)),
        close(Stream)).

generate_all_words(N, K, Filename, Stream) :-
    
    alphabet(Alphabet),  
    combination(2, Alphabet, [L1, L2]),
    subtract(Alphabet, [L1, L2], RestLetters),
    member(LK, RestLetters),
    numlist(1, N, AllPositions),   
    combination(2, AllPositions, Pos1),    
    subtract(AllPositions, Pos1, RestPos1),
    combination(2, RestPos1, Pos2),    
    subtract(RestPos1, Pos2, RestPos2),
    combination(K, RestPos2, PosK),    
    create_word(N, L1, L2, LK, Pos1, Pos2, PosK, Word),
    atomic_list_concat(Word, '', AtomWord),
    writeln(Stream, AtomWord),
    fail.



alphabet([a,b,c,d,e,f]).


combination(0, _, []) :- !.
combination(K, [H|T], [H|Comb]) :-
    K1 is K - 1,
    combination(K1, T, Comb).
combination(K, [_|T], Comb) :-
    combination(K, T, Comb).


create_word(N, L1, L2, LK, Pos1, Pos2, PosK, Word) :-
    length(Word, N),    
    fill_positions(Word, Pos1, L1),    
    fill_positions(Word, Pos2, L2),    
    fill_positions(Word, PosK, LK),    
    fill_rest(Word, [L1, L2, LK]).

fill_positions(Word, Positions, Letter) :-
    maplist(fill_one_position(Word, Letter), Positions).

fill_one_position(Word, Letter, Pos) :-
    nth1(Pos, Word, Letter).


find_free_positions(Word, FreePositions) :-   
    findall(Pos, (nth1(Pos, Word, X), var(X)), FreePositions).


fill_rest(Word, UsedLetters) :-
    alphabet(Alphabet),
    subtract(Alphabet, UsedLetters, RestLetters),
    find_free_positions(Word, FreePositions),
    length(FreePositions, N),
    length(RestLetters, M),
    M >= N,  
    fill_unique(FreePositions, Word, RestLetters).

fill_unique([], _, _).
fill_unique([Pos|Rest], Word, [Letter|Letters]) :-
    nth1(Pos, Word, Letter),
    fill_unique(Rest, Word, Letters).
fill_unique([Pos|Rest], Word, [_|Letters]) :-
    fill_unique([Pos|Rest], Word, Letters).
