module Main where

import Html

main :: IO ()
main = putStrLn $ renderHtml $ wrapHtml "Kekus page" "Kekus..."