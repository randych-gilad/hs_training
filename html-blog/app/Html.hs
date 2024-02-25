module Html (renderHtml, wrapHtml, Tag) where

wrapHtml :: String -> String -> Html
wrapHtml contentHead contentBody = Html $
  "<html>"
  ++ (\(Head content) -> content) (mkTag "head" contentHead)
  ++ (\(Body content) -> content) (mkTag "body" contentBody)
  ++ "</html>"

mkTag :: String -> String -> Tag
mkTag tag content =
  case tag of
    "head" -> Head (tagContent content)
    "body" -> Body (tagContent content)
    "p"    -> P (tagContent content)
    _      -> error "Illegal tag"
    where tagContent c = "<" <> tag <> ">" <> c <> "</" <> tag <> ">"

newtype Html = Html { renderHtml :: String }

data Tag =
  Head String | Body String | P String
  deriving Show