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
  show (Jogo nome categorias reqMinimos plataforma preco online) = (Util.color "green" True) ++ "  Título: " ++ (Util.color "cyan" False) ++ nome ++ "\n"
                                                                   ++ (Util.color "white" False) ++ "   Plataforma: " ++ plataforma ++ "\n"
                                                                   ++ (Util.color "white" False) ++ "   Requisitos Mínimos: " ++ (Util.listToString reqMinimos) ++ "\n"
                                                                   ++ (Util.color "white" False) ++ "   Gêneros: " ++ (Util.listToString categorias) ++ "\n"
                                                                   ++ (Util.color "yellow" False) ++ "   " ++ (if online then "Cooperativo online" else "Um jogador") ++ "\n"
                                                                   ++ (Util.color "red" True) ++ "   Preço: " ++ (if (preco /= 0) then ("R$" ++ show preco) else "Grátis") ++ (Util.color "nocolor" False)
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
