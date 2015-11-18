import Data.Char {- base -}
import Data.Function {- base -}
import Data.List {- base -}
import Data.Maybe {- base -}
import System.Directory  {- directory -}
import System.FilePath  {- filepath -}
import System.IO {- base -}
import Text.Printf {- base -}
import Text.Regex {- regex-compat -}

import L

dir :: FilePath
dir = "sw/hsc3-graphs"

-- (Name,Author)
type GR = (String,String)

gr_name :: FilePath -> FilePath -> FilePath
gr_name h nm = h </> dir </> "gr" </> nm <.> "hs"

author :: FilePath -> String -> IO (Maybe GR)
author h nm = do
  let nm' = fromMaybe (error "not hs") (stripSuffix ".hs" nm)
  fd <- openFile (gr_name h nm') ReadMode
  ln <- hGetLine fd
  hClose fd
  let r = mkRegex "[^(]*\\(([^)]*)"
  case matchRegex r ln of
    Just [au] -> return (Just (nm',au))
    _ -> return Nothing

to_underscore :: Char -> Char
to_underscore c =
    case c of
      '-' -> '_'
      _ -> c

fix_gr :: GR -> GR
fix_gr (nm,au) =
    let au' = map toUpper au
        nm' = map to_underscore nm
    in (nm',au')

mod_name :: GR -> String
mod_name gr =
    let (nm,au) = fix_gr gr
    in printf "Sound.SC3.Graph.%s_%s" au nm

graph_name :: GR -> String
graph_name = fst . fix_gr

gen_mod :: FilePath -> GR -> IO ()
gen_mod h gr = do
  let m_nm = mod_name gr
      (nm,_) = gr
      (nm',au') = fix_gr gr
      m = au' ++ "_" ++ nm'
  putStrLn ("                   " ++ m_nm ++ ",")
  c <- readFile (gr_name h nm)
  let (p,q) = span (not . null) (lines c)
      c' = unlines (p ++ [printf "module %s where" m_nm] ++ q)
  writeFile (h </> dir </> "lib/Sound/SC3/Graph" </> m <.> "hs") c'

gen_import_list :: [GR] -> [String]
gen_import_list = let f gr = "import qualified " ++ mod_name gr in map f

gen_hsc3_graphs :: [GR] -> String
gen_hsc3_graphs gr_seq =
    let mk_case_stmt gr = printf "    [\"%s\"] -> %s.main" (fst gr) (mod_name gr)
        usage = "hsc3-graphs graph\\n\\n" ++ intercalate ", " (sort (map fst gr_seq))
    in unlines (["import System.Environment {- base -}"
                ,""
                ,"import Sound.SC3 {- hsc3 -}"
                ,""] ++
                gen_import_list gr_seq ++
                [""
                ,""] ++
                gen_scsyndef (apply_scsyndef_whitelist gr_seq) ++
                [""
                ,"main :: IO ()"
                ,"main = do"
                ,"  a <- getArgs"
                ,"  case a of"
                ,"    [\"update-scsyndef-store\"] -> update_scsyndef_store"] ++
                map mk_case_stmt gr_seq ++
                [printf "    _ -> putStrLn \"%s\"" usage])

-- initial pass at white list only...
scsyndef_whitelist :: [String]
scsyndef_whitelist =
    ["analog-bubbles","analogue-daze"
    ,"scratchy","sidereal-time","sprinkler","synthetic-piano"
    ,"tank"
    ,"why-supercollider"
    ,"zizle"]

apply_scsyndef_whitelist :: [GR] -> [GR]
apply_scsyndef_whitelist = let f (nm,_) = nm `elem` scsyndef_whitelist in filter f

gen_scsyndef :: [GR] -> [String]
gen_scsyndef =
    let mk gr = printf "  write_scsyndef \"%s\" %s.%s" (fst gr) (mod_name gr) (graph_name gr)
        pre = ["update_scsyndef_store :: IO ()"
              ,"update_scsyndef_store = do"
              ,"  let prj_dir = \"/home/rohan/sw/hsc3-graphs/\""
              ,"      write_scsyndef nm u = synthdefWrite (synthdef nm (out 0 u)) (prj_dir ++ \"scsyndef\")"]
        in (pre ++) . map mk

main :: IO ()
main = do
  h <- getHomeDirectory
  dc <- getDirectoryContents (h </> dir </> "gr")
  let hs = filter (".hs" `isSuffixOf`) dc
  au <- mapM (author h) hs
  let au' = sortBy (compare `on` snd) (catMaybes au)
  mapM_ (gen_mod h) au'
  writeFile (h </> dir </> "lib/hsc3-graphs.hs") (gen_hsc3_graphs au')
