import Text.Regex.Posix

main = do
    print ("<html>text</html>" =~ "<.*>" :: String)
    print ("/folder/" =~ "^/.*/$" :: String)

-- escaped characters causes lexical errors