-- {-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Main (main) where

import Data.Yaml ( encode )
import Data.HashMap.Strict (fromList)
import Data.Text (Text)
-- import qualified Data.ByteString.Lazy.Char8 as BL
import qualified Data.ByteString.Internal as BL
import Manifest
    ( Manifest(template, Manifest, apiVersion, metadata, kind, spec),
      MatchLabels(app, MatchLabels),
      Metadata(matchLabels, Metadata, namespace, name, MetadataTemplate),
      Selector(matchLabels, Selector),
      Spec(imagePullSecrets, Spec, replicas, revisionHistoryLimit,
           selector, SpecTemplate),
      Template(spec, Template, metadata),
      ImagePullSecret(name, ImagePullSecret) )

-- megakek = Data.Yaml.encode $ fromList[("infra", "infra")] 
-- ambigous type varibllellelle even with BL.ByteString
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
    , template    = Template 
                    { metadata  = MetadataTemplate { matchLabels = MatchLabels { app = "kekus-web"} }
                    , spec      = SpecTemplate 
                                  { imagePullSecrets = 
                                    [ImagePullSecret { name = "kekus-secret"}]
                                  -- , nodeSelector = fromList[("infra", "infra")] -- doesn't work
                                  }
                    }
    }
  -- BL.putStrLn (Data.Yaml.encode manifest)
  putStrLn $ BL.unpackChars $ Data.Yaml.encode manifest