module Jogo where

data Jogo = Jogo {
  nome :: String,
  categorias :: [String],
  reqMinimos :: [String],
  plataforma :: String,
  preco :: Double,
  online :: Bool
} deriving (Show,Eq,Ord)

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
