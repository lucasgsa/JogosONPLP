module Util where

    listToString :: [String] -> String
    listToString [] = ""
    listToString (x:[]) = x 
    listToString (x:xs) =  x ++ ", " ++ listToString xs

    color :: String -> String
    color "nocolor" = "\ESC[m"
    color "black"   = "\ESC[30m"
    color "red"     = "\ESC[31m"
    color "green"   = "\ESC[32m"
    color "yellow"  = "\ESC[33m"
    color "blue"    = "\ESC[34m"
    color "magenta" = "\ESC[35m"
    color "cyan"    = "\ESC[36m"
    color "white"   = "\ESC[37m"