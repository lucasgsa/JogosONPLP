module Jogo where

    data Jogo = Jogo {
        nome :: String,
        categorias :: [String],
        reqMinimos :: String,
        avaliacoes :: [Double]
    } deriving (Show,Eq,Ord)

    -- A partir de uma lista de jogos, retorna uma lista com o nome deles.
    nomeJogos :: [Jogo] -> [String]
    nomeJogos [] = []
    nomeJogos (h:hs) = (nome h):(nomeJogos hs)

    -- Dado o nome de uma categoria e uma lista de jogos, retorna uma lista com os jogos dessa categoria.
    jogosCategoria :: String -> [Jogo] -> [Jogo]
    jogosCategoria categoriaProcurada [] = []
    jogosCategoria categoriaProcurada (h:hs) | (categoriaProcurada `elem` (categorias h)) = h:(jogosCategoria categoriaProcurada hs)
                                             | otherwise = (jogosCategoria categoriaProcurada hs)
    
    -- Dado o nome de um jogo, e uma lista contendo o jogo, retorna a média de avaliações dele.
    mediaAvaliacoesPorNome :: String -> [Jogo] -> Double
    mediaAvaliacoesPorNome _ [] = 0.0
    mediaAvaliacoesPorNome nomeJogo (h:hs) | (nome h) == nomeJogo = (mediaAvaliacoes h)
                                           | otherwise = (mediaAvaliacoesPorNome nomeJogo hs)

    -- Dado um jogo, retorna a média de avaliações.
    mediaAvaliacoes :: Jogo -> Double
    mediaAvaliacoes jogo = (somaAvaliacoes (avaliacoes jogo)) / (fromIntegral (length (avaliacoes jogo)))

    -- Retorna a soma de uma lista de Double.
    somaAvaliacoes :: [Double] -> Double
    somaAvaliacoes [] = 0
    somaAvaliacoes (h:hs) = h + (somaAvaliacoes hs)