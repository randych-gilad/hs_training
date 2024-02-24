-- {-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Main (main) where

import Data.Yaml ( encode )
import Data.ByteString.Internal ( unpackChars )
import Manifest
    ( ImagePullSecret(name, ImagePullSecret),
      Manifest(template, Manifest, apiVersion, metadata, kind, spec),
      MatchLabels(app, MatchLabels),
      Metadata(matchLabels, Metadata, namespace, name, MetadataTemplate),
      Selector(matchLabels, Selector),
      Spec(nodeSelector, Spec, replicas, revisionHistoryLimit, selector,
           SpecTemplate, imagePullSecrets),
      Template(spec, Template, metadata),
      NodeSelector(NodeSelector) )

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
                                  , nodeSelector = NodeSelector "kekus"
                                  }
                    }
    }
  putStrLn . unpackChars . encode $ manifest