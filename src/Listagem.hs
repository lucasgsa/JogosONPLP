module Listagem where
    import Util as Util
    import Jogo as Jogo

    -- 3. Deve ser possível listar todos os jogos disponíveis
    listarJogos :: [Jogo.Jogo] -> String
    listarJogos [] = "Nenhum jogo encontrado."
    listarJogos x = (Util.color "blue" True ("Todos os jogos: ")) ++ "\n" ++ listarJogosAux x

    listarJogosAux :: [Jogo.Jogo] -> String 
    listarJogosAux [] = ""
    listarJogosAux (x:[]) = show x
    listarJogosAux (x:xs) = (show x) ++ "\n\n" ++ listarJogosAux xs

    -- 5. Deve ser possível listar os jogos por categoria;
    listarJogosCategoria :: String -> [Jogo.Jogo] -> String
    listarJogosCategoria categoria listaJogos = (Util.color "blue" True ("Jogos da categoria "++categoria++": ")) ++ "\n"
                                                ++listarJogosAux (filterCategoria categoria listaJogos)

    filterCategoria :: String -> [Jogo.Jogo] -> [Jogo.Jogo]
    filterCategoria categoria listaJogos = [ x | x <- listaJogos, (categoriaContem categoria x)]

    categoriaContem :: String -> Jogo -> Bool
    categoriaContem categoria jogo = categoria `elem` (Jogo.categorias jogo)