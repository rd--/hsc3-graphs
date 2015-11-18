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

gen_hsc3_graphs :: [GR] -> String
gen_hsc3_graphs gr_seq =
    let mk_import gr = "import qualified " ++ mod_name gr
        mk_case_stmt gr = let (nm,_) = gr
                              m_nm = mod_name gr
                          in printf "    [\"%s\"] -> %s.main" nm m_nm
        usage = "hsc3-graphs graph\\n" ++
                intercalate ", " (sort (map fst gr_seq))
    in unlines (["import System.Environment {- base -}"
                ,""] ++
                map mk_import gr_seq ++
                [""
                ,"main :: IO ()"
                ,"main = do"
                ,"  a <- getArgs"
                ,"  case a of"] ++
                map mk_case_stmt gr_seq ++
                [printf "    _ -> putStrLn \"%s\"" usage])

main :: IO ()
main = do
  h <- getHomeDirectory
  dc <- getDirectoryContents (h </> dir </> "gr")
  let hs = filter (".hs" `isSuffixOf`) dc
  au <- mapM (author h) hs
  let au' = sortBy (compare `on` snd) (catMaybes au)
  mapM_ (gen_mod h) au'
  writeFile (h </> dir </> "lib/hsc3-graphs.hs") (gen_hsc3_graphs au')
