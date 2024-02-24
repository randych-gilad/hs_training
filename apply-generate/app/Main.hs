-- {-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Main (main) where

-- import Data.Aeson
import Data.Yaml 
-- import qualified Data.ByteString.Lazy.Char8 as BL
import qualified Data.ByteString.Internal as BL
import Manifest
    ( Manifest(template, Manifest, apiVersion, metadata, kind, spec),
      MatchLabels(app, MatchLabels),
      Metadata(matchLabels, Metadata, namespace, name, MetadataTemplate),
      Selector(matchLabels, Selector),
      Spec(selector, Spec, replicas, revisionHistoryLimit),
      Template(metadata, Template) )

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
    , template    = Template { metadata = MetadataTemplate { matchLabels = MatchLabels { app = "kekus-web"} } }
    }
  -- BL.putStrLn (Data.Yaml.encode manifest)
  putStrLn $ BL.unpackChars $ Data.Yaml.encode manifest