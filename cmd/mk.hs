import Data.List {- base -}
import Data.Maybe {- base -}

import System.Directory {- directory -}
import System.FilePath {- filepath -}

import qualified System.IO.Strict as Strict {- strict -}

quote_json_char :: Char -> String
quote_json_char c =
  case c of
    '"' -> "\\\""
    '\\' -> "\\\\"
    '\t' -> "" -- some .scd graphs are indented by a tab stop
    _ -> [c]

{-
> putStrLn $ quote_json_string "\"a smalltalk comment\""
> putStrLn $ quote_json_string "\\ a forth comment"
-}
quote_json_string :: String -> String
quote_json_string = concatMap quote_json_char

write_json_db :: IO ()
write_json_db = do
  let prj_dir = "/home/rohan/sw/hsc3-graphs/"
      db_dir = prj_dir </> "db"
      get_db = getDirectoryContents db_dir
      db_keys = map takeBaseName . filter (\fn -> takeExtension fn == ".scsyndef")
      get_src db k = fromJust $ find (\e -> fst e == k && snd e /= ".scsyndef") $ map (\fn -> (takeBaseName fn, takeExtension fn)) db
      fmt_json (k, x) ln = concat ["  {\"hash\": \"", k, "\", \"format\": \"", x, "\", \"header\": \"", quote_json_string ln, "\"}"]
      get_first_line (k, x) = fmap (head . lines) (Strict.readFile (db_dir </> k ++ x))
  db <- get_db
  let keys = db_keys db
      srcs = map (get_src db) keys
  first_lines <- mapM get_first_line srcs
  writeFile (prj_dir </> "json/db.json") ("[\n" ++ (intercalate ",\n" (zipWith fmt_json srcs first_lines)) ++ "\n]\n")

main :: IO ()
main = write_json_db
