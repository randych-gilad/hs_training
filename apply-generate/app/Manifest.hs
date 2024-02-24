{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Manifest where

import GHC.Generics (Generic)
import Data.Aeson.Key (fromString)
import Data.Aeson (ToJSON, toJSON, toJSONKey, omitNothingFields, genericToJSON, defaultOptions, object, (.=))

data Manifest = Manifest
  {
  apiVersion :: String
  , kind :: String
  , metadata :: Metadata
  , spec :: Spec
  , template :: Template
  } deriving (Generic, Show)

data Metadata = Metadata
  { name :: String
  , namespace :: String
  }
  | MetadataTemplate
  { matchLabels :: MatchLabels }
  deriving (Generic, Show)

data Spec = Spec
  { replicas :: Int
  , revisionHistoryLimit :: Int
  , selector :: Selector
  }
  | SpecTemplate
  { imagePullSecrets :: [ImagePullSecret]
  , nodeSelector :: NodeSelector
  } deriving (Generic, Show)
newtype ImagePullSecret = ImagePullSecret
  { name :: String }
  deriving (Generic, Show)

newtype Selector = Selector
  { matchLabels :: MatchLabels }
  deriving (Generic, Show)

newtype MatchLabels = MatchLabels
  { app :: String }
  deriving (Generic, Show)

data Template = Template
  { metadata :: Metadata 
  , spec :: Spec }
  deriving (Generic, Show)

newtype NodeSelector = NodeSelector String
  deriving (Generic, Show)

instance ToJSON Manifest where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON Metadata where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON Spec where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON MatchLabels where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON Selector where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON Template where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON ImagePullSecret where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON NodeSelector where toJSON (NodeSelector val) = object [fromString ("node-role.kubernetes.io/" ++ val) .= val]