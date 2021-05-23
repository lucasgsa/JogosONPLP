construirUsuario(Nome, usuario(Nome)).

getNomeUsuario(usuario(Nome), Nome).

existeUsuario(_, [], 0).
existeUsuario(NomeUsuarioProcurado, [X|XS], Resposta) :-
    getNomeUsuario(X, NomeUsuarioAtual),
    string_lower(NomeUsuarioAtual, NomeUsuarioAtualLowerCase),
    string_lower(NomeUsuarioProcurado, NomeUsuarioProcuradoLowerCase),
    NomeUsuarioAtualLowerCase = NomeUsuarioProcuradoLowerCase ->
        Resposta = 1;
        existeUsuario(NomeUsuarioProcurado, XS, Resposta).