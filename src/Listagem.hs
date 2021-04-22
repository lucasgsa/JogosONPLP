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

    -- 6. Deve ser possível listar os últimos jogos lançados

    listarJogosLancados :: [Jogo.Jogo ] -> String
    listarJogosLancados listarJogos = listarJogosAux(take 10 (reverse((mergeSort listarJogos))))

    -- Ordenação(Merge Sort)

    merge :: [Jogo.Jogo] -> [Jogo] -> [Jogo]
    merge xs [] = xs
    merge [] ys = ys
    merge (x:xs) (y:ys) 
        |  Jogo.anoLancamento x <= Jogo.anoLancamento y = x:merge xs (y:ys)
        | otherwise = y:merge (x:xs) ys

    mergeSort :: [Jogo.Jogo] -> [Jogo]
    mergeSort [] = []
    mergeSort xs 
        | length xs == 1 = xs
        | otherwise =  merge (mergeSort (primeiraParte xs)) (mergeSort (segundaParte xs))

    primeiraParte :: [Jogo] -> [Jogo]
    primeiraParte  xs = let { n = length xs } in take (div n 2) xs

    segundaParte :: [Jogo] -> [Jogo]
    segundaParte xs = let { n = length xs } in drop (div n 2) xs


