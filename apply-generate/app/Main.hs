{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

-- import Data.Aeson
import Data.Yaml 
-- import qualified Data.ByteString.Lazy.Char8 as BL
import qualified Data.ByteString.Internal as BL
import Manifest
    ( Selector(matchLabels, Selector),
      MatchLabels(app, MatchLabels),
      Spec(selector, Spec, replicas, revisionHistoryLimit),
      Metadata(name, Metadata, namespace),
      Manifest(spec, Manifest, apiVersion, metadata, kind) )

main :: IO ()
main = do
  let manifest    = Manifest { apiVersion = "apps/v1", 
      metadata    = let namespace = "kekus"
                        name = namespace ++ "-web"
                    in Metadata { namespace, name }
    , kind        = "Deployment"
    , spec        = let replicas = 1
                        revisionHistoryLimit = 2
                        selector = Selector { matchLabels = MatchLabels { app = "kekus-web" } }
                    in Spec { replicas, revisionHistoryLimit, selector }
    }
  -- BL.putStrLn (Data.Yaml.encode manifest)
  putStrLn $ BL.unpackChars $ Data.Yaml.encode manifest