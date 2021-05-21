:- include('Listagem.pl').

jogos(ListaJogos) :- ListaJogos = [
    jogo("gTerraria", ["Aventuraa", "Abacates"], ["I5"], "PC", 0.0, 1, 2009),
    jogo("fTerraria", ["Aventuraa"], ["I5"], "PC", 0.0, 1, 2009)
].

main :-
    jogos(ListaJogos),
    listarJogosCategoria("Aventuraa", ListaJogos, SaidaString),
    writeln(SaidaString).
