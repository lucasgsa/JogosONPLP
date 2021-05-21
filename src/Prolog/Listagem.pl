:- include('UtilColor.pl').
:- include('UtilJogo.pl').
:- include('Util.pl').

% 3. Deve ser possível listar todos os jogos disponíveis;
listarJogos([], Saida) :-
    colorString("Nenhum Jogo Encontrado", "red", Saida).
listarJogos(ListaJogos, StringSaida) :- listarJogosAux(ListaJogos, StringSaida).

listarJogosAux([], StringSaida) :- StringSaida = "".
listarJogosAux([X|XS], StringSaida) :- 
    jogoToString(X, JogoString), 
    listarJogosAux(XS, ResultProx),
    atom_concat(JogoString, ResultProx, StringSaida).  

%  4. Deve ser possível listar os últimos jogos cadastrados no sistema;
listarUltimosJogosCadastrados(ListaJogos, StringSaida) :-
    reverse(ListaJogos, ListaJogosInvertida),
    take(5, ListaJogosInvertida, UltimosJogos),
    listarJogos(UltimosJogos, StringSaida).

% 5. Deve ser possível listar os jogos por categoria;
listarJogosCategoria(CategoriaProcurada, ListaJogos, StringSaida) :-
    filterCategorias(CategoriaProcurada, ListaJogos, JogosFiltrados),
    listarJogos(JogosFiltrados, StringSaida).

filterCategorias(_, [], []).
filterCategorias(CategoriaProcurada, [X|XS], JogosSaida) :-
    getCategoriasJogo(X, CategoriasJogo),
    listContains(CategoriasJogo, CategoriaProcurada, ContemCategoria),
    ContemCategoria =:= 1 -> 
        filterCategorias(CategoriaProcurada, XS, SaidaProxima),
        append([X], SaidaProxima, JogosSaida); 

        filterCategorias(CategoriaProcurada, XS, SaidaProxima),
        JogosSaida = SaidaProxima.

% 6. Deve ser possível listar os jogos em ordem de lançamento.
listarJogosOrdemLancamento(ListaJogos, StringSaida) :-
    ano_lancamento_insert_sort(ListaJogos, ListaOrdenada),
    reverse(ListaOrdenada, ListaOrdenadaInvertida),
    listarJogos(ListaOrdenadaInvertida, StringSaida).
