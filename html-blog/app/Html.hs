module Html where

wrapHtml :: String -> String -> String
wrapHtml contentHead contentBody = "<html>" <> wrapHead contentHead <> wrapBody contentBody <> "</html>"
wrapHead :: String -> String
wrapHead content = "<head>" <> content <> "</head>"
wrapBody :: String -> String
wrapBody content = "<body>" <> content <> "</body>"