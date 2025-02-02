:- dynamic footballer/4.

footballer('Vini Jr.', 24, 'LW', 90).
footballer('Jude Bellingham', 21, 'CAM', 90).
footballer('Kylian Mbappe', 25, 'ST', 91).
footballer('Kevin De Bruyne', 33, 'CM', 90).
footballer('Dusan Tadic', 35, 'LW', 83).
footballer('Edin Dzeko', 38, 'ST', 82).
footballer('Mauro Icardi', 31, 'ST', 83).
footballer('Neymar Jr', 32, 'LW', 87).
footballer('Rafael Leao', 25, 'LW', 86).
footballer('Jack Grealish', 29, 'LW', 84).
footballer('Yannick Carrasco', 31, 'LW', 83).
footballer('Harvey Barnes', 26, 'LW', 80).
footballer('Jeremy Doku', 22, 'LW', 80).
footballer('Joao Felix', 24, 'LW', 80).


footballerFinder(Position, AgeLimit, OverallMin) :-
    write('Searching for players with criteria: '), nl,
    write('Position: '), write(Position), nl,
    write('Age less than: '), write(AgeLimit), nl,
    write('Overall greater than: '), write(OverallMin), nl,
    nl,
    findall(Name, (footballer(Name, Age, Position, Overall),
                   Age < AgeLimit, 
                   Overall > OverallMin),
            Players),
    (   Players \= [] -> 
        printPlayers(Players)
    ;   write('No players found matching the criteria.'), nl
    ).


printPlayers([]) :- !.
printPlayers([H|T]) :-
    write('Player: '), write(H), nl,
    printPlayers(T).


start :-
    nl, write('--- Footballer Finder Program ---'), nl,
    write('1. Find players based on criteria'), nl,
    write('2. Exit'), nl,
    write('Enter your choice: '), nl,
    read(Choice),
    handleChoice(Choice).


handleChoice(1) :-
    
    Position = 'LW',
    AgeLimit = 27,
    OverallMin = 80,
    footballerFinder(Position, AgeLimit, OverallMin), 
    start.

handleChoice(2) :-
    write('Exiting the program...'), nl, !.

handleChoice(_) :-
    write('Invalid choice, please try again.'), nl,
    start.






