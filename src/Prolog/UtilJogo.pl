jogoToString(jogo(NomeJogo, CategoriasJogo, ReqMinimosJogo, PlataformaJogo, PrecoJogo, IsOnlineJogo, AnoLancamentoJogo), StringSaida) :- 
    tipoIsOnline(IsOnlineJogo, TipoOnline),
    precoString(PrecoJogo, PrecoString),
    listToString(ReqMinimosJogo, ReqMinimosString),
    listToString(CategoriasJogo, CategoriasString),
    concatenate(
        [
        "Titulo: ", NomeJogo, "\n",
        "Plataforma: ", PlataformaJogo, "\n",
        "Requisitos minimos: ", ReqMinimosString, "\n",
        "Generos: ", CategoriasString, "\n",
        "Ano Lancamento: ", AnoLancamentoJogo, "\n",
        TipoOnline, "\n",
        "Preco: ",  PrecoString, "\n\n"
        ]
        , StringSaida).

tipoIsOnline(0, "Um Jogador").
tipoIsOnline(1, "Cooperativo online").
tipoIsOnline(_, "IsOnline nao informado corretamente.").

precoString(X, Y) :-
    X*1.0 =:= 0.0 -> Y = "Gratis";
    atom_concat("R$ ", X, Y).