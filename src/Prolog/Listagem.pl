:- include('UtilJogo.pl').
:- include('Util.pl').

% 3. Deve ser possível listar todos os jogos disponíveis;
listarJogos([], "Nenhum Jogo Encontrado.").
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