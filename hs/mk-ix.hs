import Data.List {- base -}
import Data.Maybe {- base -}
import System.Directory  {- directory -}
import System.Environment  {- base -}
import System.FilePath  {- filepath -}
import Text.Printf {- base -}

import L

-- (home,hs-project,use-html?,use-scm?)
type State = (FilePath,FilePath,Bool,Bool)

link :: FilePath -> FilePath -> String -> IO (Maybe String)
link h p c = do
  e <- doesFileExist (h </> p)
  let r = if e then Just (printf "[%s](%s)" c p) else Nothing
  return r

type M_Str = Maybe String
type HS_LN = [M_Str]

alternates :: [String]
alternates = ["m","u","ha","hp","she","p"]

alternates' :: [String]
alternates' = map ('-':) alternates

hs_plain :: State -> FilePath -> IO HS_LN
hs_plain (hm,pr,_,_) nm = do
  let gr = pr </> "gr"
      alt k = link hm (gr </> nm ++ "-" ++ k <.> "hs") (k </> "hs")
  hs <- link hm (gr </> nm <.> "hs") "hs"
  a <- mapM alt alternates
  return (hs : a)

hs_html :: State -> FilePath -> IO HS_LN
hs_html (hm,pr,_,_) nm = do
  let ht = pr </> "html"
      alt k = link hm (ht </> nm ++ "-" ++ k <.> "hs.html") (k </> "hs")
  hs <- link hm (ht </> nm <.> "hs.html") "hs"
  a <- mapM alt alternates
  return (hs : a)

entry :: State -> String -> IO String
entry st nm = do
  let (hm,pr,use_html,use_scm) = st
  hs <- if use_html
        then hs_html st nm
        else hs_plain st nm
  scd <- if use_html
         then link hm (pr </> "html" </> nm <.> "scd.html") "scd"
         else link hm (pr </> "gr" </> nm <.> "scd") "scd"
  scm <- if use_scm
         then if use_html
              then link hm (pr </> "html" </> nm <.> "scm.html") "scm"
              else link hm ("sw/rsc3/help/graph" </> nm <.> "scm") "scm"
         else return Nothing
  dot <- if False
         then link hm (pr </> "dot" </> nm <.> "dot") "dot"
         else return Nothing
  pdf <- link hm (pr </> "pdf" </> nm <.> "pdf") "pdf"
  svg <- link hm (pr </> "svg" </> nm <.> "svg") "svg"
  let ln = intercalate "," (catMaybes (hs ++ [scd,scm,dot,pdf,svg]))
  return (printf "- %s [%s]" nm ln)

-- > mk_ix ("/home/rohan","sw/hsc3-graphs",True,True)
mk_ix :: State -> IO ()
mk_ix st = do
  let (hm,pr,_,_) = st
  d <- getDirectoryContents (hm </> pr </> "gr")
  let hs = mapMaybe (stripSuffix ".hs") (filter (".hs" `isSuffixOf`) d)
      nm = map (strip_suffix_or_id alternates') hs
  e <- mapM (entry st)(nub (sort nm))
  writeFile (hm </> pr </> "md/ix.md") (unlines e)

main :: IO ()
main = do
  [pr] <- getArgs
  hm <- getHomeDirectory
  let st = (hm,pr,True,True)
  mk_ix st
