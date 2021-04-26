import Jogo
import Listagem
import Util
import CarregaArquivos
import Indicacao

main = do
    jogos <- CarregaArquivos.lerArquivoJogos "dados/jogos.txt"

    avaliacoes <- CarregaArquivos.lerArquivoAvaliacoes "dados/avaliacoes.txt"

    let listaJogos = CarregaArquivos.carregarJogos jogos

    let listaAvaliacoes = CarregaArquivos.carregarAvaliacoes avaliacoes

    putStrLn (Listagem.listarJogosPorAnoLancamento listaJogos)

    putStrLn (Listagem.listarAvaliacoesJogo "Counter-Strike: Global Offensive" listaJogos listaAvaliacoes)

    putStrLn (Listagem.listarJogos listaJogos)

    putStrLn (Listagem.listaAvaliacoesOrdenada  listaJogos listaAvaliacoes)

    putStrLn (Listagem.listarAvaliacoesJogo "Among Us" listaJogos listaAvaliacoes)

    -- Listando 3 indicações para o usuario.
    putStrLn (show (Indicacao.indicarJogo "Kipon" listaAvaliacoes listaJogos 0))
    putStrLn (show (Indicacao.indicarJogo "Kipon" listaAvaliacoes listaJogos 1))
    putStrLn (show (Indicacao.indicarJogo "Kipon" listaAvaliacoes listaJogos 2))

