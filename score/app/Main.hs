module Main where
import Data.List (intercalate)

main :: IO ()
main = putStrLn constructTable

constructTable :: String
constructTable =
    do rowDelimiter ++ "\n"
    ++ "|   " ++ "Name" ++ "    |" ++ "    Time" ++ "   |" ++ "   Diff" ++ "    |" ++ "    Rank" ++ "   |" ++ "\n"
    ++ rowDelimiter
  where rowDelimiter = intercalate "-----------" . replicate 5 $ "+"