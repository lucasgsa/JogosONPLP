avaliacaoToString(avaliacao(UsuarioNome, JogoNome, Nota, Comentario), StringSaida) :-
    colorString(UsuarioNome, "blue", ConcUsuarioNome),
    colorString(" - ", "magenta", ConcTraco), 
    colorString(JogoNome, "red", ConcJogoNome),
    colorString("Comentario: ", "yellow", ConcComentario),
    concatenate([ConcUsuarioNome, ConcTraco, ConcJogoNome, ConcTraco, "Nota: ", Nota, "\n",
        ConcComentario, Comentario, "\n\n"
        ], StringSaida).

getJogoNomeAvaliacao(avaliacao(_,X,_,_), X).
getUsuarioNomeAvaliacao(avaliacao(X,_,_,_), X).

filterAvaliacoesJogo(_, [], []).
filterAvaliacoesJogo(NomeJogoProcurado, [X|XS], AvaliacoesSaida) :-
    getJogoNomeAvaliacao(X, NomeJogoAtual),
    string_lower(NomeJogoAtual, NomeJogoAtualLowerCase),
    string_lower(NomeJogoProcurado, NomeJogoProcuradoLowerCase),
    NomeJogoAtualLowerCase = NomeJogoProcuradoLowerCase -> 
        filterAvaliacoesJogo(NomeJogoProcurado, XS, SaidaProx),
        append([X], SaidaProx, AvaliacoesSaida);

        filterAvaliacoesJogo(NomeJogoProcurado, XS, AvaliacoesSaida).