import Data.List {- base -}
import Data.Maybe {- base -}
import System.Directory  {- directory -}
import System.FilePath  {- filepath -}
import Text.Printf {- base -}

import L

dir :: FilePath
dir = "sw/hsc3-graphs"

scm_dir :: FilePath
scm_dir = "sw/rsc3/help/graph"

link :: FilePath -> FilePath -> String -> IO (Maybe String)
link h p c = do
  e <- doesFileExist (h </> p)
  let r = if e then Just (printf "[%s](%s)" c p) else Nothing
  return r

use_html :: Bool
use_html = True

type M_Str = Maybe String
type HS_LN = (M_Str,M_Str,M_Str,M_Str,M_Str,M_Str)

hs_plain :: FilePath -> FilePath -> IO HS_LN
hs_plain h nm = do
  hs <- link h (dir </> "gr" </> nm <.> "hs") "hs"
  m_hs <- link h (dir </> "gr" </> nm ++ "-m" <.> "hs") "m/hs"
  u_hs <- link h (dir </> "gr" </> nm ++ "-u" <.> "hs") "u/hs"
  hp_hs <- link h (dir </> "gr" </> nm ++ "-hp" <.> "hs") "hp/hs"
  she_hs <- link h (dir </> "gr" </> nm ++ "-she" <.> "hs") "she/hs"
  p_hs <- link h (dir </> "gr" </> nm ++ "-p" <.> "hs") "p/hs"
  return (hs,m_hs,u_hs,hp_hs,she_hs,p_hs)

hs_html :: FilePath -> FilePath -> IO HS_LN
hs_html h nm = do
  hs <- link h (dir </> "html" </> nm <.> "hs.html") "hs"
  m_hs <- link h (dir </> "html" </> nm ++ "-m" <.> "hs.html") "hs-m"
  u_hs <- link h (dir </> "html" </> nm ++ "-u" <.> "hs.html") "hs-u"
  hp_hs <- link h (dir </> "html" </> nm ++ "-hp" <.> "hs.html") "hs-hp"
  she_hs <- link h (dir </> "html" </> nm ++ "-she" <.> "hs.html") "hs-she"
  p_hs <- link h (dir </> "html" </> nm ++ "-p" <.> "hs.html") "hs-p"
  return (hs,m_hs,u_hs,hp_hs,she_hs,p_hs)

entry :: FilePath -> String -> IO String
entry h nm = do
  (hs,m_hs,u_hs,hp_hs,she_hs,p_hs) <- if use_html
                                      then hs_html h nm
                                      else hs_plain h nm
  scd <- link h (dir </> "gr" </> nm <.> "scd") "scd"
  scm <- link h (scm_dir </> nm <.> "scm") "scm"
  dot <- link h (dir </> "dot" </> nm <.> "dot") "dot"
  pdf <- link h (dir </> "pdf" </> nm <.> "pdf") "pdf"
  svg <- link h (dir </> "svg" </> nm <.> "svg") "svg"
  let ln = intercalate "," (catMaybes [hs,m_hs,u_hs,hp_hs,she_hs,p_hs
                                      ,scd,scm,dot,pdf,svg])
  return (printf "- %s [%s]" nm ln)

main :: IO ()
main = do
  h <- getHomeDirectory
  d <- getDirectoryContents (h </> dir </> "gr")
  let hs = mapMaybe (stripSuffix ".hs") (filter (".hs" `isSuffixOf`) d)
      nm = map (strip_suffix_or_id ["-m","-u","-hp"]) hs
  e <- mapM (entry h) (nub (sort nm))
  writeFile (h </> dir </> "md/ix.md") (unlines e)
