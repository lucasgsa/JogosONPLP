module Util where

    listToString :: [String] -> String
    listToString [] = ""
    listToString (x:[]) = x 
    listToString (x:xs) =  x ++ ", " ++ listToString xs