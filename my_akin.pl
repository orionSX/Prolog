% character(Name, Superhero, Good, SciFiFantasy, Human, MainCharacter)
character('Tony Stark', yes, yes, yes, yes, yes).
character('Darth Vader', no, no, yes, yes, no).
character('Harry Potter', no, yes, yes, yes, yes).
character('Joker', no, no, no, yes, yes).
character('Alien', no, no, yes, no, yes).
character('Captain America', yes, yes, yes, yes, yes).
character('Wonder Woman', yes, yes, yes, yes, yes).
character('Frodo Baggins', no, yes, yes, yes, yes).
character('Gollum', no, no, yes, no, no).
character('Terminator', no, changes, yes, no, yes).
character('Sherlock Holmes', no, yes, no, yes, yes).
character('John Wick', no, yes, no, yes, yes).
character('Hannibal Lecter', no, no, no, yes, yes).
character('Lara Croft', no, yes, no, yes, yes).
character('Legolas', no, yes, yes, no, no).
character('Thor', yes, yes, yes, no, yes).
character('Hulk', yes, yes, yes, yes, yes).
character('Thanos', no, no, yes, no, yes).
character('Neo', no, yes, yes, yes, yes).
character('Jack Sparrow', no, yes, no, yes, yes).
character('Rocky Balboa', no, yes, no, yes, yes).
character('Luke Skywalker', no, yes, yes, yes, yes).
character('Spider-Man', yes, yes, yes, yes, yes).
character('Predator', no, no, yes, no, yes).
character('Batman', yes, yes, yes, yes, yes).

start :-
    write('Answer "yes" or "no" '), nl,
    question1(Superhero, Super),
    question2(Good, Good),
    question3(SciFiFantasy, Fant),
    question4(Human, Human),
    question5(MainCharacter, Main),
    character(Name, Super, Good, Fant, Human, Main),
    format('Your char: ~w~n', [Name]), !.

start :-
    write('No character found.').

question1(Superhero, Ans) :-
    write('Is your character superhero? '), read(Ans).

question2(Good, Ans) :-
    write('Is your character good? '), read(Ans).

question3(SciFiFantasy, Ans) :-
    write('Is your character from fantasy or sci-fi? '), read(Ans).

question4(Human, Ans) :-
    write('Is your character human? '), read(Ans).

question5(MainCharacter, Ans) :-
    write('Is your character main one? '), read(Ans).
