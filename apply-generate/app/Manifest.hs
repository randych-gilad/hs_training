{-# LANGUAGE DuplicateRecordFields #-}

module Manifest where

import GHC.Generics (Generic)
import Data.Aeson (ToJSON, toJSON, omitNothingFields, genericToJSON, defaultOptions)

data Manifest = Manifest
  {
  apiVersion :: String
  , kind :: String
  , metadata :: Metadata
  , spec :: Spec
  , template :: Template
  } deriving (Show, Generic)

data Metadata = Metadata
  { name :: String
  , namespace :: String
  } | MetadataTemplate
  { matchLabels :: MatchLabels }
  deriving (Show, Generic)

data Spec = Spec
  { replicas :: Int
  , revisionHistoryLimit :: Int
  , selector :: Selector
  } deriving (Show, Generic)


newtype Selector = Selector
  { matchLabels :: MatchLabels }
  deriving (Show, Generic)

newtype MatchLabels = MatchLabels
  { app :: String }
  deriving (Show, Generic)

newtype Template = Template
  { metadata :: Metadata }
  deriving (Show, Generic)

instance ToJSON Manifest where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON Metadata where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON Spec where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON MatchLabels where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON Selector where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON Template where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }

