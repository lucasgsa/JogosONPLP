module Usuario where 

data Usuario = Usuario {
  nickname:: String
} deriving (Show, Eq, Ord)

salvarUsuario :: Usuario.Usuario -> IO()
salvarUsuario usuario = do
  -- TODO: É necessário veriricar se já existe um usuário com esse nick (Case Insensitive)
  let usuarioStr = Usuario.nickname usuario
  appendFile "dados/usuario.txt" (usuarioStr ++  "\n")
  return ()

existeUsuario :: String -> [Usuario] -> Bool
existeUsuario _ [] = False
existeUsuario nomeUsuario (x:xs) = (Usuario.nickname x == nomeUsuario) || existeUsuario nomeUsuario xs

