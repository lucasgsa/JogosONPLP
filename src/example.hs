import Jogo
import Listagem
import Util
import CarregaArquivos
import Indicacao

main = do
    jogos <- CarregaArquivos.lerArquivoJogos "dados/jogos.txt"

    avaliacoes <- CarregaArquivos.lerArquivoAvaliacoes "dados/avaliacoes.txt"

    usuarios <- CarregaArquivos.lerArquivoAvaliacoes "dados/usuarios.txt"

    let listaJogos = CarregaArquivos.carregarJogos jogos

    let listaAvaliacoes = CarregaArquivos.carregarAvaliacoes avaliacoes

    let listaUsuarios = CarregaArquivos.carregarUsuarios usuarios

    -- putStrLn (show listaUsuarios)

    -- 1 Cadastrar usuario

    -- 2 Cadastrar jogo

    -- 3
    -- putStrLn (Listagem.listarJogos listaJogos)

    -- 4
    -- putStrLn (Listagem.listarUltimosJogos listaJogos)

    -- 5
    -- putStrLn (Listagem.listarJogosCategoria "fps" listaJogos)
    
    -- 6
    -- putStrLn (Listagem.listarJogosPorAnoLancamento listaJogos)

    -- 7
    -- putStrLn (Listagem.listaAvaliacoesOrdenada  listaJogos listaAvaliacoes)

    -- 8
    -- putStrLn (Listagem.listarAvaliacoesJogo "Among Us" listaJogos listaAvaliacoes)
    -- putStrLn (Listagem.listarAvaliacoesJogo "Counter-Strike: Global Offensive" listaJogos listaAvaliacoes)
    
    -- 9  Comentar Jogo

    -- 10. Listando indicação para o usuario.
    -- putStrLn (Indicacao.pedirIndicacao "Kipon" listaAvaliacoes listaJogos listaUsuarios)

