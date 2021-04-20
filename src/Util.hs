module Util where

    listToString :: [String] -> String
    listToString [] = ""
    listToString (x:[]) = x 
    listToString (x:xs) =  x ++ ", " ++ listToString xs

    color :: String -> Bool -> String
    color "nocolor" _    = "\ESC[0m"
    color "black"   bold = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[30m"
    color "red"     bold = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[31m" 
    color "green"   bold = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[32m"
    color "yellow"  bold = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[33m"
    color "blue"    bold = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[34m"
    color "magenta" bold = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[35m"
    color "cyan"    bold = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[36m"
    color "white"   bold = (if bold then "\ESC[1m" else "\ESC[0m") ++ "\ESC[37m"

    bold = "\ESC[1m"
    nobold = "\ESC[0m"