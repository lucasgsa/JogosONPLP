:- include('Listagem.pl').

jogos(ListaJogos) :- ListaJogos = [
    jogo("gTerraria", ["Aventura", "Abacates"], ["I5"], "PC", 0.0, 1, 2010),
    jogo("fTerraria", ["Aventura", "multiplayer", "mundo aberto"], ["I5"], "PC", 0.0, 1, 2009),
    jogo("eTerraria", ["Aventura", "multiplayer"], ["I5"], "PC", 0.0, 1, 2012),
    jogo("dTerraria", ["Aventura", "multiplayer"], ["I5"], "PC", 0.0, 1, 2014),
    jogo("cTerraria", ["Aventura", "Mundo aberto"], ["I5"], "PC", 0.0, 1, 2007)
].

avaliacoes(ListaAvaliacoes) :- ListaAvaliacoes = [
    avaliacao("Lucas", "gTerraria", 8.2, "Achei bom"),
    avaliacao("Renan", "gTerraria", 8.1, "Meio bla"),
    avaliacao("Lucas", "cTerraria", 10, "Achei muito bom")
].

main :-
    jogos(ListaJogos),
    avaliacoes(ListaAvaliacoes),

    %3
    %listarJogos(ListaJogos, SaidaString),

    %4
    %listarUltimosJogosCadastrados(ListaJogos, SaidaString),

    %5
    %listarJogosCategoria("mundo aberto", ListaJogos, SaidaString),

    %6
    %listarJogosOrdemLancamento(ListaJogos, SaidaString),

    %7
    %listarJogoOrdemAvaliacoes(ListaJogos, ListaAvaliacoes, SaidaString),

    %8
    %listarAvaliacoesJogo("gterraria", ListaAvaliacoes, ListaJogos, SaidaString),

    %10
    listarAvaliacoesUsuario("renan", ListaAvaliacoes, SaidaString),

    writeln(SaidaString).
