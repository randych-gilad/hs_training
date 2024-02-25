module Html (mkTag, renderHtml, wrapHtml) where

wrapHtml :: String -> String -> Html
wrapHtml contentHead contentBody = Html $
  "<html>" 
  <> mkTag "head" contentHead
  <> mkTag "body" contentBody
  <> "</html>"

mkTag :: String -> String -> String
mkTag tag content =
  case tag of
    "head" -> tagContent
    "body" -> tagContent
    "p" -> tagContent
    _ -> error "Illegal tag"
    where tagContent = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

newtype Html = Html { renderHtml :: String }