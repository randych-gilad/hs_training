module Manifest where
import GHC.Generics (Generic)
import Data.List (isInfixOf)
import Data.Aeson (ToJSON, toJSON, omitNothingFields, genericToJSON, defaultOptions)

data Manifest = Manifest
  {
  apiVersion :: String
  , kind :: String
  , metadata :: Metadata
  } deriving (Show, Generic)

data Metadata = Metadata
  { name :: String
  , namespace :: String
  } deriving (Show, Generic)

instance ToJSON Manifest where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }
instance ToJSON Metadata where toJSON = genericToJSON defaultOptions { omitNothingFields  = True }