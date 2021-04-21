import Jogo as Jogo
import Listagem as Listagem
import Util as Util
import CarregaArquivos as CarregaArquivos

main = do
    jogos <- CarregaArquivos.lerArquivoJogos "dados/jogos.txt"

    let listaJogos = CarregaArquivos.carregarJogos jogos

    putStrLn (Listagem.listarJogos listaJogos)