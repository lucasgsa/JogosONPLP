module Util where

    listToString :: [String] -> String
    listToString [] = ""
    listToString (x:[]) = x 
    listToString (x:xs) =  x ++ ", " ++ listToString xs

    color :: String -> Bool -> String -> String
    color "nocolor" _ _   = "\ESC[0m"
    color "black"   bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[30m" ++ texto ++ "\ESC[0m"
    color "red"     bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[31m" ++ texto ++ "\ESC[0m"
    color "green"   bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[32m" ++ texto ++ "\ESC[0m"
    color "yellow"  bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[33m" ++ texto ++ "\ESC[0m"
    color "blue"    bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[34m" ++ texto ++ "\ESC[0m"
    color "magenta" bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[35m" ++ texto ++ "\ESC[0m"
    color "cyan"    bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[36m" ++ texto ++ "\ESC[0m"
    color "white"   bold texto = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[37m" ++ texto ++ "\ESC[0m"

    bold = "\ESC[1m"
    nobold = "\ESC[0m"