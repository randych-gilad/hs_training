module Main where

import Html (wrapHtml, renderHtml)

main :: IO ()
main = putStrLn $ renderHtml $ wrapHtml "Kekus page" "Kekus..."