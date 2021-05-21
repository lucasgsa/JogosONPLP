listToString([], "").
listToString([X], X).
listToString([X|XS], StringSaida) :-
    listToString(XS, SaidaProx),
    concatenate([X,",", SaidaProx], StringSaida).

listContains([],_, 0).
listContains([X|XS], Procurado, Result) :-
    Procurado = X -> Result = 1; 
        listContains(XS, Procurado, Result).

concatenate(StringList, StringResult) :-
    maplist(atom_chars, StringList, Lists),
    append(Lists, List),
    atom_chars(StringResult, List).

reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

take(N, _, Xs) :- N =< 0, !, N =:= 0, Xs = [].
take(_, [], []).
take(N, [X|Xs], [X|Ys]) :- M is N-1, take(M, Xs, Ys).