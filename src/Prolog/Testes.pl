:- include('Listagem.pl').

jogos(ListaJogos) :- ListaJogos = [
    jogo("gTerraria", ["Aventura"], ["I5"], "PC", 0.0, 1, 2009),
    jogo("fTerraria", ["Aventura"], ["I5"], "PC", 0.0, 1, 2009),
    jogo("eTerraria", ["Aventura"], ["I5"], "PC", 0.0, 1, 2009),
    jogo("dTerraria", ["Aventura"], ["I5"], "PC", 0.0, 1, 2009),
    jogo("cTerraria", ["Aventura"], ["I5"], "PC", 0.0, 1, 2009),
    jogo("bTerraria", ["Aventura"], ["I5"], "PC", 0.0, 1, 2009),
    jogo("aTerraria", ["Aventura"], ["I5"], "PC", 0.0, 1, 2009)
].

main :-
    jogos(ListaJogos),
    listarUltimosJogosCadastrados(ListaJogos, SaidaString),
    writeln(SaidaString).
