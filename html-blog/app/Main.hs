module Main where

import qualified Html

main :: IO ()
main = putStrLn $ Html.wrapHtml "Kekus page" "Kekus..."
