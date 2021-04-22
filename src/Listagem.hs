module Listagem where
    import Util as Util
    import Jogo as Jogo

    -- 3. Deve ser possível listar todos os jogos disponíveis
    listarJogos :: [Jogo.Jogo] -> String
    listarJogos x = (Util.color "blue" True ("Todos os jogos: ")) ++ "\n" ++ listarJogosAux x

    listarJogosAux :: [Jogo.Jogo] -> String 
    listarJogosAux [] = "Nenhum jogo encontrado."
    listarJogosAux (x:[]) = show x
    listarJogosAux (x:xs) = (show x) ++ "\n\n" ++ listarJogosAux xs

    -- 4. Deve ser possível listar os últimos jogos cadastrados no sistema;
    listarUltimosJogos :: [Jogo.Jogo ] -> String
    listarUltimosJogos listaJogos = listarJogosAux(take 5 (reverse listaJogos))

    -- 5. Deve ser possível listar os jogos por categoria;
    listarJogosCategoria :: [Char] -> [Jogo] -> [Char]
    listarJogosCategoria categoria listaJogos = (Util.color "blue" True ("Jogos da categoria "++categoria++": ")) ++ "\n"
                                                ++listarJogosAux (filterCategoria categoria listaJogos)

    filterCategoria :: String -> [Jogo.Jogo] -> [Jogo.Jogo]
    filterCategoria categoria listaJogos = [ x | x <- listaJogos, (categoriaContem categoria x)]

    categoriaContem :: String -> Jogo -> Bool
    categoriaContem categoria jogo = categoria `elem` (Jogo.categorias jogo)

    -- 6. Deve ser possível listar os jogos em ordem de lançamento.

    listarJogosPorAnoLancamento :: [Jogo.Jogo ] -> String
    listarJogosPorAnoLancamento listarJogos = listarJogosAux(take 10 (reverse((sortBy listarJogos 2))))

    -- tipo 1 - normal, verificando x <= y
    -- tipo 2 - por ano de lançamento
    -- tipo 3 - por nota de avaliação !!!NÃO IMPLEMENTADO!!!
    -- tipo não correto - retorna a lista do jeito que entrou
    -- Ordenação(Merge Sort) - Ordenar pelo tipo passado
    sortBy :: [Jogo.Jogo] -> Integer -> [Jogo]
    sortBy [] tipo = []
    sortBy xs tipo
        | length xs == 1 = xs
        | tipo == 1 = merge (sortBy (primeiraParte xs) tipo) (sortBy (segundaParte xs) tipo)
        | tipo == 2 = mergeByAnoLancamento (sortBy (primeiraParte xs) tipo) (sortBy (segundaParte xs) tipo)
        | otherwise = xs

    merge :: [Jogo.Jogo] -> [Jogo] -> [Jogo]
    merge xs [] = xs
    merge [] ys = ys
    merge (x:xs) (y:ys)
        | (Jogo.anoLancamento x <= Jogo.anoLancamento y) = x:merge xs (y:ys)
        | otherwise = y:merge (x:xs) ys

    mergeByAnoLancamento :: [Jogo.Jogo] -> [Jogo] -> [Jogo]
    mergeByAnoLancamento xs [] = xs
    mergeByAnoLancamento [] ys = ys
    mergeByAnoLancamento (x:xs) (y:ys)
        | (Jogo.anoLancamento x <= Jogo.anoLancamento y) = x:mergeByAnoLancamento xs (y:ys)
        | otherwise = y:mergeByAnoLancamento (x:xs) ys

    primeiraParte :: [Jogo] -> [Jogo]
    primeiraParte  xs = let { n = length xs } in take (div n 2) xs

    segundaParte :: [Jogo] -> [Jogo]
    segundaParte xs = let { n = length xs } in drop (div n 2) xs


