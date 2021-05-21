insert_sort(1, List,Sorted):-
    i_sort(1, List,[],Sorted).

i_sort(_, [],Acc,Acc).
i_sort(X, [H|T],Acc,Sorted):-
    insert(X, H,Acc,NAcc),i_sort(X, T,NAcc,Sorted).
   
insert(1, X,[Y|T],[Y|NT]) :-
    getAnoLancamentoJogo(X, AnoX),
    getAnoLancamentoJogo(Y, AnoY),
    AnoX>AnoY,insert(1, X,T,NT).
insert(1, X,[Y|T],[X,Y|T]) :-
    getAnoLancamentoJogo(X, AnoX),
    getAnoLancamentoJogo(Y, AnoY),
    AnoX=<AnoY.
insert(_, X,[],[X]).