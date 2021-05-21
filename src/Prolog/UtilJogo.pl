jogoToString(jogo(NomeJogo, CategoriasJogo, ReqMinimosJogo, PlataformaJogo, PrecoJogo, IsOnlineJogo, AnoLancamentoJogo), StringSaida) :- 
    tipoIsOnline(IsOnlineJogo, TipoOnline),
    precoString(PrecoJogo, PrecoString),
    listToString(ReqMinimosJogo, ReqMinimosString),
    listToString(CategoriasJogo, CategoriasString),
    colorString("Titulo: ", "red", ConcTituloString),
    colorString("Plataforma: ", "green", ConcPlataformaString),
    colorString("Requisitos minimos: ", "green", ConcReqMinimosString),
    colorString("Generos: ", "green", ConcGenerosString),
    colorString("Ano Lancamento: ", "green", ConcAnoLancamentoString),
    colorString(TipoOnline, "yellow", ConcTipoOnline),
    colorString("Preco: ", "red", ConcPrecoString),
    concatenate(
        [
        ConcTituloString, NomeJogo, "\n",
        "   ", ConcPlataformaString, PlataformaJogo, "\n",
        "   ", ConcReqMinimosString, ReqMinimosString, "\n",
        "   ", ConcGenerosString, CategoriasString, "\n",
        "   ", ConcAnoLancamentoString, AnoLancamentoJogo, "\n",
        "   ", ConcTipoOnline, "\n",
        "   ", ConcPrecoString,  PrecoString, "\n\n"
        ]
        , StringSaida).

getCategoriasJogo(jogo(_,X,_,_,_,_,_), X).

tipoIsOnline(0, "Um Jogador").
tipoIsOnline(1, "Cooperativo online").
tipoIsOnline(_, "IsOnline nao informado corretamente.").

precoString(X, Y) :-
    X*1.0 =:= 0.0 -> Y = "Gratis";
    atom_concat("R$ ", X, Y).