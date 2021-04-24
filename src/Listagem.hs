module Listagem where
    import Util as Util
    import Jogo as Jogo
    import Avaliacao as Avaliacao

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
    listarJogosPorAnoLancamento listarJogos = listarJogosAux(take 10 (reverse((mergeSort listarJogos))))

    -- tipo 1 - normal, verificando x <= y
    -- tipo 2 - por ano de lançamento
    -- tipo 3 - por nota de avaliação !!!NÃO IMPLEMENTADO!!!
    -- tipo não correto - retorna a lista do jeito que entrou
    -- Ordenação(Merge Sort) - Ordenar pelo tipo passado
    mergeSort :: [Jogo.Jogo] -> [Jogo]
    mergeSort [] = []
    mergeSort xs
        | length xs == 1 = xs
        | otherwise = merge (mergeSort (primeiraParte xs)) (mergeSort (segundaParte xs))

    merge :: [Jogo.Jogo] -> [Jogo] -> [Jogo]
    merge xs [] = xs
    merge [] ys = ys
    merge (x:xs) (y:ys)
        | (Jogo.anoLancamento x <= Jogo.anoLancamento y) = x:merge xs (y:ys)
        | otherwise = y:merge (x:xs) ys

    primeiraParte :: [Jogo] -> [Jogo]
    primeiraParte  xs = let { n = length xs } in take (div n 2) xs

    segundaParte :: [Jogo] -> [Jogo]
    segundaParte xs = let { n = length xs } in drop (div n 2) xs

    -- 9 - Deve ser possível listar as avaliações de um jogo. 
    listarAvaliacoesJogo :: String -> [Jogo] -> [Avaliacao] -> String
    listarAvaliacoesJogo _ _ []= "Não há avaliações no sistema."
    listarAvaliacoesJogo nomeJogo jogos avaliacoes = if (existeJogo nomeJogo jogos)
                                                    then (Util.color "red" True ("Avaliações do jogo "++nomeJogo ++ ":\n")) 
                                                        ++ (Util.color "green" False "Nota média do jogo: " ++ (show (getMediaJogo nomeJogo avaliacoes)) ++ "\n")
                                                        ++ listarAvaliacoesJogoAux nomeJogo avaliacoes
                                                    else (Util.color "red" True ("O jogo "++ nomeJogo ++ " não está cadastrado."))

    existeJogo :: String -> [Jogo] -> Bool
    existeJogo _ [] = False
    existeJogo nomeJogo (x:xs) = if (Jogo.nome x) == nomeJogo
                                then True
                                else existeJogo nomeJogo xs

    listarAvaliacoesJogoAux :: String -> [Avaliacao] -> String
    listarAvaliacoesJogoAux _ [] = ""
    listarAvaliacoesJogoAux nomeJogo (x:xs) = if nomeJogo == (Avaliacao.jogo x)
                                            then show x ++ "\n\n" ++ (listarAvaliacoesJogoAux nomeJogo xs)
                                            else listarAvaliacoesJogoAux nomeJogo xs

    -- Retorna a média de um jogo.
    getMediaJogo :: String -> [Avaliacao] -> Double
    getMediaJogo _ [] = 0.0
    getMediaJogo nomeJogo avaliacoes = do
                                    let aux = getAvaliacoesJogo nomeJogo avaliacoes
                                    if ((snd aux) == 0) then 0.0 else ((fst aux)/ (fromIntegral (snd aux)))

    -- Retorna uma tupla, com o primeiro elemento contendo a soma das notas, e o segundo a quantidade de avaliacoes.
    -- Ou seja, a media é so fazer fst/snd.
    getAvaliacoesJogo :: String -> [Avaliacao] -> (Double, Integer)
    getAvaliacoesJogo _ [] = (0.0, 0)
    getAvaliacoesJogo nomeJogo (x:xs) = do
                                    let atual = (if (nomeJogo) == (Avaliacao.jogo x) then ((Avaliacao.nota x), 1) else (0,0))
                                    ((fst atual) + (fst prox), (snd atual) + (snd prox))
                                    where prox = getAvaliacoesJogo nomeJogo xs

    ordenaAvaliacoes :: [Jogo.Jogo] -> [Avaliacao] -> [Jogo.Jogo]
    ordenaAvaliacoes [] _ = []
    ordenaAvaliacoes (s:xs) z = ordenaAvaliacoes [x|x <- xs, (getMediaJogo (Jogo.nome x) z) < (getMediaJogo (Jogo.nome s) z)] z
        ++ [s] ++
     ordenaAvaliacoes [x|x <- xs,(getMediaJogo (Jogo.nome x) z) >= (getMediaJogo (Jogo.nome s) z)] z    
     
    -- 7. Deve ser possível listar os jogos com melhores avaliações;
    listaAvaliacoesOrdenada :: [Jogo.Jogo] -> [Avaliacao]-> String   
    listaAvaliacoesOrdenada listaJogos listaAvaliacoes = listarJogosAux(reverse (ordenaAvaliacoes listaJogos listaAvaliacoes))  
