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
  } deriving Show

data Rank = NA | Bronze | Silver | Golden deriving (Eq, Ord, Show)

contestants :: [Contestant]
contestants =
  [
    Contestant { name = "Kekusman", time = "5:00.00", diff = "+00:00.00", rank = Golden},
    Contestant { name = "weewee63", time = "7:30.00", diff = "+2:30.00", rank = Silver},
    Contestant { name = "LongAsfNickname", time = "8:01.00", diff = "+0:31.00", rank = Bronze},
    Contestant { name = "Pewpewboi", time = "9:59.59", diff = "+1:58.59", rank = Bronze},
    Contestant { name = "HowDoIplayThis", time = "10.01.00", diff = "+1:01.01", rank = NA}
  ]