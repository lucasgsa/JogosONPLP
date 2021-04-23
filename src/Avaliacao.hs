module Avaliacao where 

data Avaliacao = Avaliacao {
  usuario :: String,
  jogo :: String,
  nota :: Double,
  comentario :: String
} deriving (Eq,Ord)

salvarAvaliacao :: Avaliacao.Avaliacao -> IO()
salvarAvaliacao avaliacao =  do
  -- TODO: Verificar se o jogo e o usuário estão cadastrados (Case Insensitive)
  let avaliacaoStr = Avaliacao.usuario avaliacao ++ "|" ++ Avaliacao.jogo avaliacao ++ "|" ++  show (Avaliacao.nota avaliacao) ++ "|" ++  Avaliacao.comentario avaliacao
  appendFile "dados/avaliacao.txt" (avaliacaoStr ++ "\n")
  return ()

