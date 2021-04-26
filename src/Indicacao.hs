module Indicacao where
    import Util
    import Jogo
    import Avaliacao
    import Listagem
    import Data.List.Split (splitOn)

    -- 10 -- Um usuário poderá pedir uma indicação de um jogo
    pedirIndicacao :: String -> [Avaliacao] -> [Jogo] -> String
    pedirIndicacao nomeUser avaliacoes jogos = show (indicarJogo nomeUser avaliacoes jogos)


    indicarJogo :: String -> [Avaliacao] -> [Jogo] -> Jogo
    indicarJogo nomeUser avaliacoes jogos = do 
                                            let jogosNaoAvaliados = retiraAvaliado jogos avaliacoes nomeUser
                                            let tupla = geraTuplaPontuacao (Listagem.ordenaAvaliacoes jogosNaoAvaliados avaliacoes)
                                            let tuplaFinal = adicionarSimilaridadesLista nomeUser avaliacoes jogos tupla
                                            fst ((reverse (ordenaTupla tuplaFinal))!!0)  

    ordenaTupla :: [(Jogo, Double)] -> [(Jogo, Double)]
    ordenaTupla [] = []
    ordenaTupla (s:xs) = ordenaTupla [x | x <- xs, (snd x) < (snd s)]
                        ++ [s] ++
                         ordenaTupla [x | x <- xs, (snd x) >= (snd s)]

    adicionarSimilaridadesLista :: String -> [Avaliacao] -> [Jogo] -> [(Jogo, Double)] -> [(Jogo, Double)]
    adicionarSimilaridadesLista nomeUser avaliacoes [x] tupla = adicionarSimilaridades x (Avaliacao.notaDada nomeUser (Jogo.nome x) avaliacoes) tupla
    adicionarSimilaridadesLista nomeUser avaliacoes (x:xs) tupla = adicionarSimilaridades x (Avaliacao.notaDada nomeUser (Jogo.nome x) avaliacoes)  (adicionarSimilaridadesLista nomeUser avaliacoes xs tupla) 


    retiraAvaliado :: [Jogo] -> [Avaliacao] -> String -> [Jogo]
    retiraAvaliado [] _ nomeUser = []
    retiraAvaliado (x:xs) avaliacoes nomeUser = if ((Jogo.nome x) `elem` (Avaliacao.avaliadosPor nomeUser avaliacoes))
                                                then retiraAvaliado xs avaliacoes nomeUser 
                                                else x : (retiraAvaliado xs avaliacoes nomeUser)


    geraTuplaPontuacao :: [Jogo] -> [(Jogo, Double)]
    geraTuplaPontuacao [] = []
    geraTuplaPontuacao (x:xs) = ( x , 0) : (geraTuplaPontuacao xs)

    adicionarSimilaridades :: Jogo -> Double -> [(Jogo, Double)] -> [(Jogo, Double)]
    adicionarSimilaridades _ nota [] = []
    adicionarSimilaridades jogo nota (x:xs) = ( fst (x)  , (((similaridadeJogo jogo (fst x)) * nota) + snd(x)) ) : (adicionarSimilaridades jogo nota xs)

    similaridadeJogo :: Jogo -> Jogo -> Double
    similaridadeJogo jogo1 jogo2 = (qtdCount (Jogo.categorias jogo1) (Jogo.categorias jogo2))*2.5
                                  + (qtdCount (splitOn "/" (Jogo.plataforma jogo1)) (splitOn "/" (Jogo.plataforma jogo2)))
                                  + (if (Jogo.online jogo1) == (Jogo.online jogo2) then 1 else 0)
                                  + (if integerModule((Jogo.anoLancamento jogo1) - (Jogo.anoLancamento jogo2)) <= 5 then 1 else 0)

    qtdCount :: [String] -> [String] -> Double
    qtdCount [] _ = 0
    qtdCount (x:xs) listaGeral = if x `elem` listaGeral
                                then 1 + qtdCount xs listaGeral
                                else qtdCount xs listaGeral

    integerModule :: Integer -> Integer
    integerModule x | x < 0 = x*(-1)
                    | otherwise = x