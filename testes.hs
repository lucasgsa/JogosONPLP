import qualified Jogo as Jogo

-- Testando
main :: IO()
main = do
    let newJogo = Jogo.Jogo "CS" ["fps", "competitivo", "jogo em equipe", "valve"] "i3" [8, 9.4, 10, 7, 9]
    let newJogo2 = Jogo.Jogo "Dota" ["moba", "competitivo", "jogo em equipe", "valve", "habilidades"] "i3" [8, 9.4, 10, 7, 9]
    let newJogo3 = Jogo.Jogo "LoL" ["moba", "riot", "competitivo", "jogo em equipe", "habilidades"] "pentium" [8, 8.5, 9, 10, 8.9]
    let newJogo4 = Jogo.Jogo "Valorant" ["fps", "riot", "competitivo", "jogo em equipe", "habilidades"] "i3" [8, 8.5, 9, 10, 8.9]
    let listaJogos = [newJogo, newJogo2, newJogo3, newJogo4]
    
    -- Lista todos os jogos
    putStrLn ("Todos os jogos:")
    putStrLn (show (Jogo.nomeJogos listaJogos))

    -- Jogos com categoria competitivo
    putStrLn ("Jogos competitivos:")
    putStrLn (show (Jogo.nomeJogos (Jogo.jogosCategoria "competitivo" listaJogos)))

    -- Jogos com categoria fps
    putStrLn ("Jogos fps:")
    putStrLn (show (Jogo.nomeJogos (Jogo.jogosCategoria "fps" listaJogos)))

    -- Jogos da riot
    putStrLn ("Jogos da riot:")
    putStrLn (show (Jogo.nomeJogos (Jogo.jogosCategoria "riot" listaJogos)))

    -- Jogos em equipe
    putStrLn ("Jogos moba:")
    putStrLn (show (Jogo.nomeJogos (Jogo.jogosCategoria "moba" listaJogos)))

    -- Medias de avaliação
    putStrLn ("Médias de avaliação:")
    putStrLn ("CS = " ++ show (Jogo.mediaAvaliacoesPorNome "CS" listaJogos))
    putStrLn ("LoL = " ++ show (Jogo.mediaAvaliacoesPorNome "LoL" listaJogos))
    putStrLn ("Dota = " ++ show (Jogo.mediaAvaliacoesPorNome "Dota" listaJogos))
    putStrLn ("Valorant = " ++ show (Jogo.mediaAvaliacoesPorNome "Valorant" listaJogos))

    -- Requisitos Mínimos
    putStrLn ("Requisitos Mínimos:")
    putStrLn ("CS = " ++ (Jogo.reqMinimosPorNome "CS" listaJogos))
    putStrLn ("LoL = " ++ (Jogo.reqMinimosPorNome "LoL" listaJogos))
    putStrLn ("Dota = " ++ (Jogo.reqMinimosPorNome "Dota" listaJogos))
    putStrLn ("Valorant = " ++ (Jogo.reqMinimosPorNome "Valorant" listaJogos))