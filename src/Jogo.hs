module Jogo where
import Util as Util

data Jogo = Jogo {
  nome :: String,
  categorias :: [String],
  reqMinimos :: [String],
  plataforma :: String,
  preco :: Double,
  online :: Bool
} deriving (Eq,Ord)

instance Show Jogo where
  show (Jogo nome categorias reqMinimos plataforma preco online) = "Título: " ++ nome ++ "\n"
                                                                   ++ " Plataforma: " ++ plataforma ++ "\n"
                                                                   ++ " " ++ (if online then "Cooperativo online" else "Um jogador") ++ "\n"
                                                                   ++ " Requisitos Mínimos: " ++ (Util.listToString reqMinimos) ++ "\n"
                                                                   ++ " Gêneros: " ++ (Util.listToString categorias) ++ "\n"
                                                                   ++ " Preço: " ++ (if (preco /= 0) then ("R$" ++ show preco) else "Grátis")
convertArrayToString :: [String] -> String
convertArrayToString (h: []) = h
convertArrayToString (h:t) = h ++ "," ++ convertArrayToString (t)

getArrayToString :: [String] -> String
getArrayToString array = "[" ++ convertArrayToString(array) ++ "]"

salvarJogo :: Jogo.Jogo -> IO()
salvarJogo jogo = do
  let jogoStr = Jogo.nome jogo ++ "," ++ getArrayToString (Jogo.categorias jogo) ++ "," ++ getArrayToString (Jogo.reqMinimos jogo) ++ "," ++ Jogo.plataforma jogo ++ "," ++ show (Jogo.preco jogo) ++ "," ++ show (Jogo.online jogo)
  appendFile "dados/jogos.csv" (jogoStr ++ "\n")
  return ()
