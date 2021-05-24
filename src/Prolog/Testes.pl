:- include('Util.pl').
:- include('Listagem.pl').
:- include('CarregaArquivos.pl').

jogos(ListaJogos) :- ListaJogos = [
    jogo("gTerraria", ["Aventura", "Abacates"], ["I5"], "PC", 0.0, 1, 2010),
    jogo("fTerraria", ["Aventura", "multiplayer", "mundo aberto"], ["I5"], "PC", 0.0, 1, 2009),
    jogo("eTerraria", ["Aventura", "multiplayer"], ["I5"], "PC", 0.0, 1, 2012),
    jogo("dTerraria", ["Aventura", "multiplayer"], ["I5"], "PC", 0.0, 1, 2014),
    jogo("cTerraria", ["Aventura", "Mundo aberto"], ["I5"], "PC", 0.0, 1, 2007)
].

main :-
    listaJogos("dados/jogos.txt", ListaJogos),
    listaAvaliacoes("dados/avaliacoes.txt", ListaAvaliacoes),
    listaUsuarios("dados/usuarios.txt", ListaUsuarios),

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
    %listarAvaliacoesJogo("league of legends", ListaAvaliacoes, ListaJogos, SaidaString),

    %10
    %listarAvaliacoesUsuario("renan", ListaUsuarios, ListaAvaliacoes, SaidaString),

    writeln(SaidaString).
