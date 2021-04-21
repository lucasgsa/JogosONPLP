module CarregaArquivos where
    import Util as Util
    import Jogo as Jogo
    import Data.List.Split (splitOn)

    -- Le o arquivo de dados de jogos, e retorna uma lista de strings que armazena cada jogo.
    lerArquivoJogos :: String -> IO([String])
    lerArquivoJogos path = do
        arquivo <- readFile path
        let listaJogos = lines arquivo
        return listaJogos

    -- Retorna uma lista com os jogos a partir de uma lista de strings contendo os jogos.
    carregarJogos :: [String] -> [Jogo]
    carregarJogos lista = [decodeJogo x | x <- lista]

    -- A partir da string gerada do jogo, retorna o Jogo.
    decodeJogo :: String -> Jogo
    decodeJogo line = Jogo {
                        Jogo.nome = paramJogo!!0,
                        Jogo.categorias = Util.parseStringList (paramJogo!!1),
                        Jogo.reqMinimos = Util.parseStringList (paramJogo!!2),
                        Jogo.plataforma = paramJogo!!3,
                        Jogo.preco = read (paramJogo!!4) :: Double,
                        Jogo.online = if (paramJogo!!5 == "True") then True else False,
                        Jogo.anoLancamento = read (paramJogo!!6) :: Integer
                    }
                    where paramJogo = splitOn "|" line