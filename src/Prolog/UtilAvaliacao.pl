avaliacaoToString(avaliacao(UsuarioNome, JogoNome, Nota, Comentario), StringSaida) :-
    colorString(UsuarioNome, "blue", ConcUsuarioNome),
    colorString(" - ", "magenta", ConcTraco), 
    colorString(JogoNome, "red", ConcJogoNome),
    colorString("Comentario: ", "yellow", ConcComentario),
    format(atom(NotaFormatada), "~1f", [Nota]),
    concatenate([ConcUsuarioNome, ConcTraco, ConcJogoNome, ConcTraco, "Nota: ", NotaFormatada, "\n",
        ConcComentario, Comentario, "\n\n"
        ], StringSaida).

mediaAvaliacoesJogo(NomeJogoProcurado, ListaAvaliacoes, MediaSaida) :-
    filterAvaliacoesJogo(NomeJogoProcurado, ListaAvaliacoes, Avaliacoes),
    somaAvaliacoes(Avaliacoes, SomaAvaliacoes),
    length(Avaliacoes, QtdAvaliacoes),
    MediaSaida is SomaAvaliacoes/QtdAvaliacoes.

somaAvaliacoes([], 0).
somaAvaliacoes([X|XS], SomaSaida) :-
    somaAvaliacoes(XS, SomaProx),
    getNotaAvaliacao(X, NotaAvaliacaoAtual),
    SomaSaida is NotaAvaliacaoAtual + SomaProx.

getJogoNomeAvaliacao(avaliacao(_,X,_,_), X).
getUsuarioNomeAvaliacao(avaliacao(X,_,_,_), X).
getNotaAvaliacao(avaliacao(_,_,X,_), X).

filterAvaliacoesJogo(_, [], []).
filterAvaliacoesJogo(NomeJogoProcurado, [X|XS], AvaliacoesSaida) :-
    getJogoNomeAvaliacao(X, NomeJogoAtual),
    string_lower(NomeJogoAtual, NomeJogoAtualLowerCase),
    string_lower(NomeJogoProcurado, NomeJogoProcuradoLowerCase),
    NomeJogoAtualLowerCase = NomeJogoProcuradoLowerCase -> 
        filterAvaliacoesJogo(NomeJogoProcurado, XS, SaidaProx),
        append([X], SaidaProx, AvaliacoesSaida);

        filterAvaliacoesJogo(NomeJogoProcurado, XS, AvaliacoesSaida).