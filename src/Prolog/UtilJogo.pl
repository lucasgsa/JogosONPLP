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
getAnoLancamentoJogo(jogo(_,_,_,_,_,_,X), X).

tipoIsOnline(0, "Um Jogador").
tipoIsOnline(1, "Cooperativo online").
tipoIsOnline(_, "IsOnline nao informado corretamente.").

precoString(X, Y) :-
    X*1.0 =:= 0.0 -> Y = "Gratis";
    atom_concat("R$ ", X, Y).

ano_lancamento_insert_sort(List,Sorted):-
    ano_lancamento_i_sort(List,[],Sorted).
ano_lancamento_i_sort([],Acc,Acc).
ano_lancamento_i_sort([H|T],Acc,Sorted):-
    ano_lancamento_insert(H,Acc,NAcc),ano_lancamento_i_sort(T,NAcc,Sorted).
   
ano_lancamento_insert(X,[Y|T],[Y|NT]) :-
    getAnoLancamentoJogo(X, AnoX),
    getAnoLancamentoJogo(Y, AnoY),
    AnoX>AnoY,ano_lancamento_insert(X,T,NT).
ano_lancamento_insert(X,[Y|T],[X,Y|T]) :-
    getAnoLancamentoJogo(X, AnoX),
    getAnoLancamentoJogo(Y, AnoY),
    AnoX=<AnoY.
ano_lancamento_insert(X,[],[X]).