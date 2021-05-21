:- include('Listagem.pl').

jogos(ListaJogos) :- ListaJogos = [
    jogo("gTerraria", ["Aventuraa", "Abacates"], ["I5"], "PC", 0.0, 1, 2010),
    jogo("fTerraria", ["Aventuraa"], ["I5"], "PC", 0.0, 1, 2009),
jogo("eTerraria", ["Aventuraa"], ["I5"], "PC", 0.0, 1, 2012),
jogo("dTerraria", ["Aventuraa"], ["I5"], "PC", 0.0, 1, 2014),
jogo("cTerraria", ["Aventuraa"], ["I5"], "PC", 0.0, 1, 2007)
].

main :-
    jogos(ListaJogos),
    listarJogosCategoria("abAcaTes", ListaJogos, SaidaString),
    writeln(SaidaString).
