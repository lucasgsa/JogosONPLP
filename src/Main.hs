import qualified Avaliacao as Avaliacao
import qualified CarregaArquivos as CarregaArquivos
import qualified Indicacao as Indicacao
import qualified Jogo as Jogo
import qualified Listagem as Listagem
import qualified Usuario as Usuario
import qualified Util as Util
import Data.List.Split ( splitOn )
import Data.Map as Map ( fromList, Map)
import Data.List
import System.IO.Unsafe(unsafeDupablePerformIO)
import Data.Typeable
import Data.Time.Calendar


main :: IO ()
main = do    
    aplicativo        
    opcao  
    

aplicativo:: IO()
aplicativo = do
    putStrLn ("\n\n===================\n" ++
              "===== JOGOS ON ====\n"++
              "===================\n"
              )


--Método que retorna o menu inicial
menu :: IO()
menu = do
    putStr ("\n\nInforme a opção desejada: \n")    
    putStrLn ("\n1. Cadastrar um Usuário\n" ++ 
        "2. Cadastrar um Jogo\n" ++
        "3. Listar Jogos\n" ++
        "4. Listar as avaliações de um Jogo\n" ++
        "5. Avaliar um Jogo\n" ++
        "6. Pedir Indicação de um Jogo\n" ++
        "7. Sair\n"
        )


opcao :: IO()
opcao = do
    menu

    input <- getLine

    if input == "1" then do
        putStrLn ("Cadastro de Usuário:\n")
        cadastrarUsuario
    else if input == "2" then do        
        putStrLn ("Cadastrar um Jogo:\n")
        --cadastrarJogo
    else if input == "3" then do
        listagemJogos    
        putStrLn (" ")
    else if input == "4" then do
        putStrLn ("Voce selecionou a opcao 4")
    else if input == "5" then do
        putStrLn ("Voce selecionou a opcao 5")
    else if input == "6" then do
        putStrLn ("Voce selecionou a opcao 6")
    else if input == "7" then do 
        putStrLn("Programa finalizado!")
    else do
       putStrLn("Opção inválida")
       opcao

cadastrarUsuario :: IO()
cadastrarUsuario = do
    putStrLn ("Insira o nome do Usuário:")
    nome <- getLine
    if nome == "" then do 
        putStr("O nome não pode ser vazio.")
        cadastrarUsuario
        else do 
            let novoUsuario = Usuario.Usuario{
                Usuario.nickname = nome
            }
            Usuario.salvarUsuario novoUsuario
            putStrLn("Usuário cadastrado com sucesso")
    opcao
    
--cadastrarJogo :: IO()
--cadastrarJogo = do
  --  putStrLn("Insira o nome do Jogo:")
    --nome <- getLine
    --putStrLn("Insira as categorias:")
    --categorias <- getLine
    --putStrLn("Insira os requisitos minimo:")
    --reqMin <- getLine
    --putStrLn("Insira a plataforma:")
    --plataforma <- getLine
    --putStrLn("Insira o preco:")
    --preco <- getLine
    --putStrLn("O jogo é online?")
    --isOnline <- getLine
    --putStrLn("Qual é o ano de lançamento?")
    --ano <- getLine



listagemJogos:: IO()
listagemJogos = do 
    putStrLn ("\n1. Listar todos os jogos disponíveis\n" ++ 
        "2. Listar os últimos 5 jogos cadastrados\n" ++
        "3. Listar os jogos por categoria\n" ++
        "4. Listar os jogos por ordem de ano de Lançamento\n" ++
        "5. Listar os jogos com as melhores avaliações\n" ++
        "6. Sair \n" )
  


opcaoListagem:: IO()
opcaoListagem = do 
    listagemJogos
    jogos <- CarregaArquivos.lerArquivoJogos "dados/jogos.txt"
    let listaJogos = CarregaArquivos.carregarJogos jogos

    avaliacoes <- CarregaArquivos.lerArquivoAvaliacoes "dados/avaliacoes.txt"
    let listaAvaliacoes = CarregaArquivos.carregarAvaliacoes avaliacoes

    input <- getLine

    if input == "1" then do
        putStrLn("Jogos disponíveis:\n")
        putStrLn (Listagem.listarJogos listaJogos)
        listagemJogos
        
    else if input == "2" then do        
        putStrLn("Últimos 5 jogos:\n")
        putStrLn (Listagem.listarUltimosJogos listaJogos)
        listagemJogos
    else if input == "3" then do
        putStrLn (Listagem.listarJogosCategoria "fps" listaJogos)
        listagemJogos

    else if input == "4" then do
        putStrLn("Jogos por ano de lançamento:\n")
        putStrLn (Listagem.listarJogosPorAnoLancamento listaJogos)
        listagemJogos
    else if input == "5" then do
        putStrLn("Jogos com as melhores avaliações:\n")
        putStrLn (Listagem.listaAvaliacoesOrdenada  listaJogos listaAvaliacoes)
        listagemJogos
    else if input == "6" then do 
        opcao   
    else do
        putStrLn("Opção inválida")
        opcao

