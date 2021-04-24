import Jogo as Jogo
import Listagem as Listagem
import Util as Util
import CarregaArquivos as CarregaArquivos

main = do
    jogos <- CarregaArquivos.lerArquivoJogos "dados/jogos.txt"

    avaliacoes <- CarregaArquivos.lerArquivoAvaliacoes "dados/avaliacoes.txt"

    let listaJogos = CarregaArquivos.carregarJogos jogos

    let listaAvaliacoes = CarregaArquivos.carregarAvaliacoes avaliacoes

    --putStrLn (Listagem.listarJogosPorAnoLancamento listaJogos)

    --putStrLn (Listagem.listarAvaliacoesJogo "Counter-Strike: Global Offensive" listaJogos listaAvaliacoes)

    putStrLn (Listagem.listarJogos listaJogos)

    --putStrLn (Listagem.listaAvaliacoesOrdenada  listaJogos listaAvaliacoes)

