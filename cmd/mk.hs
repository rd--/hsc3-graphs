import Data.List {- base -}
import Data.Maybe {- base -}

import System.Directory {- directory -}
import System.FilePath {- filepath -}

import qualified System.IO.Strict as Strict {- strict -}

write_json_db :: IO ()
write_json_db = do
  let prj_dir = "/home/rohan/sw/hsc3-graphs/"
      db_dir = prj_dir </> "db"
      get_db = getDirectoryContents db_dir
      db_keys = map takeBaseName . filter (\fn -> takeExtension fn == ".scsyndef")
      get_src db k = fromJust $ find (\e -> fst e == k && snd e /= ".scsyndef") $ map (\fn -> (takeBaseName fn, takeExtension fn)) db
      fmt_json (k, x) ln = concat ["  \"", k, "\": {\"format\": \"", x, "\", \"header\": \"", ln, "\"}"]
      get_first_line (k, x) = fmap (head . lines) (Strict.readFile (db_dir </> k ++ x))
  db <- get_db
  let keys = db_keys db
      srcs = map (get_src db) keys
  first_lines <- mapM get_first_line srcs
  writeFile (prj_dir </> "json/db.json") ("{\n" ++ (intercalate ",\n" (zipWith fmt_json srcs first_lines)) ++ "\n}\n")
