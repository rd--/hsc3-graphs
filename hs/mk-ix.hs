import Control.Monad {- base -}
import Data.List {- base -}
import Data.Maybe {- base -}
import System.Directory  {- directory -}
import System.Environment  {- base -}
import System.FilePath  {- filepath -}
import System.IO  {- base -}
import Text.Printf {- base -}

import L

-- (home,hs-project,use-html?,use-scm?)
type State = (FilePath,FilePath,Bool,Bool)

link :: FilePath -> FilePath -> String -> IO (Maybe String)
link h p c = do
  e <- doesFileExist (h </> p)
  let r = if e then Just (printf "[%s](%s)" c p) else Nothing
  return r

link' :: FilePath -> FilePath -> FilePath -> String -> String -> IO (Maybe String)
link' hm pr nm ty c = do
  let fn = hm </> "sw" </> pr </> nm <.> ty
  e <- doesFileExist fn
  when False (hPutStrLn stderr fn)
  let r = if e then Just (printf "[%s](?t=%s&e=%s.%s)" c pr nm ty) else Nothing
  return r

type M_Str = Maybe String
type HS_LN = [M_Str]

alternates :: [String]
alternates = ["m","u","ha","hp","she","p"]

alternates' :: [String]
alternates' = map ('-':) alternates

hs_plain :: State -> FilePath -> IO HS_LN
hs_plain (hm,pr,_,_) nm = do
  let nm' = "gr" </> nm
      alt k = link' hm pr (nm' ++ "-" ++ k) "hs" ("hs/" ++ k)
  hs <- link' hm pr nm' "hs" "hs"
  a <- mapM alt alternates
  return (hs : a)

hs_html :: State -> FilePath -> IO HS_LN
hs_html (hm,pr,_,_) nm = do
  let ht = "sw" </> pr </> "html"
      alt k = link hm (ht </> nm ++ "-" ++ k <.> "hs.html") (k </> "hs")
  hs <- link hm (ht </> nm <.> "hs.html") "hs"
  a <- mapM alt alternates
  return (hs : a)

entry :: State -> String -> IO String
entry st nm = do
  let (hm,pr,use_html,use_scm) = st
      nm' = "gr" </> nm
  hs <- if use_html
        then hs_html st nm
        else hs_plain st nm
  fs <- if use_html
        then link hm ("sw" </> pr </> "html" </> nm <.> "fsu.htm") "fs"
        else link' hm pr nm' "fs" "fs"
  scd <- if use_html
         then link hm ("sw" </> pr </> "html" </> nm <.> "scd.html") "scd"
         else link' hm pr nm' "scd" "scd"
  lsp <- link' hm "rsc3" ("help/graph" </> nm) "lisp" "lisp"
  scm <- if use_scm
         then if use_html
              then link hm ("sw" </> pr </> "html" </> nm <.> "scm.html") "scm"
              else link' hm "rsc3" ("help/graph" </> nm) "scm" "scm"
         else return Nothing
  dot <- if False
         then link hm ("sw" </> pr </> "dot" </> nm <.> "dot") "dot"
         else return Nothing
  pdf <- link hm ("sw" </> pr </> "pdf" </> nm <.> "pdf") "pdf"
  svg <- link hm ("sw" </> pr </> "svg" </> nm <.> "svg") "svg"
  let ln = intercalate "," (catMaybes (hs ++ [fs,scd,lsp,scm,dot,pdf,svg]))
  return (printf "- %s [%s]" nm ln)

-- > mk_ix ("/home/rohan","hsc3-graphs",False,True)
mk_ix :: State -> IO ()
mk_ix st = do
  let (hm,pr,_,_) = st
  d <- getDirectoryContents (hm </> "sw" </> pr </> "gr")
  let hs = mapMaybe (stripSuffix ".hs") (filter (".hs" `isSuffixOf`) d)
      nm = map (strip_suffix_or_id alternates') hs
  e <- mapM (entry st) (nub (sort nm))
  writeFile (hm </> "sw" </> pr </> "md/ix.md") (unlines e)

main :: IO ()
main = do
  [pr] <- getArgs
  hm <- getHomeDirectory
  let st = (hm,pr,False,True)
  mk_ix st
