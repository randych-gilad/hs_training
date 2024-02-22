module Main where
import Data.List (intercalate)

{-# LANGUAGE OverloadedRecordDot #-}

main :: IO ()
main = putStrLn constructTable

constructTable :: String
constructTable =
    do rowDelimiter ++ "\n"
    ++ "|   " ++ "Name" ++ "    |" ++ "    Time" ++ "   |" ++ "   Diff" ++ "    |" ++ "    Rank" ++ "   |" ++ "\n"
    ++ rowDelimiter
  where rowDelimiter = intercalate "-----------" . replicate 5 $ "+"

data Contestant = Contestant 
  { name :: String
  , time :: String
  , diff :: String
  , rank :: Rank
  }

data Rank = Bronze | Silver | Golden deriving (Eq, Ord)