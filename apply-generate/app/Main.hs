{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

-- import Data.Aeson
import Data.Yaml 
-- import qualified Data.ByteString.Lazy.Char8 as BL
import qualified Data.ByteString.Internal as BL
import Manifest

main :: IO ()
main = do
  let manifest =  Manifest {kind = "Deployment", 
      metadata =  let namespace = Nothing
                      name = "kekus-web"
                  in Metadata {namespace, name}
  , apiVersion = "apps/v1"}
  -- BL.putStrLn (Data.Yaml.encode manifest)
  putStrLn $ BL.unpackChars $ Data.Yaml.encode manifest