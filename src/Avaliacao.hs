module Avaliacao where 
import Util as Util

data Avaliacao = Avaliacao {
  usuario :: String,
  jogo :: String,
  nota :: Double,
  comentario :: String
} deriving (Eq,Ord)

instance Show Avaliacao where
  show (Avaliacao usuario jogo nota comentario) = (Util.color "blue" True usuario) ++ (Util.color "magenta" False " - ") ++ (Util.color "red" False jogo) ++ (Util.color "magenta" False " - ") ++"Nota: " ++  (show nota) ++ "\n"
                                                  ++ (Util.color "yellow" True " Comentário: ") ++ comentario

salvarAvaliacao :: Avaliacao.Avaliacao -> IO()
salvarAvaliacao avaliacao =  do
  -- TODO: Verificar se o jogo e o usuário estão cadastrados (Case Insensitive)
  let avaliacaoStr = Avaliacao.usuario avaliacao ++ "|" ++ Avaliacao.jogo avaliacao ++ "|" ++  show (Avaliacao.nota avaliacao) ++ "|" ++  Avaliacao.comentario avaliacao
  appendFile "dados/avaliacoes.txt" (avaliacaoStr ++ "\n")
  return ()