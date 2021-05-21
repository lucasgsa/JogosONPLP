:- include('Listagem.pl').

jogos(ListaJogos) :- ListaJogos = [
    jogo("gTerraria", ["Aventuraa", "Abacates"], ["I5"], "PC", 0.0, 1, 2010),
    jogo("fTerraria", ["Aventuraa"], ["I5"], "PC", 0.0, 1, 2009),
    jogo("eTerraria", ["Aventuraa"], ["I5"], "PC", 0.0, 1, 2012),
    jogo("dTerraria", ["Aventuraa"], ["I5"], "PC", 0.0, 1, 2014),
    jogo("cTerraria", ["Aventuraa"], ["I5"], "PC", 0.0, 1, 2007)
].

avaliacoes(ListaAvaliacoes) :- ListaAvaliacoes = [
    avaliacao("Lucas", "gTerraria", 8.2, "Achei bom"),
    avaliacao("Renan", "gTerraria", 8.1, "Meio bla"),
    avaliacao("Lucas", "aTerraria", 10, "Achei muito bom")
].

main :-
    jogos(ListaJogos),
    avaliacoes(ListaAvaliacoes),
    listarAvaliacoesJogo("gterrariA", ListaAvaliacoes, ListaJogos, SaidaString),
    writeln(SaidaString).
